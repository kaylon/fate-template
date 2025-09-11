FROM pandoc/extra:latest-ubuntu

RUN tlmgr install tcolorbox \
     tikzfill \
     pdfcol \
     titlesec \
     enumitem \
     quoting \
     needspace \
     textcase \
     tabulary \
     framed \
     fontspec \
     framed \
     xcolor \
     geometry \
     tcolorbox \
     titlesec \
     setspace \
     parskip \
     enumitem \
     quoting \
     hyperref \
     needspace \
     textcase \
     tabulary

# Ensure pipx binaries are in PATH
ENV PATH="/root/.local/bin:${PATH}"
