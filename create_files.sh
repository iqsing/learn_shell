#!/bin/bash
function create_file(){
    [ -d /clsn ] || mkdir /clsn
    for ((i=0;i<=10;i++));do
        str=$(echo $RANDOM|md5sum|tr [0-9] [a-z]|cut -c 1-10)
        echo $str
        touch  /clsn/${str}_clsn.html
    done
}
create_file

