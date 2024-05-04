#!/bin/bash
. ./functions.sh


echo " "
echo " "
echo " "
echo " "
echo "Hello! This is bank deposit program!" 
sleep 0.7
show_info

while true
do
read -p "Please choose option: " option

if [[ option -eq 0 ]]
then
    exit
elif [[ option -eq 1 ]]
then
    echo " "
    show_balance
elif [[ option -eq 2 ]]
then
    echo " "
    sleep 0.8
    echo "There are all banks for this moment: "
    sleep 0.8
    echo " "
    show_bank_list
elif [[ (option -ne 0) || (option -ne 1) || (option -ne 2) ]]
then
    echo "There isn't this option in program! Please enter correct option!"
fi
done


