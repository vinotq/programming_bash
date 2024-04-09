#!/bin/bash


function show_balance 
{   
    balance=$(head -n 1 balance.txt)
    echo $balance
}

function show_bank_list
{
    echo "To select bank, enter number of bank"
    echo "Enter 0 to back to main menu"
    echo " "
    echo "First Bank: $(head -n 1 ./banks/true_bank.txt)"
    echo "Second Bank: $(head -n 1 ./banks/bers_bank.txt) "
    echo "Third Bank: $(head -n 1 ./banks/mr_fresh_app.txt)"
    echo "Forth Bank: $(head -n 1 ./banks/fast_money.txt)"
    echo "Fith Bank: $(head -n 1 ./banks/snegir_bb.txt)"
    echo " "
    

    while true
    do

    read -p "Please choose the bank: " choosed_bank

    if [[ choosed_bank -eq 1 ]]
    then
        echo " "
        echo "s"
    elif [[ choosed_bank -eq 2 ]]
    then
        echo "naaah2"
    elif [[ choosed_bank -eq 3 ]]
    then
        echo "naaah3"
    elif [[ choosed_bank -eq 4 ]]
    then
        echo "naaah4"
    elif [[ choosed_bank -eq 5 ]]
    then
        echo "naaah5"

    elif [[ choosed_bank -eq 0 ]]
    then
        echo " "
        echo "You are in main menu"
        echo " "
        echo "To check your balance please enter 1"
        echo "To show all banks please enter 2"
        echo "To exit the program please enter 0"
        echo " "

        return 47    
        elif [[ (choosed_bank -ne 0) || (choosed_bank -ne 1) || (choosed_bank -ne 2) || (choosed_bank -ne 3) || (choosed_bank -ne 4) || (choosed_bank -ne 5) ]]
        then
        echo "There isn't this bank! Please choose correct bank!"    
    fi

    done
}

