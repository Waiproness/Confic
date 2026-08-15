@echo off
title Photobooth App - Installer
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Saart-Process cmd -ArgumentList '/c cd /d ""%~dp0"" && ""%~nx0""' -Verb RunAs"
    exit /b
)

echo ==========================================
echo    Photobooth Environment Installer
echo ==========================================

set "CONDA_PATH="
if exist "%USERPROFILE%\miniconda3\Scripts\activate.bat" (
    set "CONDA_PATH=%USERPROFILE%\miniconda3\Scripts\activate.bat"
) else if exist "%USERPROFILE%\anaconda3\Scripts\activate.bat" (
    set "CONDA_PATH=%USERPROFILE%\anaconda3\Scripts\activate.bat"
)

call "%CONDA_PATH%" base
conda config --set solver libmamba >nul 2>&1

>nul 2>&1 conda create -n photobooth -c conda-forge python=3.10 pyqt6 pillow pyyaml piexif requests -y

echo [SUCCESS] Environment created successfully!
pause
