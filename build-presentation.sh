#!/bin/bash

source env.sh
./build-assets.sh

$PANDOC src/document.md src/metadata.yaml \
	-V theme:$THEME \
	-V classoption:aspectratio=169 \
	-V colortheme:$COLORTHEME \
  --mathml \
  -t beamer \
  --highlight-style tango \
  --slide-level 2 \
  -o out/presentation.pdf

