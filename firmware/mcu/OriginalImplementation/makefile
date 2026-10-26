TARGET = KeccakFW

# List C source files
SRC += KeccakFW.c

VPATH += ../../hal/stm32f4

SRC += stm32f4_hal.c

# List ASM sources
ASRC += Keccak1600NoOpt.S

# Include paths
CFLAGS += -I./../../hal/stm32f4

# ---------------------------------------------------------------------------

ifeq ($(CRYPTO_OPTIONS),)
CRYPTO_OPTIONS = AES128C
endif

# Add simpleserial project
include ../simpleserial/Makefile.simpleserial

# Firmware include
FIRMWAREPATH = ../.
include $(FIRMWAREPATH)/Makefile.inc

# ---------------------------------------------------------------------------
# Opcional: regla personalizada si tu ASM no termina en mayúscula .S
# (Makefile.inc espera .S, así que si tu archivo es .s, renómbralo o compila explícitamente)
$(OBJDIR)/%.o : %.s $(OBJDIR)
	@echo Assembling: $<
	arm-none-eabi-gcc -c -mcpu=cortex-m4 -mthumb -I. $< -o $@