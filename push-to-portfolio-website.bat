@echo off
setlocal enabledelayedexpansion
title Push to https://github.com/manasreddyn/portfolio-website
cd /d "%~dp0portfolio"
if not exist "index.html" cd /d "%~dp0"

echo ========================================================
echo   Pushing to https://github.com/manasreddyn/portfolio-website
echo ========================================================
echo.

where git >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Git is not found in your PATH.
    echo Please install Git or run this from Git Bash / GitHub Desktop.
    pause
    exit /b 1
)

if not exist ".git" (
    echo [1/4] Initializing git repository...
    git init
)

echo [2/4] Staging all files...
git add .

echo [3/4] Committing changes...
git commit -m "update: new about narrative and compact icon skills grid" >nul 2>nul

echo [4/4] Setting remote and pushing to main branch...
git remote remove origin >nul 2>nul
git remote add origin https://github.com/manasreddyn/portfolio-website.git
git branch -M main

echo.
echo Pushing to GitHub...
git push -u origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo ========================================================
    echo [SUCCESS] Code successfully pushed to:
    echo https://github.com/manasreddyn/portfolio-website
    echo ========================================================
    echo.
    echo Next step for Vercel:
    echo 1. Go to https://vercel.com/new
    echo 2. Click 'Import' on manasreddyn/portfolio-website
    echo 3. Click 'Deploy'!
) else (
    echo.
    echo [!] Push failed with exit code %ERRORLEVEL%.
    echo Attempting force push...
    git push -u origin main --force
)

echo.
pause
