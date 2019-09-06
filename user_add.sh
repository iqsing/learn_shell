#!/bin/bash
#user_add qsing01-qsing10 with random passwd

passdir=/home/qsing/git_clone/learn_shell/passwd.txt
echo "" >$passdir
[ ! -f passdir ]&& touch $passdir

#add_user
add_user(){

for i in `seq -w 10`
do
    useradd qsing$i
    pass="`echo $RANDOM|md5sum|cut -c 1-8`"
    echo $pass|passwd --stdin qsing$i 
    echo -e "user:$qsing$i \t passwd:$pass  " >>$passdir

done
cat $passdir
}

#del_user
del_user(){

for i in `seq -w 10`
do
    userdel -r qsing$i

done
if [ $? -eq 0 ];then
    echo "user_del successfuy!"
else
    echo "user del faild!"
fi

}
usage(){
echo "usage:$0 add|del"
}
main(){ 
[ $# -ne 1 ]&& usage

    case "$1" in
    add)
        add_user
        ;;
    del)
        del_user
        ;;
    *)
        usage
        ;;
    esac
}

main $*
















