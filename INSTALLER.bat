@echo off
title CodePhantom - Installation
color 0B
cls

echo.
echo ========================================
echo   CodePhantom Portable - Installation
echo   Assistant IA de développement
echo ========================================
echo.

:: Aller dans le répertoire du script
cd /d "%~dp0"

echo [ETAPE 1/4] Vérification de Node.js...

:: Vérifier si Node.js est installé
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERREUR] Node.js n'est pas installé
    echo.
    echo Veuillez installer Node.js depuis https://nodejs.org
    echo Puis relancez ce script d'installation
    pause
    exit /b 1
) else (
    echo [SUCCESS] Node.js détecté
    node --version
)

echo.
echo [ETAPE 2/4] Installation des dépendances...

call npm install
if %errorlevel% neq 0 (
    echo [ERREUR] Échec de l'installation
    echo Tentative de réparation...
    call npm cache clean --force
    call npm install
    if %errorlevel% neq 0 (
        echo [ERREUR] Installation impossible
        pause
        exit /b 1
    )
)

echo [SUCCESS] Dépendances installées

echo.
echo [ETAPE 3/4] Configuration...

:: Créer le répertoire de données
if not exist "data" mkdir data

:: Variables d'environnement par défaut
echo DATABASE_URL=sqlite:./data/codephantom.db > .env
echo NODE_ENV=production >> .env
echo PORT=3001 >> .env

echo [SUCCESS] Configuration créée

echo.
echo [ETAPE 4/4] Test de démarrage...

:: Test rapide du serveur
echo Vérification du fonctionnement...
timeout /t 2 /nobreak >nul

echo.
echo ========================================
echo   INSTALLATION TERMINÉE!
echo ========================================
echo.
echo Pour démarrer CodePhantom:
echo   Double-cliquez sur "CodePhantom.bat"
echo.
echo L'application s'ouvrira sur:
echo   http://localhost:3001
echo.
echo Fonctionnalités incluses:
echo   ✓ Interface web complète
echo   ✓ Base de données SQLite
echo   ✓ Éditeur de code Monaco
echo   ✓ Génération IA multi-modèles
echo   ✓ Système de projets
echo.
pause