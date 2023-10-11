#!/bin/dash

course=$1

curl --location --silent http://www.timetable.unsw.edu.au/2023/"$course"KENS.html |
 grep -E "td class=" |
  grep -E "$course" |
   cut -d'"' -f4,5 |
    grep -E "[a-z0-9A-Z]</a></td>" |
     sed "s?.html? ?g" |
      sed "s/>//g" |
       sed 's/"//g' |
        sed s?\</a\</td??g |
         grep -E "$course[0-9]{4} [A-Z]{1}[a-z]{1}" |
          sort |
           uniq