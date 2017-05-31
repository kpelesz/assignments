#!/bin/bash
#OPS435 Section A
#Katherine Pelesz

#ASSIGNMENT ONE
#Write a BASH shell script (program) named "zodiac" which accepts as input a person's birthday on the command line and prints out the following:
#The day of the week on which the person was born
#Their Western zodiac sign (cancer, leo, libra, etc.)
#Their Chinese zodiac sign (wood rabbit, metal snake, fire pig, etc.)
#Their horoscope (use the Linux fortune cookie program for this)


#VALIDATING INPUT
#The first portion of this script will check if there is no arguments in order to output the format for the script
if [ $# -eq 0 ]
then
 echo -e "Usage: The input must be in the format of yyyy mm dd or yyyymmdd or -y yyyy -m mm -d dd"

exit 
fi

#This takes the –y –m –d format and stores them into their respective variables using the switch case and optarg function
if [[ $# -eq 6 ]]; then
while getopts "y:m:d:" opt
do
case $opt in
y) year=$OPTARG;;
m) month=$OPTARG;;
d) day=$OPTARG;;
*) echo "Invalid input, please check usage";;
esac;
done

#This takes any 8 digit number and store them into variables using substrings. 
#Further error checking is done later to ensure the numbers inserted are appropriate
elif [[ $1 = [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9] ]]; then
        year=${1:0:4} ; month=${1:4:2} ; day=${1:6:2};

#This portion of the script takes the 3 parameter input and store them into variables assuming they meet the required digit
elif [[ $1 = [0-9][0-9][0-9][0-9] ]] && [[ $2 = [0-9][0-9] ]] && [[ $3 = [0-9][0-9] ]]; then
        year=$1 ; month=$2 ; day=$3;

else echo "Invalid input, please check the usage"
exit;

fi
#FURTHER ERROR CHECKING
#checks the year to see if it’s within the range we can work with
if [ $year -lt 1924 -o $year -gt 2043 ]; then
echo "The year is not valid, must be in the range of 1924-2043"
exit 

#checks the month to see if it’s within the range of Jan to Dec
elif [ $month -lt 1 -o $month -gt 12 ]; then
echo "The month entered is not valid"
exit 

#Check the day to make sure it’s within the range of 1 to 31
elif [ $day -lt 1 -o $day -gt 31 ]; then
echo "The day entered  is not valid"
exit 

#If there are no found errors, output the info and day of the week
else 
echo -e "\nYear: $year, Month: $month, Day: $day\n";
echo -e "Day of the week: "
date -d "$year-$month-$day" +%A
echo ""

fi

#WESTERN ZODIAC
#This turns the input into xxxx, x being a number from 0 to 9 and reads patterns to determine the sign
x="$month$day"
echo -e "Western Zodiac: "

#switch case statement used for simplicity as if statements were too redundant
#case statement takes the xxxx numbers and determine whichever matches the critera will display that #output
case $x in
012[1-9]|013[0-1]|02[0-1][0-9]) echo "Aquarius, The Water Bearer";;

022[0-9]|023[0-1]|03[0-1][0-9]|0320) echo "Pisces, The Fish";;

032[1-9]|033[0-1]|04[0-1][0-9]|0420) echo "Aries, The Ram";;

042[1-9]|043[0-1]|05[0-1][0-9]|052[0-1]) echo "Taurus, The Bull";;

052[2-9]|053[0-1]|06[0-1][0-9]|062[0-1]) echo "Gemini, The Twins";;

062[2-9]|063[0-1]|07[0-1][0-9]|072[0-2]) echo "Cancer, The Crab";;

072[3-9]|073[0-1]|08[0-1][0-9]|082[0-2]) echo "Leo, The Lion";;

082[3-9]|083[0-1]|09[0-1][0-9]|092[0-2]) echo "Virgo, The Virgin";;

092[3-9]|093[0-1]|10[0-1][0-9]|102[0-2]) echo "Libra, The Scales";;

102[3-9]|103[0-1]|11[0-1][0-9]|112[0-2]) echo "Scorpio, The Scorpion";;

112[3-9]|113[0-1]|12[0-1][0-9]|122[0-1]) echo "Sagittarius, The Archer";;

122[2-9]|123[0-1]|01[0-1][0-9]|0120) echo "Capricorn, The Sea Goat";;

	esac;

#CHINESE ZODIAC

#using switch case statements to cycle through the chinese zodiac signs
#the case will take the modulo of the year and determine the sign based on that

echo -e "\nChinese Zodiac: "

y=$((year%10))	
case $y in
0) printf "Yang Metal ";;	
1) printf "Yin Metal ";;	
2) printf "Yang Water ";;	
3) printf "Yin Water ";;
4) printf "Yang Wood ";;
5) printf "Yin Wood ";;	
6) printf "Yang Fire ";;
7) printf "Yin Fire ";;	
8) printf "Yang Earth ";;	
9) printf "Yin Earth ";;
	esac;

z=$((year%12))
case $z in
0) echo "Monkey";;
1) echo  "Rooster";;
2) echo "Dog";;
3) echo "Pig";;
4) echo "Rat";;
5) echo "Ox";;
6) echo "Tiger";;
7) echo "Rabbit";;
8) echo "Dragon";;
9) echo "Snake";;
10) echo "Horse";;	
11) echo  "Sheep";;
	esac;

echo "";

#HOROSCOPE

echo "Horoscope: "
fortune;

echo "";
exit
