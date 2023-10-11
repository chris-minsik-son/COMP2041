#!/bin/dash

if [ "$#" -eq 2 ]
then
    if [ "$1" -ge 2019 ] 2>/dev/null && [ "$1" -le 2023 ] 2>/dev/null
    then
        year=$1
        course_prefix=$2
    else
        echo "./scraping_courses.sh: argument 1 must be an integer between 2019 and 2023"
        exit 1
    fi
else
    echo "Usage: ./scraping_courses.sh <year> <course-prefix>"
    exit 1
fi

UG=https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$year%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:$course_prefix*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0
PG=https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$year%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:$course_prefix*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0

curl -sL "$UG" "$PG" |
 2041 jq '.contentlets[] | {code: .code, title: .title}' |
  sed 's/.*"code": "// ; s/.*title": "// ; s/".*//' |
   tr -d '{}' |
    paste -sd '\n  \n' |
     grep -v "^$" |
      sort |
       uniq |
        sed "s/[[:space:]]*$//" > output_file
cat output_file
rm output_file