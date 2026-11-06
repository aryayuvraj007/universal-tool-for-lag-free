#!/bin/bash
echo "Restoring packages from all brand lists..."
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

echo "Restoration complete! All packages and animations restored."
