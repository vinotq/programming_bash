#!/bin/bash 

file_name=file_numbers
k_ch=0
k_nch=0

if [[ ! -n $1 ]]
then    
    echo "np (no arg)"
    exit
fi

if ! [[ $1 == "0" || $1 == "1" ]]
then
    echo "np (not right arg (he is left))"
    exit
fi
if [[ ! -f $file_name ]]
then
    echo "no file $file_name (np)"
    exit
fi

for num in  $(cat $file_name)
do
    if [[ $(($num % 2)) -eq $1 ]]
    then 
        k_ch=$(($k_ch+1))
        echo $num
    else
        k_nch=$(($k_nch+1))
    fi

done > new_nums

if [[ $1 == "0" ]]
then
echo "Четных чисел: $k_nch"
echo "Нечетных чисел: $k_ch"
else
echo "Четных чисел: $k_ch"
echo "Нечетных чисел: $k_nch"
fi