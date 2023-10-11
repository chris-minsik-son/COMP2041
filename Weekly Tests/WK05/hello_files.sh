#!/bin/dash

if test "$#" -ne 2
then
    exit 1
fi

int=$1
str=$2

if test "$(echo $int | grep -E "^[0-9]+$" | wc -l)" -eq 1 &&
     test "$(echo $str | grep -E "^[a-zA-Z0-9]+$" | wc -l)" -eq 1
then
    i=1

    while test "$i" -ne "$((int+1))"
    do
        echo "hello $str" > "hello$i.txt"
        i=$((i+1))
    done

    exit 0
else
    exit 1
fi