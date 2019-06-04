#!/bin/bash

source env.sh

for filename in `find src/ -type f -mmin -60 | grep py | grep -v matplotlib`; do
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

for filename in `find src/ -type f -mmin -60 | grep matplotlib.py`; do
  echo "Building $filename"
  $MATPLOTLIB "$filename"
done

for filename in `find src/ -type f -mmin -60 | grep blockdiag`; do
  echo "Building $filename"
  outname=`echo $filename | sed 's/^src\///' | sed 's/blockdiag$/png/'`
  echo "  ..  as $outname"
  $BLOCKDIAG --size=1280x960 /$filename -o /out/$outname
done


