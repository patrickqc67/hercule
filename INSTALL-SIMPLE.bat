@echo off
title CodePhantom - Installation Simple
cls

echo ========================================
echo   Installation Rapide CodePhantom
echo ========================================
echo.

:: Aller dans le répertoire
cd /d "%~dp0"

echo Installation des dépendances...
npm install

echo.
echo Création des dossiers...
if not exist "data" mkdir data

echo.
echo ========================================
echo   INSTALLATION TERMINÉE!
echo ========================================
echo.
echo Pour démarrer: Double-cliquez sur CodePhantom.bat
echo.
pause