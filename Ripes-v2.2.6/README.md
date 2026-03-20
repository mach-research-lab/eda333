# Running Ripes on macOS (EDA333)

## Setup

1. Download or clone this repository.
2. Navigate to:

```
eda333/Ripes-v2.2.6/
```

You should see:

* `Ripes-v2.2.6-77-g4981e31-mac-universal2.zip`

---

## ⚠️ First-time macOS security step

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

## Launching Ripes (Important)

Do **NOT** open the `.app` directly (it may crash).

Instead, use the launcher script.

---

## 🔧 Create the launcher

Open **Terminal** and run:

```bash
# you should be here eda333/Ripes-v2.2.6

chmod +x ./create_launcher_mac.sh
sh ./create_launcher_mac.sh
chmod +x Ripes.command
```

This script will create the file `Ripes.command` in the same folder.

---

## ▶️ Run Ripes

Now, double-click:

```
Ripes.command
```

If macOS warns you:

* Right-click → **Open**

---

## 🧩 Setup C Compiler (IMPORTANT)
⚠️ Do this while Ripes is open.

In 
```bash
eda333/toolchains
```
folder you will find 4 different folders for different operative systems. Unzip the one for MacOS
```bash
riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-apple-darwin
```


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

## ⚙️ Configure compiler inside Ripes

1. In Ripes, go to:

```
Ripes → Preferences → Compiler
```

2. Set the compiler path to:

```
toolchains/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-apple-darwin/bin/riscv64-unknown-elf-gcc.exe
```

3. Wait until the indicator turns **green**.

✅ The C compiler is now correctly configured.

---

## 🧠 Notes

* The launcher is required due to a macOS + Qt compatibility issue.
* It forces a safe rendering mode (`Fusion`) to prevent crashes.
* The setup is fully local and does not depend on installation paths.

---

## ✅ Summary

* Open the `.app` once to allow it
* Run Ripes using:

  ```
  Ripes.command
  ```
* Configure the compiler once in Preferences
