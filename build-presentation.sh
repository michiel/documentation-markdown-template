#!/bin/bash

for filename in `find src/ -type f -mmin -60 | grep py`; do
  echo "Building $filename"
  outname=`echo $filename | sed 's/^src\///' | sed 's/py$/txt/'`
  echo "  ..  as $outname"

  python $filename > out/$outname
done

for filename in `find src/ -type f -mmin -60 | grep dot`; do
  echo "Building $filename"
  outname=`echo $filename | sed 's/^src\///' | sed 's/dot$/png/'`
  echo "  ..  as $outname"

  neato $filename -Tpng -Gsize=9,9\! -Gdpi=100 -o out/$outname
done

for filename in `find src/ -type f -mmin -60 | grep uml`; do
  echo "Building $filename"
  java -jar $PLANTUML -v -tpng $filename -o ../out/;
done

for filename in `find src/ -type f -mmin -60 | grep gnuplot`; do
  echo "Building $filename"
  gnuplot $filename
done

PANDOC="docker run --rm -u `id -u`:`id -g` -v `pwd`:/pandoc dalibo/pandocker"

# THEME=CambridgeUS
# COLORTHEME=beaver

THEME=default
COLORTHEME=seahorse

$PANDOC src/document.md \
	-V theme:$THEME \
	-V classoption:aspectratio=169 \
	-V colortheme:$COLORTHEME \
  --mathml \
  -t beamer \
  --highlight-style tango \
  --slide-level 2 \
  -o out/presentation.pdf

