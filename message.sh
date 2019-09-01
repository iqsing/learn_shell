#!/bin/bash
money=3
msg=1
msg_count=0
menu(){
cat << END
当强余额$money元
===============
1.充值
2.发短信
3.推出
===============
END
}
recharge(){
read -p "pls input you charge:" m
expr $m + 1 &>/dev/null
if [ $? -eq 0 ];then
    ((money=money+m))
#    echo "当前余额为:$money"
else
    echo "the num you input is error"
fi
}
send_message(){
if [ $money -ge $msg ];then
    while [ $money -ge $msg ]
    do
        read -p "input your message here(enter q to cancer):" message
        if [ "$message" == "q" ];then
        break 
        fi
        ((money=money-1))
        echo "send success,the money your leave is $money"
    done
else
    echo "余额不足，请充值后再试！"

fi

}
out(){
    echo "quit success!"
    exit 0
}

main(){
while true 
do
    menu
    read -p "make your choose:" choose
    case $choose in
    1)
        recharge
    ;;
    2)
        send_message
    ;;
    3)
        out
    ;;
    *)
        echo "your must input 1|2|3"
    ;;    
    esac
done
}
main
