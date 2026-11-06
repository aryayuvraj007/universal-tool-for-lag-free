@echo off
chcp 65001 >nul
echo ================================================================
echo       Universal Android 0.5x Speed Optimizer
echo ================================================================
echo.
adb shell settings put global window_animation_scale 0.5
adb shell settings put global transition_animation_scale 0.5
adb shell settings put global animator_duration_scale 0.5
echo Animation scales successfully set to 0.5x!
echo.
pause
