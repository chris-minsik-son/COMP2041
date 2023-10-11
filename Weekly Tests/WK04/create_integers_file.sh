#!/bin/dash

input_1=$1
input_2=$2
newfile=$3

# If file exists, remove file and create new one later
if test -f "$newfile"
then
    rm $newfile
fi

# While our starting integer is less than the last integer
while test $input_1 -lt $((input_2+1))
do
    echo "$input_1" >> $newfile
    input_1=$((input_1 + 1))
done