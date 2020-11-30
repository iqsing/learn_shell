#!/bin/bash
for user in  xiaohai{01..10};do
    
    id $user   >/dev/null 2>&1
    if [ $? -ne 0 ];then
         useradd $user
        psd=`date +%s%N|md5sum|cut -c1-10`
        echo "user:${user}  passwd:${psd}" >>passwd.txt
        echo $psd|passwd --stdin $user  2>&1 >/dev/null
        [ $? -eq 0 ] && echo "create user ${user}"
    else
        echo "$user is exist!"
    fi
done