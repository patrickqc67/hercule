@echo off
title ?? CodePhantom - Serveur Portable
color 0A
cls

echo ==================================================
echo      ?? CodePhantom - Build et Lancement ??
echo ==================================================

echo ?? Nettoyage de l'ancien build...
rmdir /s /q dist 2>nul

echo ?? Build en cours...
call npm run build

IF %ERRORLEVEL% NEQ 0 (
    echo ? La compilation a échoué. Corrige les erreurs ci-dessus.
    pause
    exit /b
)

echo ? Build réussi !
echo ?? Lancement du serveur...

start "" http://localhost:3001

node dist/index.js

pause
