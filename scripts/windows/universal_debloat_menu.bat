@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:MENU
cls
echo ================================================================
echo       Universal Android Debloat & Gaming Optimizer 🚀
echo ================================================================
echo.
echo Connected Device:
adb devices
echo ----------------------------------------------------------------
echo Choose your action / phone brand:
echo.
echo   [1] Universal Bloat (Facebook, Microsoft, Netflix, Amazon)
echo   [2] Samsung (One UI)
echo   [3] Xiaomi / Redmi / POCO (MIUI & HyperOS)
echo   [4] Vivo / iQOO (Funtouch OS & OriginOS)
echo   [5] OnePlus / Oppo / Realme (ColorOS, OxygenOS, Realme UI)
echo   [6] Motorola (MyUX & Hello UI)
echo   [7] Optional Google Bloat (Wellbeing, Google TV, Podcasts)
echo.
echo   [8] Speed Boost: Set UI Animations to 0.5x
echo   [9] Check Memory & Active Packages Count
echo   [10] Universal Restore Tool (Re-enable all uninstalled apps)
echo   [0] Exit
echo ================================================================
set /p CHOICE="Enter choice [0-10]: "

if "%CHOICE%"=="1" goto DEBLOAT_UNIVERSAL
if "%CHOICE%"=="2" goto DEBLOAT_SAMSUNG
if "%CHOICE%"=="3" goto DEBLOAT_XIAOMI
if "%CHOICE%"=="4" goto DEBLOAT_VIVO
if "%CHOICE%"=="5" goto DEBLOAT_OPPO
if "%CHOICE%"=="6" goto DEBLOAT_MOTO
if "%CHOICE%"=="7" goto DEBLOAT_GOOGLE
if "%CHOICE%"=="8" goto SPEED_OPTIMIZE
if "%CHOICE%"=="9" goto CHECK_MEM
if "%CHOICE%"=="10" goto RESTORE_ALL
if "%CHOICE%"=="0" exit /b
goto MENU

:PROCESS_LIST
set "LIST_FILE=%~1"
if not exist "%LIST_FILE%" (
    echo [ERROR] List file not found: %LIST_FILE%
    pause
    goto MENU
)
echo Processing %LIST_FILE%...
for /f "usebackq tokens=1 eol=# delims= " %%P in ("%LIST_FILE%") do (
    if not "%%P"=="" (
        echo Uninstalling: %%P
        adb shell pm uninstall -k --user 0 %%P
    )
)
echo.
echo Finished processing %LIST_FILE%!
pause
goto MENU

:DEBLOAT_UNIVERSAL
call :PROCESS_LIST "..\..\lists\universal_bloatware.txt"
goto MENU

:DEBLOAT_SAMSUNG
call :PROCESS_LIST "..\..\lists\samsung.txt"
goto MENU

:DEBLOAT_XIAOMI
call :PROCESS_LIST "..\..\lists\xiaomi.txt"
goto MENU

:DEBLOAT_VIVO
call :PROCESS_LIST "..\..\lists\vivo_iqoo.txt"
goto MENU

:DEBLOAT_OPPO
call :PROCESS_LIST "..\..\lists\oppo_realme_oneplus.txt"
goto MENU

:DEBLOAT_MOTO
call :PROCESS_LIST "..\..\lists\motorola.txt"
goto MENU

:DEBLOAT_GOOGLE
call :PROCESS_LIST "..\..\lists\google_optional.txt"
goto MENU

:SPEED_OPTIMIZE
echo.
echo Setting window, transition, and animator scales to 0.5x...
adb shell settings put global window_animation_scale 0.5
adb shell settings put global transition_animation_scale 0.5
adb shell settings put global animator_duration_scale 0.5
echo Animation scales set to 0.5x successfully!
pause
goto MENU

:CHECK_MEM
echo.
echo ================================================================
echo [1] Active Enabled Packages Count:
adb shell pm list packages -e | find /c /v ""
echo.
echo [2] RAM & Memory Usage:
adb shell "dumpsys meminfo | grep -E 'Total RAM|Free RAM|Used RAM'"
echo.
echo [3] Current Animation Scales:
echo Window scale:
adb shell settings get global window_animation_scale
echo Transition scale:
adb shell settings get global transition_animation_scale
echo Animator scale:
adb shell settings get global animator_duration_scale
echo ================================================================
pause
goto MENU

:RESTORE_ALL
echo.
echo Re-enabling packages from all brand lists...
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
echo All packages and animation scales restored!
pause
goto MENU
