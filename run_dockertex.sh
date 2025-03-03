#!/bin/bash

# Add custom classes: --volume '/dir/to/custom/classes:/root/texmf/tex/latex:ro'
# Add custom fonts: --volume '/dir/to/custom/fonts:/usr/share/fonts/external:ro'
# Cache luatex fonts: --volume '/dir/to/luatex/cache:/var/lib/texmf/luatex-cache:rw'
# IMPORTANT: Always specify absolute paths to make this script executable from everywhere!

if [ -z "$2" ]; then
    if [ -z "$1" ]; then
        echo Invalid parameters: Missing path and file.
        exit 1
    else
        PTH="$PWD"
        FLE="$1"
    fi
else
    PTH="$1"
    FLE="$2"
fi
PTH=$(realpath "$PTH")

if [ ! -d "$PTH" ] || [ ! -f "$PTH"/"$FLE" ]; then
    echo Invalid path/file: not found!
    exit 2
fi

echo $PTH/$FLE

docker run --rm \
    --volume "$PTH":'/tex' \
    dockertex:latest \
    latexmk -lualatex -shell-escape -interaction=nonstopmode -f "$FLE"
