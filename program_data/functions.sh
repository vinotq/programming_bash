#!/bin/bash

true_bank=./banks/true_bank.txt
inf_true_bank=./banks/bank_information_true_bank.sh
. ./banks/bank_information_true_bank.sh

bers_bank=./banks/bers_bank.txt
inf_bers_bank=./banks/bank_information_bers_bank.sh
. ./banks/bank_information_bers_bank.sh

snegir_bb=./banks/snegir_bb.txt
inf_snegir_bb=./banks/bank_information_snegir_bb.sh
. ./banks/bank_information_snegir_bb.sh

mr_fresh_app=./banks/mr_fresh_app.txt
inf_mr_fresh_app=./banks/bank_information_mr_fresh_app.sh
. ./banks/bank_information_mr_fresh_app.sh

fast_money=./banks/fast_money.txt
inf_fast_money=./banks/bank_information_fast_money.sh
. ./banks/bank_information_fast_money.sh

balance="$(head -n 1 ./program_data/balance.txt)"

function main
{
    show_info

    read -p "💠 Please choose option: " option

    if ! echo "$option" | grep -Eq '^[0-9]+$'; then
        clear
        printf "🚩 No such option. In script using only numbers, so don't enter symbols here! 🚩\n\n"  
        main  
    fi

    if [[ option -eq 0 ]]
    then
        clear
        exit
    elif [[ option -eq 1 ]]
    then
        show_balance
    elif [[ option -eq 2 ]]
    then
        clear
        show_bank_list
    elif [[ (option -ne 0) || (option -ne 1) || (option -ne 2) ]]
    then
        clear
        printf "🚩 No such option. Please enter correct option! 🚩\n\n"
        main
    fi
}

function show_info
{ 
    printf "⭐ There are all functions: \n\n"
    echo "⏩ To check your balance please enter 1"    
    echo "⏩ To show all banks please enter 2"     
    printf "⏩ To exit the program please enter 0\n\n" 
}

function is_balance_ok
{   
    if [[ (($balance -lt 5)) ]]
    then
        clear
        end_game
    fi
}

function show_balance 
{   
    clear
    balance="$(head -n 1 ./program_data/balance.txt)"    
    printf "✅ Your balance is: $balance🤯 \n\n"
    main    
}

function determine_bank
{
    if [[ num_true_bank -eq $choosed_bank ]]
    then
        inf_bank=$inf_true_bank
        bank=$true_bank

    elif [[ num_bers_bank -eq $choosed_bank ]]
    then
        inf_bank=$inf_bers_bank
        bank=$bers_bank

    elif [[ num_fast_money -eq $choosed_bank ]]
    then
        inf_bank=$inf_fast_money
        bank=$fast_money

    elif [[ num_mr_fresh_app -eq $choosed_bank ]]
    then
        inf_bank=$inf_mr_fresh_app
        bank=$mr_fresh_app

    elif [[ num_snegir_bb -eq $choosed_bank ]]
    then
        inf_bank=$inf_snegir_bb
        bank=$snegir_bb

    fi
}

function choose_bank
{
    if [[ $choosed_bank -eq 0 ]]
    then
        clear
        main
    
    elif [[ $choosed_bank -eq num_true_bank ]]
    then
        clear
        show_bank_true_bank

    elif [[ $choosed_bank -eq num_bers_bank ]]
    then
        clear
        show_bank_bers_bank

    elif [[ $choosed_bank -eq num_fast_money ]]
    then
        clear
        show_bank_fast_money

    elif [[ $choosed_bank -eq num_mr_fresh_app ]]
    then
        clear
        show_bank_mr_fresh_app

    elif [[ $choosed_bank -eq num_snegir_bb ]]
    then
        clear
        show_bank_snegir_bb
    
    else
        clear
        printf "🚩 No such bank. Please choose correct bank! 🚩\n\n"   
        show_bank_list

    fi
}

