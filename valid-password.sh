#!/bin/bash
#Katherine Pelesz

#ASSIGNMENT TWO

input="${@}";
valid=0;
echo $1
if [[ $input == '-h' ]]; then
echo "Usage: pw | pw -h | pw password
Note: Valid passwords must be at least 8 characters long.
contain at least 1 digit.
contain at least 1 lowercase letter.
contain at least 1 uppercase letter.
contain one of @ # $ % & * + - ="
exit
fi

if [ $# -eq 0 ]; then 

length=$[ 8 + $[RANDOM % 9]] 
special=('@' '#' '$' '%' '&' '*' '+' '-' '=')  
all=('0' '1' '2' '3' '4' '5' '6' '7' '8' '9' 'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' 'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z') 


generate(){ 
unset password
for ((i = 0; i < $length; i++)) do 

rand=${RANDOM}%62 

password="${password}${all[$rand]}" 

done 

randlength=${RANDOM}%$length
randspec=${RANDOM}%9
password=${password:$randlength}${special[$randspec]}
count=$((${#password}+1))

for ((i = $count; i <= $length; i++)) do
	rand=${RANDOM}%62
	password="${password}${all[$rand]}"

done
}



while [ $valid -eq 0 ];
do
unset password
generate
if [[ $password =~ [A-Z] ]] && [[ $password =~ [a-z] ]] && [[ $password =~ [0-9] ]] && [[ ${#password} -ge 8 ]] && [[ ${#password} -le 16 ]] ; then
valid=1
echo "Valid password is" $password 
fi
done




else 

if [[ ${#input} -lt 8 ]] ||  [[ ${#input} -gt 16 ]]; then 

echo "Error - Invalid Length -" $input  

else 
valid=$(($valid+1))

fi

if [[ $input =~ [0-9] ]]; then

valid=$(($valid+1))

else

echo "Error - Does not contain Digit -" $input 


fi 
 

if [[ $input =~ [a-z] ]]; then 

valid=$(($valid+1))

else 

echo "Error - Does not contain Lowercase Letter -"  $input 
 

fi 

if [[ $input =~ [A-Z] ]]; then 

valid=$(($valid+1))

else 

echo "Error - Does not contain Uppercase Letter -" $input 
 

fi 


if [[ $input =~ ['@ # $ % & * + - ='] ]]; then 

valid=$(($valid+1))

else echo "Error - Does not contain One Special Character -" $input 

fi 


if [[ $input =~ ['@ # $ % & * + - =']{2,} ]]; then 

	echo "Error - Contains More than One Special Character -" $input 

elif [[ $input =~ ['@ # $ % & * + - ='].*['@ # $ % & * + - ='] ]]; then

 	echo "Error - Contains More than One Special Character -" $input	

else

valid=$(($valid+1))

fi 

if [[ $valid -eq "6" ]]; then

echo $input "is a valid password"
else echo $input "is not a valid password"

fi
fi
