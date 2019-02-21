# Build pipeline for markdown/plantuml/etc presentations

## Setup

Required packages,

 - pandoc
 - plantuml.jar (Download from [http://plantuml.com/](http://plantuml.com/) )
     * `nwdiag` diagrams require latest beta
 - Java JRE
 - Graphviz

On a recent debian installation this should be enough.

```
   sudo apt-get install -y \
         pandoc \
         texlive-latex-base \
         texlive-xetex \
         texlive-fonts-recommended-doc \
         openjdk-8-jdk \
         graphviz

```

## Notes

 - The location of `plantuml.jar` is hardcoded in the `build.sh` script.
 - The `out/` dir might not exist. Create it if it doesn't