function offer_percent
{
    if [[ num_true_bank -eq $choosed_bank ]]
    then
        offer_1_percent=10
        offer_2_percent=5

        if [[ $offer -eq 1 ]]
        then 
            offer_percent=$offer_1_percent
        else
            offer_percent=$offer_2_percent
        fi

    elif [[ num_bers_bank -eq $choosed_bank ]]
    then
        offer_1_percent=20
        offer_2_percent=10

        if [[ $offer -eq 1 ]]
        then 
            offer_percent=$offer_1_percent
        else
            offer_percent=$offer_2_percent
        fi

    elif [[ num_fast_money -eq $choosed_bank ]]
    then
        offer_1_percent=10
        offer_2_percent=5

        if [[ $offer -eq 1 ]]
        then 
            offer_percent=$offer_1_percent
        else
            offer_percent=$offer_2_percent
        fi

    elif [[ num_mr_fresh_app -eq $choosed_bank ]]
    then
        offer_1_percent=20
        offer_2_percent=10

        if [[ $offer -eq 1 ]]
        then 
            offer_percent=$offer_1_percent
        else
            offer_percent=$offer_2_percent
        fi

    elif [[ num_snegir_bb -eq $choosed_bank ]]
    then
        offer_1_percent=10
        offer_2_percent=5

        if [[ $offer -eq 1 ]]
        then 
            offer_percent=$offer_1_percent
        else
            offer_percent=$offer_2_percent
    fi
    fi
}

function offer_time
{
    if [[ num_true_bank -eq $choosed_bank ]]
    then
        offer_1_time=0.45
        offer_2_time=0.3

        if [[ $offer -eq 1 ]]
        then 
            offer_time=$offer_1_time
        else
            offer_time=$offer_2_time
        fi

    elif [[ num_bers_bank -eq $choosed_bank ]]
    then
        offer_1_time=0.6
        offer_2_time=0.47

        if [[ $offer -eq 1 ]]
        then 
            offer_time=$offer_1_time
        else
            offer_time=$offer_2_time
        fi

    elif [[ num_fast_money -eq $choosed_bank ]]
    then
        offer_1_time=0.17
        offer_2_time=0.08

        if [[ $offer -eq 1 ]]
        then 
            offer_time=$offer_1_time
        else
            offer_time=$offer_2_time
        fi

    elif [[ num_mr_fresh_app -eq $choosed_bank ]]
    then
        offer_1_time=0.44
        offer_2_time=0.22

        if [[ $offer -eq 1 ]]
        then 
            offer_time=$offer_1_time
        else
            offer_time=$offer_2_time
        fi

    elif [[ num_snegir_bb -eq $choosed_bank ]]
    then
        offer_1_time=0.47
        offer_2_time=0.16

        if [[ $offer -eq 1 ]]
        then 
            offer_time=$offer_1_time
        else
            offer_time=$offer_2_time
    fi
    fi
}

function determine_bankrupt_percent
{
    if [[ num_true_bank -eq $choosed_bank ]]
    then
        bankrupt_percent=3

    elif [[ num_bers_bank -eq $choosed_bank ]]
    then
        bankrupt_percent=1

    elif [[ num_fast_money -eq $choosed_bank ]]
    then
        bankrupt_percent=47

    elif [[ num_mr_fresh_app -eq $choosed_bank ]]
    then
        bankrupt_percent=4

    elif [[ num_snegir_bb -eq $choosed_bank ]]
    then
        bankrupt_percent=11 

    fi
}

