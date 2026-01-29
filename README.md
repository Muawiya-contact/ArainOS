# Arain OS

**Arain OS** is a custom educational operating system developed from scratch using **Assembly** and **C**.  
The goal is to build a small but fully functional OS over **8 weeks**, running in a virtual machine.

---

## 🌟 Project Overview

- Bootloader written in **Assembly (NASM)**  
- Kernel written in **C (freestanding)**  
- Runs safely in **QEMU**  
- Goal: Understand OS concepts like **booting, kernel, interrupts, and keyboard input**  

---

## 📁 Project Structure

```
ArainOS/
├── boot/ # Bootloader source code (ASM)
│ └── boot.asm
├── kernel/ # Kernel source code (C)
│ └── kernel.c
├── build/ # Compiled binaries
├── docs/ # Notes and documentation
├── screenshots/ # Screenshots of OS running in VM
├── .gitignore/
└── README.md # This file
```


---

## 🛠 Tools Used

- **NASM** – Assembler for bootloader  
- **GCC** – Freestanding C compiler for kernel  
- **LD** – Linker for kernel  
- **QEMU** – Virtual machine for testing OS  
- **Git** – Version control  
- **GitHub** – Remote repository

---

## 🗓 8-Week Roadmap

| Week | Goal / Task | Status |
|------|-------------|--------|
| 1 | Setup project, install NASM, GCC, QEMU; write bootloader that prints message | ✅ Done |
| 2 | Create freestanding C kernel; bootloader jumps to kernel; kernel prints text | ✅ Done |
| 3 | Implement keyboard input via interrupts; make OS interactive | 🔜 Planned |
| 4 | Implement basic memory management; support multiple characters on screen | 🔜 Planned |
| 5 | Implement simple file system (load data from disk image) | 🔜 Planned |
| 6 | Add simple task switching / multitasking | 🔜 Planned |
| 7 | Implement basic timer interrupts and hardware integration | 🔜 Planned |
| 8 | Finalize OS; full demo with keyboard input, multitasking, and display | 🔜 Planned |

---

## 🏃 How to Build and Run (Week 2 Example)

### 1. Assemble Bootloader
```powershell
nasm boot\boot.asm -f bin -o build\boot.bin
```
2. Compile Kernel
```powershell
gcc -ffreestanding -c kernel\kernel.c -o build\kernel.o
```
4. Link Kernel
```powershell
ld -Ttext 0x1000 build\kernel.o -o build\kernel.bin
```

6. Combine Bootloader + Kernel
```powershell
copy /b build\boot.bin + build\kernel.bin build\arainos.bin
```

8. Run in QEMU
```powershell
"C:\Program Files\qemu\qemu-system-x86_64.exe" build\arainos.bin
```

### ✅ Output:

+ Bootloader prints: `"Arain OS booting Kernel..."`

+ Kernel prints: `"Arain"` on the screen

## 📸Screen Shorts
<img src="https://github.com/Muawiya-contact/ArainOS/blob/main/screenshorts/Screenshot%202026-01-29%20212704.png">

