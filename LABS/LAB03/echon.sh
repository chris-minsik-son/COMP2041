#!/bin/dash

i=0

if [ $# -ne 2 ]
then
    echo 'Usage: ./echon.sh <number of lines> <string>'
    exit 1

elif ! echo "$1" | grep -Eq "^[0-9]+$"
then
    echo './echon.sh: argument 1 must be a non-negative integer'
    exit 1
fi

while [ "$i" -lt "$1" ]
do
    echo "$2"
    i=$((i+1))
done