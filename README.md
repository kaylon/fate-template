# Requirements

## 1. Install Pandoc
### Windows
#### Opción 1: Download the installer from the officual Pandoc website.

#### Opción 2: Use Chocolatey:

```
choco install pandoc
```

#### Opción 3: Use Winget:

```
winget install --source winget --exact --id JohnMacFarlane.Pandoc
```
Verify: Open a terminal (cmd or PowerShell) and run

```
pandoc --`version
```
Is you see the version, Pandoc is correctly installed.

### Linux (Ubuntu/Debian)
Terminal:

```
sudo apt update
sudo apt install pandoc
```
Verify: Open a terminal and run
```
pandoc --version
```
Is you see the version, Pandoc is correctly installed.

## 2. Install pandoc-latex-environment filter
You need pipx installed from https://pipx.pypa.io/stable/.

Install the filter:
```
pipx install pandoc-latex-environment
```

Verify: Open a terminal and run
```
pandoc-latex-environment --help
```

# Usage

1. Run the following command to build the .html file
```
pandoc demo.md --template=template.tex --pdf-engine=xelatex --filter pandoc-latex-environment --lua-filter=filters.lua -o demo.pdf
```
