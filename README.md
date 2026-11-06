# Universal Android Debloat & Gaming Optimization Tool 🚀

[![Platform](https://img.shields.io/badge/Platform-Android%208.0%20to%2015+-brightgreen.svg)](#)
[![Brands Supported](https://img.shields.io/badge/Brands-Samsung%20%7C%20Xiaomi%20%7C%20Vivo%20%7C%20OnePlus%20%7C%20Realme%20%7C%20Oppo%20%7C%20Motorola-blue.svg)](#)
[![Root Required](https://img.shields.io/badge/Root-NOT%20Required-brightgreen.svg)](#)
[![License](https://img.shields.io/badge/License-MIT-orange.svg)](LICENSE)

An all-in-one, safe, non-destructive, and **100% reversible** debloating toolkit for **ALL Android phones**. It stops persistent background CPU polling, telemetry, and OEM ad engines to free up **~500 MB to 1.2 GB of RAM**, stabilize frame rates in games (BGMI, Free Fire, COD Mobile, Genshin Impact), and eliminate micro-stutters.

---

## 📱 Supported Brands & OEM Skins

| Brand | System Skin | Covered Bloatware |
| :--- | :--- | :--- |
| **Universal** | All Android Devices | Facebook daemons, Microsoft preloads, Netflix stubs, Amazon, Google redundant apps |
| **Samsung** | One UI | Samsung Free, Glance lockscreen ads, AR Doodle/Zone, Bixby Voice, Samsung Internet |
| **Xiaomi / Redmi / POCO** | MIUI / HyperOS | MSA (Ad engine), Analytics, GetApps, YellowPages, Mi Video, Quick Apps |
| **Vivo / iQOO** | Funtouch OS / OriginOS | Lockscreen Magazine ads, Jovi Assistant, Vivo Cloud, Vivo Browser, EasyShare |
| **OnePlus / Oppo / Realme** | OxygenOS / ColorOS / Realme UI | HeyTap Market, HeyTap Pictorial (ads), Theme Store, Soloop, O-Roaming |
| **Motorola** | MyUX / Hello UI | Moto Help, Partner preloads (BRApps), Demo stubs |

---

## ⚡ What Does This Tool Do?

1. **Reclaims 500 MB – 1.2 GB of RAM**: Stops idle background services that hog your memory.
2. **Flattens Frametimes & Prevents Thermal Stutters**: Background crawlers won't wake up your CPU cores while gaming.
3. **50% Snappier UI**: Sets system animation scales (`window`, `transition`, and `animator`) to **0.5x**.
4. **100% Reversible**: Every package is uninstalled for `user 0` only (`pm uninstall -k --user 0`). The APK remains in `/system` and can be restored with a single click.
5. **Zero Risk to Core Functions**: Phone calls, SMS, Camera, In-display fingerprint, Wi-Fi, Bluetooth, Google Play Store, and OEM accounts are **strictly protected**.

---

## 📁 Repository Structure

```text
universal-android-debloat-tool/
├── README.md                          # Documentation & Guide
├── LICENSE                            # Open-source MIT License
├── .gitignore                         # Temporary files filter
│
├── lists/                             # Modular Bloatware & Protection lists
│   ├── universal_bloatware.txt        # Meta/Facebook, Microsoft, Amazon, Netflix
│   ├── samsung.txt                    # Samsung One UI bloatware
│   ├── xiaomi.txt                     # MIUI / HyperOS ads & analytics
│   ├── vivo_iqoo.txt                  # Funtouch OS / OriginOS bloatware
│   ├── oppo_realme_oneplus.txt        # ColorOS / OxygenOS / Realme UI bloatware
│   ├── motorola.txt                   # Motorola preloads & partner stubs
│   ├── google_optional.txt            # Non-essential Google preloads (Wellbeing, TV)
│   └── protected_critical.txt         # Strictly protected core packages
│
└── scripts/
    ├── windows/
    │   ├── universal_debloat_menu.bat # Interactive menu (Choose brand or universal)
    │   ├── speed_optimizer_05x.bat    # Instant UI 0.5x speed scaler
    │   ├── check_device_stats.bat     # RAM & active package checker
    │   └── restore_all.bat            # 1-Click universal restore script
    │
    └── linux_mac/
        ├── universal_debloat_menu.sh  # Interactive bash menu for Linux / Mac
        ├── speed_optimizer_05x.sh     # Bash animation scaler
        └── restore_all.sh             # Bash universal restore script
```

---

## 🚀 How to Use (Step-by-Step)

### Step 1: Enable USB Debugging on Your Phone
1. Go to **Settings** > **About Phone**.
2. Tap **Build Number** (or *Software Version*) **7 times** until Developer Mode is unlocked.
3. Go to **Settings** > **Developer Options**:
   - Turn **ON** `USB Debugging`.
   - *(Xiaomi/Poco users)*: Turn **ON** `Install via USB` & `USB Debugging (Security settings)`.
   - *(Vivo/Oppo/Realme users)*: Turn **ON** `USB Debugging (Security settings)` if present.

### Step 2: Connect Phone to PC
1. Connect via USB cable (set USB mode to **File Transfer / MTP**).
2. On your phone screen, when the prompt appears:
   - Check **"Always allow from this computer"**
   - Tap **Allow** / **OK**.

---

### Step 3: Run the Tool

#### On Windows:
1. Double-click `scripts/windows/universal_debloat_menu.bat`.
2. Choose your phone brand from the interactive menu:
   - `[1]` Universal Bloat (Facebook, Microsoft, Netflix, Ad stubs)
   - `[2]` Samsung (One UI)
   - `[3]` Xiaomi / Redmi / POCO (MIUI / HyperOS)
   - `[4]` Vivo / iQOO (Funtouch OS)
   - `[5]` OnePlus / Oppo / Realme (ColorOS / Realme UI)
   - `[6]` Motorola
   - `[7]` Apply 0.5x Animation Scales (Instant snappiness)
   - `[8]` Check RAM & Active Packages
   - `[9]` Restore Everything (Undo)

#### On Linux / macOS:
```bash
chmod +x scripts/linux_mac/*.sh
./scripts/linux_mac/universal_debloat_menu.sh
```

---

## 🔄 How to Restore (1-Click Undo)

Run `scripts/windows/restore_all.bat` (or `./scripts/linux_mac/restore_all.sh`). 

This executes `cmd package install-existing <pkg>` for every package, bringing your phone back to factory state in seconds.

---

## 🛡️ Protected Packages (Never Touched)

To avoid system bootloops or broken core features, the following components are **permanently whitelisted**:
- **Calls & Telephony**: Dialer, Telecom, In-Call UI, Carrier Services
- **Messaging**: Default SMS, Google Messages
- **Hardware Drivers**: Camera, GPU/Vulkan, In-display fingerprint, Face unlock, Wi-Fi, Bluetooth, NFC
- **Google Core**: Google Play Store, Google Play Services
- **Brand Accounts**: Samsung Account, Xiaomi/Mi Account, Vivo Account, HeyTap ID
- **System**: Default Launcher, System Settings, Security/Permission Managers

---

## 📜 License & Contribution

Distributed under the **MIT License**. Contributions, pull requests, and additional brand package lists are welcome!