function show_bank_list
{
    printf "⭐ There are all banks for this moment: \n\n"
    i=1
    if [[ ((-e $true_bank)) && (-e $inf_true_bank) ]]
    then
        num_true_bank=$i 
        echo "$i 🏦: $(head -n 1 $true_bank)"; i=$((i+1))
    else
        echo "🚫 This bank is bankrupt 🚫"
    fi

    if [[ ((-e $bers_bank)) && (-e $inf_bers_bank) ]]
    then
        num_bers_bank=$i 
        echo "$i 🏦: $(head -n 1 $bers_bank)"; i=$((i+1))
    else
        echo "🚫 This bank is bankrupt 🚫"
    fi
    
    if [[ ((-e $snegir_bb)) && (-e $inf_snegir_bb) ]]
    then
        num_snegir_bb=$i 
        echo "$i 🏦: $(head -n 1 $snegir_bb)"; i=$((i+1))
    else
        echo "🚫 This bank is bankrupt 🚫"
    fi
        
    if [[ ((-e $mr_fresh_app)) && (-e $inf_mr_fresh_app) ]]
    then
        num_mr_fresh_app=$i 
        echo "$i 🏦: $(head -n 1 $mr_fresh_app)"; i=$((i+1))
    else
        echo "🚫 This bank is bankrupt 🚫"
    fi
        
    if [[ ((-e $fast_money)) && (-e $inf_fast_money) ]]
    then
        num_fast_money=$i 
        echo "$i 🏦: $(head -n 1 $fast_money)"; i=$((i+1))
    else
        echo "🚫 This bank is bankrupt 🚫"
    fi

        printf "\n\n⏩ To select bank, enter number of bank \n⏩ Enter 0 to back to main menu \n\n"
        read -p "💠 Please choose the bank: " choosed_bank

        if ! echo "$choosed_bank" | grep -Eq '^[0-9]+$'; then
            clear
            printf "🚩 No such option. In script using only numbers, so don't enter symbols here! 🚩\n\n"  
            show_bank_list  
        fi

        choose_bank
}

function offer_check
{   
    if [[ num_true_bank -eq $choosed_bank ]]
    then
        show_info_true_bank
    elif [[ num_bers_bank -eq $choosed_bank ]]
    then
        show_info_bers_bank
    elif [[ num_fast_money -eq $choosed_bank ]]
    then
        show_info_fast_money
    elif [[ num_mr_fresh_app -eq $choosed_bank ]]
    then
        show_info_mr_fresh_app
    elif [[ num_snegir_bb -eq $choosed_bank ]]
    then
        show_info_snegir_bb
    fi

    read -p "💠 Please choose the offer: " offer

    if ! echo "$offer" | grep -Eq '^[0-9]+$'; then
        clear
        printf "🚩 No such option. In script using only numbers, so don't enter symbols here! 🚩\n\n"  
        offer_check 
    fi
    
    if [[ $offer -eq 0 ]]
    then
        clear
        show_bank_list
            
    elif [[ ($offer -eq 1) || ($offer -eq 2) ]]
    then 
        clear
        choose_sum

    else
        clear
        printf "🚩 No such offer. Please choose correct! 🚩\n\n"
        offer_check
    fi  
}

function choose_sum
{   
    offer_percent

    if [[ offer_percent -eq 5 ]]
    then
        min_eh=20
    elif [[ offer_percent -eq 10 ]]
    then
        min_eh=10
    elif [[ offer_percent -eq 20 ]]
    then
        min_eh=5
    fi

    printf "\n❗WARNING❗\n\n🚨 If you chose sum of 🤯 which not wultiple of $min_eh, all float part of a benefit will be the commission of bank! 🚨\n\n\n"
    printf "✅ For this moment you have $balance🤯 \n\n\n"
    printf "⏩ Choose 0 to teleport to bank office\n" 
    printf "⏩ Enter the sum in the bracket bellow\n\n"

    read -p "💠 Please choose the sum (min $min_eh🤯): " sum

    if ! echo "$sum" | grep -Eq '^[0-9]+$'; then
        clear
        printf "🚩 No such option. In script using only numbers, so don't enter symbols here! 🚩\n\n"  
        choose_sum 
    fi

    if [[ $sum -eq 0 ]]
    then
        choose_bank
    fi

    if [[ ($sum -lt $min_eh) || ($(($balance-$sum)) -lt 5) ]]
    then
        while [[ ($sum -lt $min_eh) || ($(($balance-$sum)) -lt 5) ]]
        do
            clear
            printf "❌ You haven't got this sum of 🤯 on your balance or sum less than sum for this deposit ($min_eh)! ❌ \n"
            printf "❌ Also the minimum balance is 5, so sum of deposit need to be greater or equal $(($balance-5))! ❌ \n\n"
            printf "💡 Please enter correct sum!\n"
            choose_sum

        done
        clear
        choice_check 
        
    else
        clear
        choice_check        
    fi

}

