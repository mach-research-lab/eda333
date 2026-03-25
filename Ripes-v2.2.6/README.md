# Ripes Setup Guide

This guide covers how to launch the Ripes simulator and extract the RISC-V GCC toolchain on Linux, macOS, and Windows.

## Table of Contents

- [Linux Guide (Ubuntu 24.04.4 LTS)](#linux-guide-ubuntu-24044-lts)
- [macOS Guide (Tahoe)](#macos-guide-tahoe)
- [Windows Guide (Windows 11)](#windows-guide)

---

## Linux Guide (Ubuntu 24.04.4 LTS)

### 1. Clone Repository
1. Clone repository: ```git clone https://github.com/mach-research-lab/eda333.git ```

### 2. Extract C Compiler Toolchain
1. Extract toolchain: ```tar -xzvf eda333/toolchains/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14.tar.gz```

### 3. Open Ripes
1. Make file executable: ```chmod +x eda333/toolchains/Ripes-v2.2.6-77-g4981e31-linux-x86_64.AppImage```
2. Open Ripes: ``` eda333/toolchains/Ripes-v2.2.6-77-g4981e31-linux-x86_64.AppImage```

### 4. Setup C Compiler in Ripes

1. In Ripes, go to: ```Edit → Settings → Compiler```

2. Set the compiler path to:
```
eda333/toolchains/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-gcc
```
Wait until the indicator turns **green**.

---

## macOS Guide (Tahoe)

### Setup

1. Download or clone this repository.
2. Navigate to:

```
eda333/Ripes-v2.2.6/
```

You should see:

* `Ripes-v2.2.6-77-g4981e31-mac-universal2.zip`

---

### First-time macOS security step

**SPOILER ALERT - If you open the app normally it will crash. No worries we are solving the issue in this guide**

macOS may block the application the first time.

1. Unzip   
`Ripes-v2.2.6-77-g4981e31-mac-universal2.zip`

2. Right-click the `.app` file:

   ```
   Ripes-v2.2.6-77-g4981e31-mac-universal2.app
   ```
3. Click **Open**
4. If blocked:

   * Go to **System Settings → Privacy & Security**
   * Click **Open Anyway**

You only need to do this once.

---

### Launching Ripes (Important)

Do **NOT** open the `.app` directly (it may crash).

Instead, use the launcher script.

---

### Create the launcher

Open **Terminal** and run:

```bash
# you should be here eda333/Ripes-v2.2.6

chmod +x ./create_launcher_mac.sh
sh ./create_launcher_mac.sh
chmod +x Ripes.command
```

This script will create the file `Ripes.command` in the same folder.

---

### Run Ripes

Now, double-click:

```
Ripes.command
```

If macOS warns you:

* Right-click → **Open**

---

### Setup C Compiler (IMPORTANT)
Do this while Ripes is open.

In 
```bash
eda333/toolchains
```
folder you will find 4 different folders for different operative systems. Unzip the one for MacOS
```bash
riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-apple-darwin
```
**If you have problems unzipping the file, delete this one, download the compressed file from the GitHub website, place it in this folder, and redo the procedure.**

1. Open a **Terminal** window.
2. Navigate to the main repo folder:

```bash
cd eda333
```

3. Run the following commands:

```bash
find toolchains -type f -exec chmod u+w {} + 2>/dev/null
find toolchains -type f -exec xattr -d com.apple.quarantine {} + 2>/dev/null
```

This removes macOS security restrictions from the compiler.

---

### Configure compiler inside Ripes

1. In Ripes, go to:

```
Ripes → Preferences → Compiler
```

2. Set the compiler path to:

```
toolchains/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-apple-darwin/bin/riscv64-unknown-elf-gcc.exe
```

3. Wait until the indicator turns **green**.

The C compiler is now correctly configured.

---

### Notes

* The launcher is required due to a macOS + Qt compatibility issue.
* It forces a safe rendering mode (`Fusion`) to prevent crashes.
* The setup is fully local and does not depend on installation paths.

---

### Summary

* Open the `.app` once to allow it
* Run Ripes using:

  ```
  Ripes.command
  ```
* Configure the compiler once in Preferences

### Bugfixing
Devices with M1 chip might have issues with the app continuosly crashing. To fix:
* In the terminal to install Rosetta:
  ``` softwareupdate --install-rosetta --agree-to-license ```
* Change the last line of Ripes.command script from:
  ```"  exec "$BIN"  "``` to ```"  exec arch -x86_64 "$BIN"  " ```
* Run Ripes.command

## Windows Guide

### 1. Clone Repository
1. Download or clone repository: ```git clone https://github.com/mach-research-lab/eda333.git ``` (Note: cloning might create problems with Windows complaining about empty files. You can avoid this by downloading instead the zipped folder from the toolchains folder, or clicking <a href="https://github.com/mach-research-lab/eda333/raw/refs/heads/main/toolchains/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-w64-mingw32.zip?download=">here</a>
3. Unzip the repository
4. Unzip Ripes windows folder ```eda333\Ripes-v2.2.6-77-g4981e31-win-x86_64.zip```

### 2. Extract C Compiler Toolchain
1. Unzip the toolchain: ```eda333\toolchains\eda333\toolchains\riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-w64-mingw32.zip```

### 3. Open Ripes
1. Open Windows Terminal by right-clicking in the folder and selecting "Open in terminal", or select the folder bar and type "cmd".
2. Execute Ripes by typing: ```Ripes.exe```

### 4. Setup C Compiler in Ripes

1. In Ripes, go to: ```Edit → Settings → Compiler```

2. Set the compiler path to:
```
eda333/toolchains/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-w64-mingw32/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-w64-mingw32/bin/riscv64-unknown-elf-gcc.exe
```
Wait until the indicator turns **green**.

