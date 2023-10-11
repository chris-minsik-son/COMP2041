#!/bin/dash

if test "$#" -ne 0
then
    exit 1
fi

i=0
while test -d ".snapshot.$i"
do
    i=$((i+1))
done

mkdir .snapshot.$i
echo "Creating snapshot $i"

for file in *
do
    if echo "$file" | grep -v "snapshot" 1>/dev/null
    then
        cp "$file" ".snapshot.$i"
    fi
done
