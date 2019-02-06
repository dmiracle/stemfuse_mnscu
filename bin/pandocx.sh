#!/bin/bash
for fn in ./*.docx; do
    echo "$fn"
    pandoc -f docx -t html --extract-media=./"$(basename "$fn" .docx)" "$fn" -o "$(basename "$fn" .docx).html"
done
