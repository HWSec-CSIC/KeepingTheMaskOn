#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include "simpleserial.h"





uint8_t seed_chacha20[32];
uint8_t initial_mask[2];
volatile uint8_t s0[200];
volatile uint8_t I0[200];

volatile uint8_t s1[200];
volatile uint8_t I1[200];

volatile uint8_t s2[200];
volatile uint8_t I2[200];

volatile uint8_t ISHARES[1328];

size_t n = 50;


uint8_t rec[200];
uint8_t rec_d[200];
uint8_t bytes_st[25][8];
uint8_t pt_marker[16];


volatile unsigned int *DWT_CYCCNT = (volatile unsigned int *)0xE0001004; //address of the register
volatile unsigned int *DWT_CONTROL = (volatile unsigned int *)0xE0001000; //address of the register
volatile unsigned int *SCB_DEMCR = (volatile unsigned int *)0xE000EDFC; //address of the register
uint32_t x, y, delta;
uint8_t num_cycles_bytes[4];


// ***********************************************************************
// ******************************* CHACHA20 ******************************
// ***********************************************************************

#define CHACHA20_BLOCK_SIZE 64
#define SEED_SIZE 32

int seed_counter = 0;
uint32_t prng_state;
uint8_t seed_chacha20[32];

typedef struct {
    uint32_t state[16];
    uint8_t keystream[CHACHA20_BLOCK_SIZE];
    int keystream_pos;
} chacha20_prng_t;

static chacha20_prng_t prng;
static const uint32_t chacha20_constants[4] = {
    0x61707865, 0x3320646e, 0x79622d32, 0x6b206574
};

#define ROTL(a,b) (((a) << (b)) | ((a) >> (32 - (b))))
#define QUARTERROUND(a,b,c,d) \
    a += b; d ^= a; d = ROTL(d,16); \
    c += d; b ^= c; b = ROTL(b,12); \
    a += b; d ^= a; d = ROTL(d,8);  \
    c += d; b ^= c; b = ROTL(b,7);

static void chacha20_block(uint32_t out[16], const uint32_t in[16]) {
    uint32_t x[16];
    memcpy(x, in, sizeof(uint32_t) * 16);

    for (int i = 0; i < 10; i++) {
        QUARTERROUND(x[0], x[4], x[8], x[12])
        QUARTERROUND(x[1], x[5], x[9], x[13])
        QUARTERROUND(x[2], x[6], x[10], x[14])
        QUARTERROUND(x[3], x[7], x[11], x[15])

        QUARTERROUND(x[0], x[5], x[10], x[15])
        QUARTERROUND(x[1], x[6], x[11], x[12])
        QUARTERROUND(x[2], x[7], x[8], x[13])
        QUARTERROUND(x[3], x[4], x[9], x[14])
    }

    for (int i = 0; i < 16; i++) {
        out[i] = x[i] + in[i];
    }
}

void prng_init(const uint8_t seed[32]) {
    prng.state[0] = chacha20_constants[0];
    prng.state[1] = chacha20_constants[1];
    prng.state[2] = chacha20_constants[2];
    prng.state[3] = chacha20_constants[3];

    for (int i = 0; i < 8; i++) {
        prng.state[4 + i] =
            ((uint32_t)seed[i*4]) |
            ((uint32_t)seed[i*4+1] << 8) |
            ((uint32_t)seed[i*4+2] << 16) |
            ((uint32_t)seed[i*4+3] << 24);
    }

    prng.state[12] = 0; // counter
    prng.state[13] = 0; prng.state[14] = 0; prng.state[15] = 0; // nonce

    prng.keystream_pos = CHACHA20_BLOCK_SIZE;
}

static void prng_generate_block() {
    chacha20_block((uint32_t*)prng.keystream, prng.state);
    prng.state[12]++;
    prng.keystream_pos = 0;
}

uint8_t prng_get_byte() {
    if (prng.keystream_pos >= CHACHA20_BLOCK_SIZE) {
        prng_generate_block();
    }
    return prng.keystream[prng.keystream_pos++];
}

uint64_t rand_share_64() {
    uint64_t r = 0;
    for (int i = 0; i < 8; i++) {
        r |= ((uint64_t)prng_get_byte()) << (8 * i);
    }
    return r;
}


// ***************************************************************************
// *****************************  BIT INTERLEAVING ***************************
// ***************************************************************************
void bit_interleave(const uint8_t s0[200], uint8_t I0[200]) {
    for (int blk = 0; blk < 200; blk += 8) {
        uint64_t word = 0;
        for (int j = 0; j < 8; j++) {
            word |= ((uint64_t)s0[blk + j]) << (8 * j);
        }

        uint8_t h[8] = {0};

        for (int bit = 0; bit < 64; bit++) {
            int byte_out, bit_out;
            uint8_t bitval = (word >> bit) & 1;

            if ((bit / 16) < 4) { 
                if ((bit % 2) == 0)
                    byte_out = (bit / 16);      
                else
                    byte_out = 4 + (bit / 16);  
                bit_out = (bit % 16) / 2;
            } else {
                continue; 
            }

            h[byte_out] |= bitval << bit_out;
        }

        for (int i = 0; i < 8; i++) {
            I0[blk + i] = h[i];
        }
    }
}


