#!/bin/bash

#add system functions library
. /etc/rc.d/init.d/functions
file_path=/etc/openvpn.conf
[ ! -f $file_path ]&&touch $file_path

usage(){
    echo "usage: $0 {-add|-del|-search} username"
    exit 1
}
#root
if [ $UID -ne 0 ];then
    echo "you must be root to run this script!"
    exit 1
fi
#test args 
[ $# -ne 2 ]&&{
    usage
    exit 1
}
main(){
    case "$1" in 
    "-a"|"-add")
        if grep "^$2$" ${file_path} >/dev/null 2>&1 #clear stdout\stderror
        then
            action "vpnuser $1 is exist"  /bin/false
        else
            chattr -i $file_path
            echo $2 >> $file_path
            [ $? -eq 0 ]&& action "add user $2 " /bin/true
            chattr +i $file_path
        fi
        ;;
     -del)
        if grep "^$2$" ${file_path} >/dev/null 2>&1 #clear stdout\stderror
        then
            chattr -i $file_path
            sed -i "/^$2$/d" $file_path      #exist to del
            [ $? -eq 0 ]&& action "del user $2 " /bin/true
            chattr +i $file_path
        else
            action "user $2 is ont exist! " /bin/false
        fi
        ;;
      -s|-search)
        if grep "^$2$" ${file_path} >/dev/null 2>&1 
        then 
            echo "user $2 is exist!"
        else
            echo "user $2 is ont exist!"
        fi
        ;;
    *)
        usage
        exit 1
        ;;
    esac
}
main $* 
