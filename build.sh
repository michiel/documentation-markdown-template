#!/bin/bash

PLANTUML=~/Downloads/plantuml.jar

# Run all python scripts. Send the output to the out dir in a file with the
# name of the extension replaced with 'txt'

for filename in `find src/ -type f -mmin -10 | grep py`; do
  echo "Building $filename"
  outname=`echo $filename | sed 's/^src\///' | sed 's/py$/txt/'`
  echo "  ..  as $outname"

  python $filename > out/$outname
done

# Generate all dot files as pngs in out

for filename in `find src/ -type f -mmin -10 | grep dot`; do
  echo "Building $filename"
  outname=`echo $filename | sed 's/^src\///' | sed 's/dot$/png/'`
  echo "  ..  as $outname"

  neato $filename -Tpng -Gsize=9,9\! -Gdpi=100 -o out/$outname
done

# Generate all uml files with plantuml as pngs in out

for filename in `find src/ -type f -mmin -10 | grep uml`; do
  echo "Building $filename"
  java -jar $PLANTUML -v -tpng $filename -o ../out/;
done

# Generate all gnuplot files with gnuplot in out

for filename in `find src/ -type f -mmin -10 | grep gnuplot`; do
  echo "Building $filename"
  gnuplot $filename
done

pandoc src/presentation.md \
  --mathml \
  -t beamer \
  -V theme=Singapore \
  --highlight-style tango \
  --slide-level 2 \
  -o out/presentation.pdf

