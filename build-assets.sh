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
  outname=`echo $filename | sed 's/^src\///' | sed 's/dot$/svg/'`
  echo "  ..  as $outname"

  neato $filename -Tsvg -o out/$outname
done

for filename in `find src/ -type f -mmin -60 | grep uml`; do
  echo "Building $filename"
  java -jar $PLANTUML -v -tsvg $filename -o ../out/;
done

for filename in `find src/ -type f -mmin -60 | grep gnuplot`; do
  echo "Building $filename"
  gnuplot $filename
done

for filename in `find src/ -type f -mmin -60 | grep matplotlib.py`; do
  echo "Building $filename"
  $MATPLOTLIB "$filename"
done

