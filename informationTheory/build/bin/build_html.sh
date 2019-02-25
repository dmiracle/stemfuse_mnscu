#!/bin/bash
for fn in *.md; do
    pandoc -f gfm -t html "$fn" -o "$(basename "$fn" .md).html"
done
for fn in *.html; do
    echo "$fn"
    cat templates/header.html > tmp
    cat "$fn" >> tmp
    cat templates/footer.html >> tmp
    mv tmp "$fn"
    cp "$fn" ../pub/"$fn"
done
