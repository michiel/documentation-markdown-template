#!/bin/bash

source env.sh

for filename in `find src/ -type f -mmin -60 | grep diagrams.py`; do
  echo "Building (python-diagrams) $filename"
  $DIAGRAMS $filename
done

for filename in `find src/ -type f -mmin -60 | grep py | grep -v matplotlib | grep -v diagrams | grep -v seaborn`; do
  echo "Building (python-output) $filename"
  outname=`echo $filename | sed 's/^src\///' | sed 's/py$/txt/'`
  echo "  ..  as $outname"

  python $filename > out/$outname
done

for filename in `find src/ -type f -mmin -60 | grep dot`; do
  echo "Building (graphiz-dot) $filename"
  outname=`echo $filename | sed 's/^src\///' | sed 's/dot$/svg/'`
  echo "  ..  as $outname"

  neato $filename -Tsvg -o out/$outname
done

for filename in `find src/ -type f -mmin -60 | grep uml`; do
  echo "Building (plantuml) $filename"
  java -jar $PLANTUML -v -tsvg $filename -o ../out/;
done

for filename in `find src/ -type f -mmin -60 | grep gnuplot`; do
  echo "Building (gnuplot) $filename"
  gnuplot $filename
done

for filename in `find src/ -type f -mmin -60 | grep matplotlib.py`; do
  echo "Building (python-matplotlib) $filename"
  $MATPLOTLIB "$filename"
done

for filename in `find src/ -type f -mmin -60 | grep seaborn.py`; do
  echo "Building (python-seaborn) $filename"
  $SEABORN /"$filename"
done

