@echo off
cd /d "%~dp0"

where pandoc >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Pandoc is not installed o it is not in the PATH.
    echo Install Pandoc from https://pandoc.org/installing.html
    pause
    exit /b 1
)

pandoc main.md --no-highlight --template=tex/template.tex --pdf-engine=xelatex --filter pandoc-latex-environment --lua-filter=filters/filters.lua -o output/main.pdf

if errorlevel 1 (
    echo [ERROR] There was a problem generating the PDF.
    pause
    exit /b 1
)

echo PDF successfully generated in output\main.pdf
pause
