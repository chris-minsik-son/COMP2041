#!/bin/dash

# For each file in directory ending in .htm
for FILE in *.htm
do
    ver=$(echo "$FILE" | sed 's/htm/html/')
    # If file already exists, exit
    if test -f $ver 2>/dev/null
    then
        echo "$ver exists"
        exit 1
    # Otherwise copy to the new html file and remove old file
    else
        cp "$FILE" "$ver"
        rm "$FILE"
    fi
done