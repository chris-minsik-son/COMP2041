#!/bin/dash

snapshot-save.sh
num=$1
echo "Restoring snapshot $num"

for file in *
do
    if test -f ".snapshot.$num/$file"
    then
        cp ".snapshot.$num/$file" "$file"
    fi
done