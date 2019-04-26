#!/bin/bash

./build-assets.sh

PANDOC="docker run --rm -u `id -u`:`id -g` -v `pwd`:/pandoc dalibo/pandocker"

$PANDOC src/document.md \
  -V geometry:margin=0.5in \
  --mathml \
  --highlight-style tango \
  -o out/report.pdf

