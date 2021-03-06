export PLANTUML=~/Downloads/plantuml.jar
export PYTHONVIS="docker run --rm -u `id -u`:`id -g` -v `pwd`/src:/src -v `pwd`/out:/out python-vis:latest python"
export MATPLOTLIB="docker run --rm -u `id -u`:`id -g` -v `pwd`/src:/src -v `pwd`/out:/out czentye/matplotlib-minimal python"
export BLOCKDIAG="docker run --rm -u `id -u`:`id -g` -v `pwd`/src:/src -v `pwd`/out:/out manabu/blockdiag-docker:latest blockdiag --size=2560x1920 "
export IMAGEMAGICK="docker run --rm -u `id -u`:`id -g` -v `pwd`/src:/src -v `pwd`/out:/out imagemagick:latest convert"
export DATAFLOW="docker run --rm -u `id -u`:`id -g` -v `pwd`/src:/src -v `pwd`/src:/root -v `pwd`/out:/out owickstrom/dataflow:0.7.3.0 dataflow "
export PANDOC="docker run --rm -u `id -u`:`id -g` -v `pwd`:/pandoc dalibo/pandocker"
export DIAGRAMS="docker run --rm -u `id -u`:`id -g` -v `pwd`/src:/app/src -v `pwd`/out:/app/out michielkalkman/diagrams"
export THEME=default
export COLORTHEME=seahorse


