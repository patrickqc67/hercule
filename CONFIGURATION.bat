@echo off
title CodePhantom - Configuration des clés API
color 0E
cls

echo.
echo ========================================
echo   CodePhantom - Configuration API
echo   Assistant IA de développement  
echo ========================================
echo.

:: Aller dans le répertoire du script
cd /d "%~dp0"

echo [INFO] Configuration des clés API pour CodePhantom
echo.
echo Pour utiliser les fonctionnalités IA de CodePhantom,
echo vous devez configurer au moins une clé API.
echo.
echo Services supportés:
echo   1. OpenAI (GPT-4o) - Recommandé
echo   2. Anthropic (Claude)
echo   3. XAI (Grok)
echo.

:: Lire la clé OpenAI
set /p OPENAI_KEY="Entrez votre clé OpenAI (ou appuyez sur Entrée pour ignorer): "

:: Lire la clé Anthropic
set /p ANTHROPIC_KEY="Entrez votre clé Anthropic (ou appuyez sur Entrée pour ignorer): "

:: Créer/mettre à jour le fichier .env
echo [INFO] Mise à jour de la configuration...

:: Créer le fichier .env avec les nouvelles clés
(
echo DATABASE_URL=sqlite:./data/codephantom.db
echo NODE_ENV=production
echo PORT=3001
if defined OPENAI_KEY echo OPENAI_API_KEY=%OPENAI_KEY%
if defined ANTHROPIC_KEY echo ANTHROPIC_API_KEY=%ANTHROPIC_KEY%
) > .env

echo.
echo [SUCCESS] Configuration mise à jour!
echo.
echo Clés configurées:
if defined OPENAI_KEY echo   ✓ OpenAI (GPT-4o)
if defined ANTHROPIC_KEY echo   ✓ Anthropic (Claude)
if not defined OPENAI_KEY if not defined ANTHROPIC_KEY echo   ⚠ Aucune clé configurée
echo.
echo Pour obtenir vos clés API:
echo   OpenAI: https://platform.openai.com/api-keys
echo   Anthropic: https://console.anthropic.com/
echo.
echo Vous pouvez maintenant lancer CodePhantom.bat
echo.
pause