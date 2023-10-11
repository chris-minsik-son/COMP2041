#!/bin/dash

sort | cut -d'|' -f2,3 | uniq | cut -d',' -f2 | sed "s/^[ \t]*//g" | cut -d' ' -f1 | sort | uniq -c | sort -nr | sed "s/[0-9]*//g" | sed "s/^[ \t]*//g" | head -n1