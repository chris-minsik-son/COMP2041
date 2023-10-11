#!/bin/dash

if test "$#" -eq 0
then
    exit 1
fi

max=0

for file in "$@"
do
    if test -f "$file"
    then
        cur=$(cat "$file" | wc -l)
        if test "$cur" -gt "$max" || test "$cur" -eq "$max"
        then
            max=$cur
            final=$file
        fi
    fi
done

echo "$final"
exit 0