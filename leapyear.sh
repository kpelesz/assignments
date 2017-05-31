#Name: Katherine Pelesz

#LAB
#Tells you if you were born on a leapyear

#!/bin/bash

read -p "Please enter a year in the format of (yyyy): " year
days=$(cal $year |grep -E "^[ 0-9][0-9]| [ 0-9][0-9]$" |wc -w)

if ((($days % 2) == 0 ))
then
       echo "This year is a leap year "
else
        echo "This year is not a leap year"
        (exit 9)
fi

echo "Exit status: " $?
