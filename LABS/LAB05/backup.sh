#!/bin/dash

if test "$#" -ne 1
then
    echo "No backup file provided"
fi

file=$1

if test -f "$file"
then
    i=0
    while test -f ".$file.$i"
    do
        i=$((i+1))
    done
    cp "$file" ".$file.$i"
    echo "Backup of '$file' saved as '.$file.$i'"
fi
