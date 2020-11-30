#!/bin/bash
total=0
for ip in 172.16.20.{1..254};do
    ping -c 1 -w 1 $ip &>/dev/null
    if [ $? -eq 0 ];then
        echo "$ip is live"
        total=`expr $total + 1`
    else
        echo "-------$ip is down ------------"
    fi
done
echo "total alive is $total"