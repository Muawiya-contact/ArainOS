# Contributing to Arain OS

Thank you for your interest in contributing to Arain OS! This guide will help you get started.

---

## 🛠 Development Environment Setup

### Required Tools

- **NASM** – Netwide Assembler for bootloader compilation
- **GCC** – GNU C compiler (with 32-bit support)
- **LD** – GNU linker
- **QEMU** – Virtual machine for testing
- **Git** – Version control
- **Make** – Build automation (Linux/macOS/WSL)

### Installation

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get update
sudo apt-get install -y nasm gcc-multilib qemu-system-x86 make
```

#### macOS (using Homebrew)
```bash
brew install nasm qemu make
# GCC should be available via Xcode Command Line Tools
```

#### Windows (WSL - Windows Subsystem for Linux)
Install WSL, then follow Linux instructions above.

#### Windows (Native)
- Download and install NASM from https://www.nasm.us/
- Download and install MinGW-w64 for GCC
- Download and install QEMU from https://www.qemu.org/download/
- Add tools to your system PATH

---

## 🏗 Building the Project

### Using Makefile (Linux/macOS/WSL)

The project includes a Makefile for automated builds:

```bash
# Build the OS
make

# Build and run in QEMU
make run

# Clean build artifacts
make clean
```

### Manual Build Steps (All Platforms)

#### 1. Assemble Bootloader
**Linux/macOS/WSL:**
```bash
nasm -f bin boot/boot.asm -o build/boot.bin
```

**Windows:**
```powershell
nasm boot\boot.asm -f bin -o build\boot.bin
```

#### 2. Compile Kernel
**Linux/macOS/WSL:**
```bash
gcc -ffreestanding -O2 -m32 -c kernel/kernel.c -o build/kernel.o
```

**Windows:**
```powershell
gcc -ffreestanding -c kernel\kernel.c -o build\kernel.o
```

#### 3. Link Kernel
**Linux/macOS/WSL:**
```bash
ld -Ttext 0x1000 build/kernel.o -o build/kernel.bin
```

**Windows:**
```powershell
ld -Ttext 0x1000 build\kernel.o -o build\kernel.bin
```

#### 4. Combine Bootloader + Kernel
**Linux/macOS/WSL:**
```bash
cat build/boot.bin build/kernel.bin > build/arainos.bin
```

**Windows:**
```powershell
copy /b build\boot.bin + build\kernel.bin build\arainos.bin
```

#### 5. Run in QEMU
**Linux/macOS/WSL:**
```bash
qemu-system-x86_64 -drive format=raw,file=build/arainos.bin
```

**Windows:**
```powershell
"C:\Program Files\qemu\qemu-system-x86_64.exe" build\arainos.bin
```

---

## 📝 Coding Conventions

### Assembly (boot/boot.asm)
- Use Intel syntax (NASM default)
- Comment complex instructions
- Keep bootloader under 512 bytes (boot sector size)
- Use meaningful label names

### C (kernel/kernel.c)
- Freestanding C (no standard library)
- Use clear variable names
- Comment non-obvious code sections
- Follow existing code style (K&R-style bracing)

### General Guidelines
- Keep code simple and educational
- Write self-documenting code where possible
- Add comments for OS-specific concepts (e.g., VGA memory addresses)
- Test all changes in QEMU before committing

---

## 🧪 Testing

### Local Testing
1. Build the project using `make` or manual steps
2. Run in QEMU: `make run` or manual command
3. Verify expected output:
   - Bootloader message: "Arain OS booting Kernel..."
   - Kernel message: "Arain" displayed on screen
4. Press `Ctrl+C` or close QEMU window to exit

### CI Testing
- GitHub Actions automatically builds the project on every push and pull request
- Check the Actions tab for build status
- Download the `arainos-bin` artifact to test the built OS

---

## 🔄 Contribution Workflow

### 1. Fork and Clone
```bash
# Fork the repository on GitHub, then:
git clone https://github.com/YOUR_USERNAME/ArainOS.git
cd ArainOS
```

### 2. Create a Branch
```bash
# Create a descriptive branch name
git checkout -b feature/your-feature-name
# or
git checkout -b fix/issue-description
```

### 3. Make Changes
- Write code following the conventions above
- Test locally using `make` and `make run`
- Commit with clear, descriptive messages

```bash
git add .
git commit -m "Add feature: brief description"
```

### 4. Push and Create PR
```bash
git push origin your-branch-name
```
Then create a Pull Request on GitHub with:
- Clear title describing the change
- Description of what was changed and why
- Reference any related issues (e.g., "Fixes #123")

### 5. Code Review
- Respond to feedback promptly
- Make requested changes in new commits
- Keep the PR focused (one feature/fix per PR)

---

## 📋 Opening Issues

When opening an issue, please include:
- **Clear title** – Brief description of the problem/request
- **Description** – Detailed explanation
- **Steps to reproduce** (for bugs)
- **Expected vs actual behavior** (for bugs)
- **Environment** – OS, tool versions, etc.
- **Screenshots** – If applicable

---

## 📚 Resources

- [OSDev Wiki](https://wiki.osdev.org/) – Comprehensive OS development resources
- [NASM Documentation](https://www.nasm.us/xdoc/2.15.05/html/nasmdoc0.html)
- [GCC Manual](https://gcc.gnu.org/onlinedocs/)
- [QEMU Documentation](https://www.qemu.org/docs/master/)

---

## 🤝 Community Guidelines

- Be respectful and constructive in discussions
- Help others learn – this is an educational project
- Keep the focus on OS development and learning
- Follow the [Code of Conduct](https://github.com/Muawiya-contact/ArainOS/blob/main/CODE_OF_CONDUCT.md) (if available)

---

## ❓ Questions?

If you have questions about contributing, feel free to:
- Open a discussion on GitHub
- Comment on relevant issues or PRs
- Reach out to the maintainers

Happy coding! 🚀
