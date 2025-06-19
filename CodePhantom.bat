@echo off
title CodePhantom - Assistant IA de développement
color 0A

:: Aller dans le répertoire du script
cd /d "%~dp0"

:: Variables d'environnement
set NODE_ENV=production
set PORT=3001
set DATABASE_URL=sqlite:./data/codephantom.db

:: Vérifier si l'installation a été faite
if not exist "node_modules\" (
    echo.
    echo [ERREUR] CodePhantom n'est pas installé
    echo Veuillez d'abord exécuter INSTALLER.bat
    echo.
    pause
    exit /b 1
)

:: Créer le répertoire de données s'il n'existe pas
if not exist "data\" mkdir data

:: Démarrer l'application
echo.
echo ========================================
echo   CodePhantom - Démarrage
echo   Assistant IA de développement
echo ========================================
echo.
echo [INFO] Démarrage de l'application...
echo.
echo L'interface web va s'ouvrir dans votre navigateur
echo sur: http://localhost:3001
echo.
echo Page d'accueil: "Programmez avec l'aide de l'IA"
echo.
echo Pour arrêter l'application:
echo - Fermez cette fenêtre
echo - Ou appuyez sur Ctrl+C
echo.

:: Démarrer le serveur
start "" "http://localhost:3001"
call npm run dev

echo.
echo [INFO] Application fermée
pause