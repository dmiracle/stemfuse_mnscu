#!/bin/bash
for fn in ./proc/*.html; do
    echo "$fn"
    cat header.html > ./proc/tmp
    cat "$fn" >> ./proc/tmp
    cat footer.html >> ./proc/tmp
    mv ./proc/tmp "$fn"
done
