#!/bin/bash

source env.sh
./build-assets.sh

cat src/document.md | sed 's/^::.*$//' | sed 's/{.*}//' > out/document.md

$PANDOC out/document.md src/metadata.yaml \
  --toc \
  -V geometry:margin=0.5in \
  --mathml \
  --highlight-style tango \
  -o out/ebook.epub

