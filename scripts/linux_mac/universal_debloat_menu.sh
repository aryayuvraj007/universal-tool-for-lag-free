#!/bin/bash

function process_list() {
    list_file="$1"
    if [ ! -f "$list_file" ]; then
        echo "[ERROR] File not found: $list_file"
        return
    fi
    echo "Processing $list_file..."
    while IFS= read -r line || [ -n "$line" ]; do
        # Strip comments and trim whitespace
        pkg=$(echo "$line" | sed 's/#.*//' | tr -d '[:space:]')
        if [ -n "$pkg" ]; then
            echo "Uninstalling: $pkg"
            adb shell pm uninstall -k --user 0 "$pkg"
        fi
    done < "$list_file"
    echo "Finished $list_file!"
}

while true; do
    clear
    echo "================================================================"
    echo "       Universal Android Debloat & Gaming Optimizer 🚀"
    echo "================================================================"
    echo ""
    echo "Connected Device:"
    adb devices
    echo "----------------------------------------------------------------"
    echo "Choose your action / phone brand:"
    echo ""
    echo "  [1] Universal Bloat (Facebook, Microsoft, Netflix, Amazon)"
    echo "  [2] Samsung (One UI)"
    echo "  [3] Xiaomi / Redmi / POCO (MIUI & HyperOS)"
    echo "  [4] Vivo / iQOO (Funtouch OS & OriginOS)"
    echo "  [5] OnePlus / Oppo / Realme (ColorOS, OxygenOS, Realme UI)"
    echo "  [6] Motorola (MyUX & Hello UI)"
    echo "  [7] Optional Google Bloat (Wellbeing, Google TV, Podcasts)"
    echo ""
    echo "  [8] Speed Boost: Set UI Animations to 0.5x"
    echo "  [9] Check Memory & Active Packages Count"
    echo "  [10] Universal Restore Tool (Re-enable all uninstalled apps)"
    echo "  [0] Exit"
    echo "================================================================"
    read -p "Enter choice [0-10]: " choice

    case $choice in
        1) process_list "../../lists/universal_bloatware.txt" ;;
        2) process_list "../../lists/samsung.txt" ;;
        3) process_list "../../lists/xiaomi.txt" ;;
        4) process_list "../../lists/vivo_iqoo.txt" ;;
        5) process_list "../../lists/oppo_realme_oneplus.txt" ;;
        6) process_list "../../lists/motorola.txt" ;;
        7) process_list "../../lists/google_optional.txt" ;;
        8) 
            adb shell settings put global window_animation_scale 0.5
            adb shell settings put global transition_animation_scale 0.5
            adb shell settings put global animator_duration_scale 0.5
            echo "Animation scales set to 0.5x!"
            ;;
        9) 
            echo "Active packages: $(adb shell pm list packages -e | wc -l)"
            adb shell dumpsys meminfo | grep -E 'Total RAM|Free RAM|Used RAM'
            ;;
        10)
            for f in ../../lists/*.txt; do
                if [ "$(basename "$f")" != "protected_critical.txt" ]; then
                    while IFS= read -r line || [ -n "$line" ]; do
                        pkg=$(echo "$line" | sed 's/#.*//' | tr -d '[:space:]')
                        if [ -n "$pkg" ]; then
                            adb shell cmd package install-existing "$pkg" > /dev/null 2>&1
                        fi
                    done < "$f"
                fi
            done
            adb shell settings put global window_animation_scale 1.0
            adb shell settings put global transition_animation_scale 1.0
            adb shell settings put global animator_duration_scale 1.0
            echo "Restoration complete!"
            ;;
        0) exit 0 ;;
        *) echo "Invalid option." ;;
    esac
    read -p "Press Enter to continue..."
done
