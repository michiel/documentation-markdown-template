export PLANTUML=~/Downloads/plantuml.jar
export MATPLOTLIB="docker run --rm -u `id -u`:`id -g` -v `pwd`/src:/src -v `pwd`/out:/out czentye/matplotlib-minimal python"
export BLOCKDIAG="docker run --rm -u `id -u`:`id -g` -v `pwd`/src:/src -v `pwd`/out:/out manabu/blockdiag-docker:latest blockdiag --size=2560x1920 "
export IMAGEMAGICK="docker run --rm -u `id -u`:`id -g` -v `pwd`/src:/src -v `pwd`/out:/out imagemagick:latest convert"
export DATAFLOW="docker run --rm -u `id -u`:`id -g` -v `pwd`/src:/src -v `pwd`/src:/root -v `pwd`/out:/out owickstrom/dataflow:0.7.3.0 dataflow "
export PANDOC="docker run --rm -u `id -u`:`id -g` -v `pwd`:/pandoc dalibo/pandocker"
export THEME=default
export COLORTHEME=seahorse


