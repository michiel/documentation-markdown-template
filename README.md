# Project for markdown/plantuml/etc documents

## Setup

Required packages,

 - docker
 - plantuml.jar (Download from [http://plantuml.com/](http://plantuml.com/) )
     * `nwdiag` diagrams require latest beta
 - Java JRE
 - Graphviz

On a recent debian installation this should be enough.

```
   sudo apt-get install -y \
         openjdk-8-jdk \
         graphviz
```

## Running

### Generate a report from the `src/document.md` file

```
./build-report.sh

```
### Generate a presentation from the `src/document.md` file

```
./build-presentation.sh
```

## Notes/TODO

 - The location of `plantuml.jar` is hardcoded in the `build.sh` script.
 - The `out/` dir might not exist. Create it if it doesn't
 - The asset generation is only applied to files that have been changed in the last 60 minutes. Run `touch src/*` to update everything

