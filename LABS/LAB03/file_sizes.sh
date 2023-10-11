#!/bin/dash

SMALL=""
MED=""
LARGE=""

for FILE in *
do
    num=$(wc -l "$FILE" | cut -d ' ' -f1)
    if [ "$num" -lt 10 ]
    then
        SMALL="$SMALL $FILE"
    elif [ "$num" -lt 100 ]
    then
        MED="$MED $FILE"
    else
        LARGE="$LARGE $FILE"
    fi
done

echo "Small files:$SMALL"
echo "Medium-sized files:$MED"
echo "Large files:$LARGE"