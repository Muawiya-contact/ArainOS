NASM = nasm
CC   = gcc
LD   = ld
CFLAGS = -ffreestanding -O2 -m32 -c -fno-pic -fno-pie
LDFLAGS = -m elf_i386 -Ttext 0x1000 --oformat binary

BUILD_DIR = build

.PHONY: all clean run

all: $(BUILD_DIR)/arainos.bin

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/boot.bin: boot/boot.asm | $(BUILD_DIR)
	$(NASM) -f bin boot/boot.asm -o $(BUILD_DIR)/boot.bin

$(BUILD_DIR)/kernel.o: kernel/kernel.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) kernel/kernel.c -o $(BUILD_DIR)/kernel.o

$(BUILD_DIR)/kernel.bin: $(BUILD_DIR)/kernel.o
	$(LD) $(LDFLAGS) $(BUILD_DIR)/kernel.o -o $(BUILD_DIR)/kernel.bin

$(BUILD_DIR)/arainos.bin: $(BUILD_DIR)/boot.bin $(BUILD_DIR)/kernel.bin
	cat $(BUILD_DIR)/boot.bin $(BUILD_DIR)/kernel.bin > $(BUILD_DIR)/arainos.bin

run: all
	qemu-system-x86_64 -drive format=raw,file=$(BUILD_DIR)/arainos.bin

clean:
	rm -rf $(BUILD_DIR)
