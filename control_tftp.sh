#!/bin/bash
#new script to control tftpd service

. /etc/init.d/functions  #load system functions

get_pid(){

pid=`pgrep tftp`
if [ $? -eq 0 ];then
    return $pid
else
    return 0
fi

}
usage(){
if [ $# -ne 1 ];then
echo "usage: $0 {start|stop|enable}"
fi
}
main(){

case $1 in 
    start)
    get_pid
    if [ $? -eq 0 ];then
        systemctl start tftp
        [ $? -eq 0 ]&& action "start tftp" /bin/true
    else
        echo "sorry, the service tftp is startd!"
    fi
    ;;
    stop)
    get_pid
    if [ $? -eq 0 ];then
        echo "sorry the service tftp has been stop!"
    else
        systemctl stop tftp
        [ $? -eq 0 ]&& action "stop tftp"  /bin/false
    fi
    ;;
    enable)
        systemctl enable tftp
        [ $? -eq 0 ]&& action "enable tftp" /bin/true
    ;;
    *)
    usage
    ;;
esac
}
main $*
