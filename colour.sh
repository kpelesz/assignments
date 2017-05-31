#!/bin/bash
# Written by John Selmys - February 2012
# Modified by Katherine Pelesz to allow a parameter random or RANDOM to print out the string in a random colour and/or bolded

declare -A random=([0]="0;30" [1]="0;31" [2]="0;32" [3]="0;33" [4]="0;34" [5]="0;35" [6]="0;36" [7]="0;37")
declare -A randombold=([0]="1;30" [1]="1;31" [2]="1;32" [3]="1;33" [4]="1;34" [5]="1;35" [6]="1;36" [7]="1;37")
declare -A colours=([black]="0;30" [red]="0;31" [green]="0;32" [yellow]="0;33" [blue]="0;34" [magenta]="0;35" [cyan]="0;36" [white]="0;37")
declare -A coloursbold=([BLACK]="1;30" [RED]="1;31" [GREEN]="1;32" [YELLOW]="1;33" [BLUE]="1;34" [MAGENTA]="1;35" [CYAN]="1;36" [WHITE]="1;37")

num=$(($RANDOM%7))

if [ $# -lt 2 ]; then
	echo Usage: echoc COLOUR STRING
	exit 1
fi

regex='^black$|^red$|^green$|^yellow$|^blue$|^magenta$|^cyan$|^white$'
regex2='^BLACK$|^RED$|^GREEN$|^YELLOW$|^BLUE$|^MAGENTA$|^CYAN$|^WHITE$'

if [[ $1 =~ $regex ]]; then
	echo -ne '\e['${colours[$1]}m
	shift
	echo -e $*'\e[0m'
	exit 0

elif [[ $1 =~ $regex2 ]]; then
	echo -ne '\e['${coloursbold[$1]}m
	shift
	echo -e $*'\e[0m'
	exit 0

elif [[ $1 == "RANDOM" ]]; then
	echo -ne '\e['${randombold["$num"]}m
	shift
	echo -e $*'\e[0m'
	exit 0

elif [[ $1 == "random" ]]; then
	echo -ne '\e['${random["$num"]}m
	shift
	echo -e $*'\e[0m'
	exit 0

else
	echo COLOUR must be one of 'black|red|green|yellow|blue|magenta|cyan|white'
	echo or 'BLACK|RED|GREEN|YELLOW|BLUE|MAGENTA|CYAN|WHITE' for bold 
	exit 2
fi
