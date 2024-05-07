#!/bin/bash
. ./program_data/functions.sh

clear
is_balance_ok
printf "Hello! 👋 \n\n💶 This is bank-deposit system simulator! 💶 \n\n"
sleep 3.5
clear

while true
do
    main
done
