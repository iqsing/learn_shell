#!/bin/bash
#console output color text
#man console_codes
red_color="\e[1;31m"
green_color="\e[1;32m"
yellow_color="\e[1;33m"
blue_color="\e[1;34m"
ed="\e[0m"
menu(){
cat << END
---------------------------
1.apple
2.peer
3.banana
4,cherry
--------------------------
END
}
main(){

menu

read -p "pls input a num:" furit
case $furit in
    1)
	echo -e "$red_color apple $ed"
	;;
    2)
	echo -e "$green_color pear $ed"
	;;
    3)
	echo -e "$yellow_color banana $ed"
	;;
    4)
	echo -e "$red_color cherry $ed"
	;;
    *)
	echo "pls input num [1-4]"
	;;
esac
}
main

