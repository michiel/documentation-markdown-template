#!/bin/bash

./build-assets.sh

PANDOC="docker run --rm -u `id -u`:`id -g` -v `pwd`:/pandoc dalibo/pandocker"

# THEME=CambridgeUS
# COLORTHEME=beaver

THEME=default
COLORTHEME=seahorse

$PANDOC src/document.md src/metadata.yaml \
	-V theme:$THEME \
	-V classoption:aspectratio=169 \
	-V colortheme:$COLORTHEME \
  --mathml \
  -t beamer \
  --highlight-style tango \
  --slide-level 2 \
  -o out/presentation.pdf

