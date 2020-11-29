#!/bin/bash
cd /clsn  &&\
file_name_all=$(ls /clsn)
file_name=`ls /clsn |sed -r 's/(.*)_clsn.html/\1/g'`   #\1第一个括号内匹配的内容
for  file in  $file_name;do
    mv ${file}_clsn.html ${file}_znix.HTML     
    
done

for file in `ls /clsn`;do
    echo $file
done
