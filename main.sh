#!/bin/bash
. ./functions.sh

clear
printf "Hello! This is bank-deposit system simulator!\n\n"
sleep 3.5
clear
show_info

while true
do
read -p "Please choose option: " option

if [[ option -eq 0 ]]
then
    exit
elif [[ option -eq 1 ]]
then
    show_balance
elif [[ option -eq 2 ]]
then
    show_bank_list
elif [[ (option -ne 0) || (option -ne 1) || (option -ne 2) ]]
then
    echo "There isn't this option in program! Please enter correct option!"
fi
done


