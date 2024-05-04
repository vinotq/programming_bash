#!/bin/bash

true_bank=./banks/true_bank.txt
inf_true_bank=bank_information_true_bank.sh
. ./bank_information_true_bank.sh

bers_bank=./banks/bers_bank.txt
inf_bers_bank=bank_information_bers_bank.sh
. ./bank_information_bers_bank.sh

snegir_bb=./banks/snegir_bb.txt
inf_snegir_bb=bank_information_snegir_bb.sh
. ./bank_information_snegir_bb.sh

mr_fresh_app=./banks/mr_fresh_app.txt
inf_mr_fresh_app=bank_information_mr_fresh_app.sh
. ./bank_information_mr_fresh_app.sh

fast_money=./banks/fast_money.txt
inf_fast_money=bank_information_fast_money.sh
. ./bank_information_fast_money.sh

function show_info
{   
    echo "To check your balance please enter 1"
    sleep 0.8
    echo "To show all banks please enter 2"
    sleep 0.8
    echo "To exit the program please enter 0"
    sleep 0.8
    echo " "
}
function show_balance 
{   
    balance="$(head -n 1 balance.txt)"
    sleep 0.8
    echo "Your balance is: $(head -n 1 balance.txt)"
    sleep 0.8
    echo " "
    show_info
}


function show_bank_list
{
    balance="$(head -n 1 balance.txt)"
    i=1
    if [[ ((-e $true_bank)) && (-e $inf_true_bank) ]]
    then
        num_true_bank=$i 
        sleep 0.5
        echo "$i bank: $(head -n 1 $true_bank)"; i=$((i+1))
    else
        echo "no more this bank :("
    fi

    if [[ ((-e $bers_bank)) && (-e $inf_bers_bank) ]]
    then
        num_bers_bank=$i 
        sleep 0.5
        echo "$i bank: $(head -n 1 $bers_bank)"; i=$((i+1))
    else
        echo "no more this bank :("
    fi
    
    if [[ ((-e $snegir_bb)) && (-e $inf_snegir_bb) ]]
    then
        num_snegir_bb=$i 
        sleep 0.5
        echo "$i bank: $(head -n 1 $snegir_bb)"; i=$((i+1))
    else
        echo "no more this bank :("
    fi
        
    if [[ ((-e $mr_fresh_app)) && (-e $inf_mr_fresh_app) ]]
    then
        num_mr_fresh_app=$i 
        sleep 0.5
        echo "$i bank: $(head -n 1 $mr_fresh_app)"; i=$((i+1))
    else
        echo "no more this bank :("
    fi
        
    if [[ ((-e $fast_money)) && (-e $inf_fast_money) ]]
    then
        num_fast_money=$i 
        sleep 0.5
        echo "$i bank: $(head -n 1 $fast_money)"; i=$((i+1))
    else
        echo "no more this bank :("
    fi
        sleep 0.8
        echo " "
        sleep 0.8
        echo " "
        sleep 0.8
        echo "To select bank, enter number of bank"
        echo " "
        sleep 0.8
        echo "Enter 0 to back to main menu"
        echo " "
        sleep 0.8
        read -p "Please choose the bank: " choosed_bank
        echo " "
        echo " "

        while true
        do


        if [[ $choosed_bank -eq 0 ]]
        then
            echo " "
            echo "You are in main menu"
            echo " "
            echo "To check your balance please enter 1"
            echo "To show all banks please enter 2"
            echo "To exit the program please enter 0"
            echo " "

            return 47

        elif [[ $choosed_bank -eq num_true_bank ]]
        then
            show_bank_true_bank
        elif [[ $choosed_bank -eq num_bers_bank ]]
        then
            echo "naaah2"
        elif [[ $choosed_bank -eq num_fast_money ]]
        then
            echo "naaah3"
        elif [[ $choosed_bank -eq num_mr_fresh_app ]]
        then
            echo "naaah4"
        elif [[ $choosed_bank -eq num_snegir_bb ]]
        then
            echo "naaah5"

        elif [[ $choosed_bank ]]
        then
            echo "There isn't this bank! Please choose correct bank!"    
        fi

        done
      
}

    



function progress_bar
{
    let progress=$((${1}*100/${2}*100))/100
    let done=$((${progress}*4))/10
    let left=40-$done
    fill=$(printf "%${done}s")
    empty=$(printf "%${left}s")
    printf "\rProgress : [${fill// /#}${empty// /-}] ${progress}%%"
}

