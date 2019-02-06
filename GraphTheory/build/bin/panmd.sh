#!/bin/bash
for fn in ./*.md; do
    echo "$fn"
    pandoc -f gfm -t html --mathjax --extract-media=./"$(basename "$fn" .md)" "$fn" -o "$(basename "$fn" .md).html"
done
