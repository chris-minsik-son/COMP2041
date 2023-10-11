#!/bin/dash

for file in *.jpg
do
    pngcheck=$(echo "$file" | sed "s/jpg/png/")
    if test -f "$pngcheck"
    then
        echo "$pngcheck already exists"
    fi

    convert "$file" "$pngcheck" 2>/dev/null
    rm "$file"
done