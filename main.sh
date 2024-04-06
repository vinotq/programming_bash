#!/bin/bash



balance=$(head -n 1 data.txt)

echo "Hello! This is bank deposit program!" 
echo " "
echo "To check your balance please enter 1"
echo "To show all banks please enter 2"
echo "To exit the program please enter 0"
echo " "

read -p "Please choose option what you want to do: " option

if [[ option -eq 0 ]]
then
    exit
elif [[ option -eq 1 ]]
then
    show_balance()
elif [[ option -eq 2 ]]
then
    echo "in future it will be banks here"
elif [[ (option -ne 0) || (option -ne 1) || (option -ne 2) ]]
then
    echo "Thare aren't rhis option!"
    exit
fi



