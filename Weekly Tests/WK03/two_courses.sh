#!/bin/dash

cut -d'|' -f2 | sort | uniq -c | grep -E '2 ' | sed "s/^[ \t]*//g" | cut -d' ' -f2