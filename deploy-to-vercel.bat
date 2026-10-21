@echo off
title Deploy Portfolio to Vercel
cd /d "%~dp0portfolio"
if not exist "index.html" cd /d "%~dp0"

echo ========================================================
echo          Deploying Portfolio to Vercel
echo ========================================================
echo.
echo Running Vercel CLI (zero config, instant production deploy)...
echo.

npx --yes vercel --prod

echo.
echo ========================================================
echo If this was your first time, Vercel will ask you to:
echo 1. Log in via browser (email or GitHub)
echo 2. Confirm project name (e.g. manas-portfolio)
echo Once finished, you will receive a live https://*.vercel.app URL!
echo ========================================================
echo.
pause
