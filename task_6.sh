#!/bin/bash 

read -p number 
read -p left 
read -p right 
if [[ $number -eq $left ]]
then
    echo "number is on left of the list"
elif [[ $number -eq $right ]]
then 
    echo "number is on right of the list"
elif [[ $number -lt $left ]]
then
    echo "number is lefter than list"
elif [[ $number -gt $right ]]
then
     echo "number is righter than list"
else
    echo "number is in this list"
fi




