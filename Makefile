TOOL = riscv-none-elf-
ASFLAGS = -march=rv32i -mabi=ilp32
LDFLAGS = --oformat=elf32-littleriscv
OPTIMIZE = -O3

all: main.elf itofFromC.elf

%.o: %.S
	$(TOOL)as $(ASFLAGS) -o $@ $<

main.o: main.c
	$(TOOL)gcc $(OPTIMIZE) -c $(ASFLAGS) -o $@ $<

main.elf: itof_clz.o main.o
	$(TOOL)gcc -o $@ *.o

itofFromC.elf: intfloat.c
	$(TOOL)gcc $(OPTIMIZE) -o $@ $(ASFLAGS) $<

clean:
	$(RM) main.elf itofFromC.elf *.o
