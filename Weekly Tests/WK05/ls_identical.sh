#!/bin/dash

if test "$#" -eq 0
then
    exit 1
fi

if test "$#" -ne 2
then
    exit 1
fi

d1=$1
d2=$2

if test -d "$d1" || test -d "$d2"
then
    if test "$(ls "$d1" | wc -l)" -ne 0 ||
        test "$(ls "$d1" | wc -l)" -ne 0
    then
        for f1 in $d1*/*
        do
            file1=$(echo "$f1" | cut -d'/' -f2)
            for f2 in $d2*/*
            do
                file2=$(echo "$f2" | cut -d'/' -f2)
                check=$(diff "$d1/$file1" "$d2/$file2" | wc -l) 2>/dev/null
                # If files are identical, print to output
                if test "$file1" -eq "$file2" &&
                    test "$check" -eq 0
                then
                    echo "$file1"
                fi
            done
        done
    else
        exit 1
    fi
fi