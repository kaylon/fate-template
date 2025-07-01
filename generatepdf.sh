#!/bin/bash
cd "$(dirname "$0")"

if ! command -v pandoc >/dev/null 2>&1; then
    echo [ERROR] Pandoc is not installed o it is not in the PATH.
    echo Install Pandoc from https://pandoc.org/installing.html
    exit 1
fi

pandoc main.md --no-highlight --template=tex/template.tex --pdf-engine=xelatex --filter pandoc-latex-environment --lua-filter=filters/filters.lua -o output/main.pdf

if [ $? -ne 0 ]; then
    echo [ERROR] There was a problem generating the PDF.
    exit 1
fi

echo PDF successfully generated in output\\main.pdf
