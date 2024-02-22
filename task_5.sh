#!/bin/bash 
banned=7
sum=0
sum_file=sum_of_numbers
echo -n > $sum_file
while read number
do
    if [[ $number -ne $banned ]]
    then
        sum=$(($sum+$number))
    else
        echo "Это число в бане: $number" > banned_numbers
    fi
    sleep 0.5
done  < numbers
echo "ready"
echo "sum is: $sum" > $sum_file
