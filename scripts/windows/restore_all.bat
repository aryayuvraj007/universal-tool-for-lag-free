@echo off
chcp 65001 >nul
echo ================================================================
echo       Universal Android 1-Click Restore Tool
echo ================================================================
echo.
echo Re-installing packages from all brand lists...
for %%F in (..\..\lists\*.txt) do (
    if not "%%~nxF"=="protected_critical.txt" (
        echo Restoring packages from %%~nxF...
        for /f "usebackq tokens=1 eol=# delims= " %%P in ("%%F") do (
            if not "%%P"=="" (
                adb shell cmd package install-existing %%P >nul 2>&1
            )
        )
    )
)
echo.
echo Restoring default 1.0x animation scales...
adb shell settings put global window_animation_scale 1.0
adb shell settings put global transition_animation_scale 1.0
adb shell settings put global animator_duration_scale 1.0

echo.
echo ================================================================
echo Restoration complete! All packages and animations restored.
echo ================================================================
pause
