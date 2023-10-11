#!/bin/dash

for directory in "$@"
do
    album=$(echo "$directory" | cut -d'/' -f2)
    year=$(echo "$directory" | cut -d'/' -f2 | cut -d',' -f2 | sed "s/^[ \t]*//g")
    
    for song in "$directory"/*
    do
        title=$(echo $song | cut -d'-' -f2 | sed "s/^[ \t]*//g")
        artist=$(echo $song | cut -d'-' -f3 | sed "s/^[ \t]*//g" | cut -d'.' -f1)
        track=$(echo $song | cut -d'/' -f3 | cut -d'-' -f1 | sed "s/^[ \t]*//g")
        id3 -t "$title" >/dev/null
        id3 -T "$track" >/dev/null
        id3 -a "$artist" >/dev/null
        id3 -A "$album" >/dev/null
        id3 -y "$year" >/dev/null
    done
done