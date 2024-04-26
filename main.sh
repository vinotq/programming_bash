#!/bin/bash
. ./functions.sh
. ./bank_information.sh

echo " "
echo " "
echo " "
echo " "
echo "Hello! This is bank deposit program!" 
echo " "
echo "To check your balance please enter 1"
echo "To show all banks please enter 2"
echo "To exit the program please enter 0"
echo " "

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