function choice_check
{
    printf "\n❗WARNING❗ \n\n❓ Are you actally want to give bank $sum? ❓ \n\n⏩ To complete - enter 1\n⏩ If you don't want complere deposite enter 0\n\n"            
    read -p "💠 Please choose choice: " choice

    if ! echo "$choice" | grep -Eq '^[0-9]+$'; then
        clear
        printf "🚩 No such option. In script using only numbers, so don't enter symbols here! 🚩\n\n"  
        choice_check  
    fi

    echo " "
    
    if [[ $choice -eq 0 ]]
    then
        clear
        printf "💡 Now you can chose another sum of 🤯 or exit by enter 0\n\n"
        choose_sum

    elif [[ $choice -eq 1 ]]
    then
        
        offer_time
        clear

        printf "⏳ Time is going! ⏳ \n\n"

        start=1
        end=100

        for number in $(seq ${start} ${end})
        do
            sleep $offer_time
            progress_bar ${number} ${end}
        done

        determine_bankrupt_percent

        is_bankrupt=$(($RANDOM % 100 + 1))

        if [[ $is_bankrupt -lt $bankrupt_percent ]]
        then
            clear

            balance=$(($balance-$sum))

            echo $balance > ./program_data/balance.txt
            printf "💥 Sadly, but this bank now is bankrupt! Now you can't have deposits in this bank because it doesn't exist! 💥\n\n"
            printf "😭 Also you loose $sum🤯 - all 🤯, which was in bank while this deposit! 😭\n\n"
            printf "❗WARNING❗\nAfter 15 seconds programm will shut down!\n\n"

            determine_bank

            cp $inf_bank ~/Документы/
            cp $bank ~/Документы/
            rm $inf_bank
            rm $bank
            
            sleep 15

            clear
            exit
            
        else
            calculating_benefit
        fi
    
    else 
        clear
        printf "🚩 No such option. Please choose correct! 🚩\n\n"
        choice_check

    fi
}

function calculating_benefit
{
    offer_percent

    clear

    benefit=$((($sum*$offer_percent)/100))

    balance=$(($balance+$benefit))
    echo $balance > ./program_data/balance.txt

    printf "🥳 Congratulations! Now you have $balance🤯. This offer gave you $benefit🤯 benefit! 🥳\n\n"
    printf "❗WARNING❗\n\nAfter 10 seconds you will teleport to bank office!\n\n"
    sleep 10

    choose_bank
}

function progress_bar
{
    let progress=$((${1}*100/${2}*100))/100
    let done=$((${progress}*4))/10
    let left=40-$done
    fill=$(printf "%${done}s")
    empty=$(printf "%${left}s")
    printf "\r✅ Progress : [${fill// /#}${empty// /-}] ${progress}%%"
}

function end_game
{
    printf "🥳 Congratulations! 🥳 \n\nBecause you have $balance🤯 on your balance, 🎷 game is over (minimum sum is 5🤯) \n\n"
    printf "💙 Thank you for plaing! Bye! 💙\n"

    sleep 15

    main_f=./main.sh
    main_folder=./program_data
    banks=./banks

    cp $main_f ~/Документы/
    cp -r $main_folder ~/Документы/
    cp -r $banks ~/Документы/
    rm -r $banks
    rm -r $main_folder
    rm  $main_f
    

    clear
    exit
}

