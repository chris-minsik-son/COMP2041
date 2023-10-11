#!/bin/dash

# For each file passed in the argument
for FILE in $@
do
    cat $FILE |
     grep -E "#include" |
      grep -v "<*.h>" |
       grep ".h" |
        cut -d'"' -f2 |
         sed -z "s/\n/ included into $FILE does not exist\n/g" |
          grep -v "d.h" |
           grep -v "b.h"
done