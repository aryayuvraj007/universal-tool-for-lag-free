@echo off
chcp 65001 >nul
echo ================================================================
echo       Android Memory & Active Packages Checker
echo ================================================================
echo.
echo [1] Active Enabled Packages Count:
adb shell pm list packages -e | find /c /v ""
echo.
echo [2] RAM & Memory Overview:
adb shell "dumpsys meminfo | grep -E 'Total RAM|Free RAM|Used RAM'"
echo.
echo [3] Current Animation Scales:
adb shell settings get global window_animation_scale
adb shell settings get global transition_animation_scale
adb shell settings get global animator_duration_scale
echo ================================================================
pause
