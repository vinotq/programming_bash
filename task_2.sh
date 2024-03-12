#!/bin/bash 
Ext_filename=Ext

if [[ ! -d $1 ]]
then
    echo "np(no directory)"
    exit
fi

if [[ ! -f $Ext_filename ]]
then
    echo "np(no needed files)"
    exit
fi

for file in $(ls $1)
do
    for extention in $(cat $Ext_filename)
    do
        if [[ $file == *.$extention ]]
        then
            echo "file is"
            break
        fi  
    done
done



