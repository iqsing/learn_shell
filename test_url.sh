#!/bin/bash

#load system functions
. /etc/init.d/functions
#check_count
check_count=0
#url_list
url_list=(
www.baidu.com
www.google.com
www.sohu.com
www.qq.com
)
wait_3s(){
    echo -n "wait for 3s to start!"
    for ((i=0;i<3;i++))
    do
        echo -n "."
        sleep 1
    done
    echo
}
check_url(){
   for ((i=0;i<`echo ${#url_list[*]}`;i++))
   do
        wget -o /dev/null -T 3 --tries=1 --spider ${url_list[$i]}  >&/dev/null
        if [ $? -eq 0 ];then
            action "${url_list[$i]}检测结果"   /bin/true
        else
            action "${url_list[$i]}检测结果"   /bin/false
        fi
   done
  echo "======检测次数：$((++check_count))========="

}
main(){
    wait_3s
    while true
    do
        check_url
        sleep 5
    done
}
main
