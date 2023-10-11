#!/bin/dash

if test "$#" -eq 0
then
    echo "No image has been selected"
    exit 1
fi

for image in "$@"
do
    if test -f "$1"
    then
        date=$(ls -l | grep "$image" | cut -d' ' -f6,7,8)
        convert -gravity south -pointsize 36 -draw "text 0,10 '$date'" $image $image
    else
        echo "Image does not exist in current directory"
    fi
done