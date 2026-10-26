@echo off
setlocal enabledelayedexpansion
title Push to Private GitHub Repo - manasreddyn/portfolio-website
cd /d "%~dp0portfolio"
if not exist "index.html" cd /d "%~dp0"

echo ========================================================
echo   Pushing to PRIVATE GitHub Repo:
echo   https://github.com/manasreddyn/portfolio-website
echo ========================================================
echo.

where git >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Git is not found in your PATH.
    echo Please install Git from https://git-scm.com/
    pause
    exit /b 1
)

if not exist ".git" (
    echo [1/4] Initializing git repository...
    git init
)

echo [2/4] Staging and committing changes...
git add .
git commit -m "update: new about narrative and compact icon skills grid" >nul 2>nul
git branch -M main

echo [3/4] Checking Git Credential Helper...
git config --global credential.helper manager >nul 2>nul

echo.
echo ========================================================
echo Choose your authentication method for PRIVATE repo:
echo [1] Browser / Git Credential Manager (Default)
echo [2] GitHub Personal Access Token (PAT)
echo [3] SSH Key (git@github.com:...)
echo ========================================================
echo.
set /p AUTH_CHOICE="Enter 1, 2, or 3 (press ENTER for 1): "

if "%AUTH_CHOICE%"=="2" (
    echo.
    echo To generate a PAT: Go to GitHub -^> Settings -^> Developer Settings -^> Personal Access Tokens (classic)
    echo Check the 'repo' scope and generate token.
    echo.
    set /p GITHUB_PAT="Paste your GitHub Token (ghp_...): "
    git remote remove origin >nul 2>nul
    git remote add origin https://!GITHUB_PAT!@github.com/manasreddyn/portfolio-website.git
) else if "%AUTH_CHOICE%"=="3" (
    git remote remove origin >nul 2>nul
    git remote add origin git@github.com:manasreddyn/portfolio-website.git
) else (
    git remote remove origin >nul 2>nul
    git remote add origin https://github.com/manasreddyn/portfolio-website.git
)

echo.
echo [4/4] Pushing to GitHub main branch...
echo (A browser window or sign-in popup may appear to authenticate)
echo.

git push -u origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo ========================================================
    echo [SUCCESS] Code successfully pushed to private repo!
    echo ========================================================
    echo.
    echo For Vercel:
    echo 1. Go to https://vercel.com/new
    echo 2. Import manasreddyn/portfolio-website (Vercel can import private repos)
    echo 3. Click 'Deploy'!
) else (
    echo.
    echo ========================================================
    echo [!] Push failed. Try running with force:
    echo git push -u origin main --force
    echo Or if you use GitHub Desktop, simply click 'Add Existing Repository'
    echo and choose C:\Users\Manas\portfolio
    echo ========================================================
)

echo.
pause
