# Running Ripes on macOS (EDA333)

## Setup

1. Download or clone this repository.
2. Navigate to:

```
eda333/Ripes-v2.2.6/
```

You should see:

* `Ripes-v2.2.6-77-g4981e31-mac-universal2.app`

---

## ⚠️ First-time macOS security step

macOS may block the application the first time.

1. Right-click the `.app` file:

   ```
   Ripes-v2.2.6-77-g4981e31-mac-universal2.zip
   ```
2. Decompress it
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
This script will create the file Ripes.command in the same folder
---

## ▶️ Run Ripes

Now, double-click:

```
Ripes.command
```

If macOS warns you:

* Right-click → **Open**

---

Then launch with:

```
Ripes.command
```

---

## 🧠 Notes

* The launcher is required due to a macOS + Qt compatibility issue.
* It forces a safe rendering mode (`Fusion`) to prevent crashes.
* The setup is fully local and does not depend on installation paths.

---

## ✅ Summary

* Open the `.app` once to allow it
* Always run using:

  ```
  Ripes.command
  ```
