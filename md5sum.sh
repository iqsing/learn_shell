#!/bin/bash
#穷举md5sum加密破解
#如果文件不为空则生成密码库
if [ ! -s /home/qsing/git_clone/learn_shell/passwd_repos.txt ];then
    for i in {0..32767}
    do
        echo "`echo $i|md5sum` $i">>/home/qsing/git_clone/learn_shell/passwd_repos.txt
    done
fi
passwd=184c90f2e
exec <passwd_repos.txt

while read line
do
    if [ `echo $line|grep $passwd|wc -l` -eq 1 ];then
        echo $line
        break
    fi
done

