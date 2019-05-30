#!/bin/bash

source env.sh
./build-assets.sh

$PANDOC src/document.md src/metadata.yaml \
  -V geometry:margin=0.5in \
  --mathml \
  --highlight-style tango \
  -o out/report.pdf