void bit_deinterleave(const uint8_t I0[200], uint8_t s0[200]) {
    for (int blk = 0; blk < 200; blk += 8) {
        uint64_t word = 0;

        for (int group = 0; group < 4; group++) {
            uint8_t even = I0[blk + group];     
            uint8_t odd  = I0[blk + 4 + group];  

            for (int k = 0; k < 8; k++) {
                uint8_t bit_even = (even >> k) & 1;
                uint8_t bit_odd  = (odd  >> k) & 1;

                int base = group * 16;

                word |= ((uint64_t)bit_even) << (base + 2 * k);
                word |= ((uint64_t)bit_odd)  << (base + 2 * k + 1);
            }
        }

        for (int j = 0; j < 8; j++) {
            s0[blk + j] = (word >> (8 * j)) & 0xFF;
        }
    }
}

// ***************************************************************************
// *************************** ASSEMBLY FUNCTION *************************
// ***************************************************************************
extern void KeccakF1600_StatePermute(void *share0);


// ***************************************************************************
// ********************************* CALLBACKS *******************************
// ***************************************************************************
uint8_t get_seed(uint8_t* seed, uint8_t len)
{
    int i;
    for(i=0; i<16; i++)
    {
        seed_chacha20[i+(seed_counter*16)] = seed[i]; 
    }
    seed_counter = (seed_counter + 1) % 2;
    if(seed_counter == 0)
    {
        prng_init(seed_chacha20);
    }
    simpleserial_put('r', 16, seed);
    return 0x00;
}

uint8_t get_mask(uint8_t* mask, uint8_t len)
{   
    int i;
    memcpy(&initial_mask[0], &mask[0], 16);
	simpleserial_put('r', 16, mask);
	return 0x00;
}

uint8_t get_pt(uint8_t* pt, uint8_t len)
{   
    int i;
    create_state(pt, len);
    mask_state();
    bit_interleave(s0, I0);
    bit_interleave(s1, I1);
    bit_interleave(s2, I2);
    for(i=0; i<200; i++)
    {
        ISHARES[i] = I0[i];
        ISHARES[i+200] = I1[i];
        ISHARES[i+400] = I2[i];
    }
    *SCB_DEMCR |= 0x01000000;
    *DWT_CYCCNT = 0; // reset the counter
    *DWT_CONTROL |= 1 ; // enable the counter
    x = *DWT_CYCCNT;
    trigger_high();
    KeccakF1600_StatePermute(ISHARES);
    trigger_low();
    y = *DWT_CYCCNT;
    delta = (y - x);
	simpleserial_put('r', 16, pt);
	return 0x00;
}


uint8_t get_res(uint8_t* lane, uint8_t len)
{   
    int j, i;
    uint8_t bytes_st_msg[8];

    for(i=0; i<200; i++)
    {
        I0[i] = ISHARES[i+0];
        I1[i] = ISHARES[i+200];
        I2[i] = ISHARES[i+400];
    }
    bit_deinterleave(I0,s0);
    bit_deinterleave(I1,s1);
    bit_deinterleave(I2,s2);
    
    unmask_state();
    for(i=0;i<25;i++)
    {
        for(j=0;j<8;j++)
        {
            bytes_st[i][j] = rec[0+8*i+j];
        }
    }

    i=(int)lane[0];
    for(j=0;j<8;j++)
    {
        bytes_st_msg[j] = bytes_st[i][j];
    }    

    simpleserial_put('m', 8, bytes_st_msg);
	return 0x00;
}

uint8_t get_cycles(uint8_t* cmd, uint8_t len)
{   
    num_cycles_bytes[0] = (uint8_t)(delta & 0xFF);        
    num_cycles_bytes[1] = (uint8_t)((delta >> 8) & 0xFF);
    num_cycles_bytes[2] = (uint8_t)((delta >> 16) & 0xFF);
    num_cycles_bytes[3] = (uint8_t)((delta >> 24) & 0xFF); 
	simpleserial_put('r', 4, num_cycles_bytes);
	return 0x00;
}


// ***************************************************************************
// *************** STATE CREATION + MASKING + UNMASKING FUNCTIONS **************
// ***************************************************************************

void create_state(uint8_t* plaintext, int len)
{
    int j=0;
    int i;
    int mdlen = 512; 
    int rsiz = 1600-2*mdlen; 
    int rsiz_bytes = rsiz/8; 
 
    for(i=0; i<200; i++)
    {
        s0[i] = 0;
    }


    for(i=0; i<len; i++)
    {
        s0[i] ^= plaintext[i];
    }
    s0[len] ^= 0x06;
    s0[(rsiz_bytes-1)] ^= 0x80;
}

void mask_state(void)
{
    int i;
    for(i=0; i<200; i++)
    {
        s1[i] = prng_get_byte();
        s2[i] = prng_get_byte();
        if(i < 16)
        {
            s0[i] = s0[i] ^ s1[i] ^ s2[i] ^ initial_mask[i];
        }
        else
        {
            s0[i] = s0[i] ^ s1[i] ^ s2[i];
        }
    }
}

void unmask_state(void)
{
    int i;
    for(i=0; i<200; i++)
    {
        rec[i] = s0[i] ^ s1[i] ^ s2[i]; 
    }
}



// ***************************************************************************
// ************************************ MAIN *********************************
// ***************************************************************************

int main(void) 
{
    platform_init();
    init_uart();
    trigger_setup();
    simpleserial_init();
    simpleserial_addcmd('p', 16,  get_pt);
    simpleserial_addcmd('r', 16, get_res);
    simpleserial_addcmd('s', 16, get_seed);
    simpleserial_addcmd('k', 16, get_mask);
    simpleserial_addcmd('c', 1, get_cycles);

    while(1)
    {
        simpleserial_get();
    }
}