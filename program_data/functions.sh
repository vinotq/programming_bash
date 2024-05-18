#!/bin/bash

true_bank=./banks/true_bank.txt
bers_bank=./banks/bers_bank.txt
snegir_bb=./banks/snegir_bb.txt
mr_fresh_app=./banks/mr_fresh_app.txt
fast_money=./banks/fast_money.txt

balance="$(head -n 1 ./program_data/balance.txt)"

function main
{
    show_info

    read -p "💠 Please choose option: " option

    if ! echo "$option" | grep -Eq '^[0-9]+$'
    then
        clear
        printf "🚩 There is no such option. The script uses only numbers, so don't enter characters here! 🚩\n\n"  
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
    else
        clear
        printf "🚩 There is no such option. Enter the correct option! 🚩\n\n"
        main
    fi
}

function show_info
{ 
    printf "⭐ There are all functions: \n\n"
    echo "⏩ To check your balance enter 1"    
    echo "⏩ To show all banks enter 2"     
    printf "⏩ To exit the program enter 0\n\n" 
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
        bank=$true_bank

        line=$(cat $bank)

        bank_name=$(echo "$line" | cut -d'|' -f1)
        bankrupt_percent=$(echo "$line" | cut -d'|' -f2)
        offer_1_percent=$(echo "$line" | cut -d'|' -f3)
        offer_1_time=$(echo "$line" | cut -d'|' -f4)
        offer_2_percent=$(echo "$line" | cut -d'|' -f5)
        offer_2_time=$(echo "$line" | cut -d'|' -f6)

        if [[ $offer -eq 1 ]]
        then 
            offer_percent=$offer_1_percent
            offer_time=$offer_1_time
        else
            offer_percent=$offer_2_percent
            offer_time=$offer_2_time
        fi

    elif [[ num_bers_bank -eq $choosed_bank ]]
    then
        bank=$bers_bank

        line=$(cat $bank)

        bank_name=$(echo "$line" | cut -d'|' -f1)
        bankrupt_percent=$(echo "$line" | cut -d'|' -f2)
        offer_1_percent=$(echo "$line" | cut -d'|' -f3)
        offer_1_time=$(echo "$line" | cut -d'|' -f4)
        offer_2_percent=$(echo "$line" | cut -d'|' -f5)
        offer_2_time=$(echo "$line" | cut -d'|' -f6)

        if [[ $offer -eq 1 ]]
        then 
            offer_percent=$offer_1_percent
            offer_time=$offer_1_time
        else
            offer_percent=$offer_2_percent
            offer_time=$offer_2_time
        fi

    elif [[ num_fast_money -eq $choosed_bank ]]
    then
        bank=$fast_money

        line=$(cat $bank)

        bank_name=$(echo "$line" | cut -d'|' -f1)
        bankrupt_percent=$(echo "$line" | cut -d'|' -f2)
        offer_1_percent=$(echo "$line" | cut -d'|' -f3)
        offer_1_time=$(echo "$line" | cut -d'|' -f4)
        offer_2_percent=$(echo "$line" | cut -d'|' -f5)
        offer_2_time=$(echo "$line" | cut -d'|' -f6)

        if [[ $offer -eq 1 ]]
        then 
            offer_percent=$offer_1_percent
            offer_time=$offer_1_time
        else
            offer_percent=$offer_2_percent
            offer_time=$offer_2_time
        fi

    elif [[ num_mr_fresh_app -eq $choosed_bank ]]
    then
        bank=$mr_fresh_app

        line=$(cat $bank)

        bank_name=$(echo "$line" | cut -d'|' -f1)
        bankrupt_percent=$(echo "$line" | cut -d'|' -f2)
        offer_1_percent=$(echo "$line" | cut -d'|' -f3)
        offer_1_time=$(echo "$line" | cut -d'|' -f4)
        offer_2_percent=$(echo "$line" | cut -d'|' -f5)
        offer_2_time=$(echo "$line" | cut -d'|' -f6)

        if [[ $offer -eq 1 ]]
        then 
            offer_percent=$offer_1_percent
            offer_time=$offer_1_time
        else
            offer_percent=$offer_2_percent
            offer_time=$offer_2_time
        fi

    elif [[ num_snegir_bb -eq $choosed_bank ]]
    then
        bank=$snegir_bb

        line=$(cat $bank)

        bank_name=$(echo "$line" | cut -d'|' -f1)
        bankrupt_percent=$(echo "$line" | cut -d'|' -f2)
        offer_1_percent=$(echo "$line" | cut -d'|' -f3)
        offer_1_time=$(echo "$line" | cut -d'|' -f4)
        offer_2_percent=$(echo "$line" | cut -d'|' -f5)
        offer_2_time=$(echo "$line" | cut -d'|' -f6)

        if [[ $offer -eq 1 ]]
        then 
            offer_percent=$offer_1_percent
            offer_time=$offer_1_time
        else
            offer_percent=$offer_2_percent
            offer_time=$offer_2_time
        fi

    fi
}

function pattern_out
{
    printf "✅ You are in $bank_name office!\n\n⭐ There are all offers of this bank: \n\n"
    printf "⚡ 1-st offer: $offer_1_percent persents for $offer_1_time seconds\n"
    printf "⚡ 2-sd offer: $offer_2_percent persents for $offer_2_time seconds\n\n"
    offer_check
}

function choose_bank
{
    determine_bank

    if [[ $choosed_bank -eq 0 ]]
    then
        clear
        main
    
    elif [[ $choosed_bank -eq num_true_bank ]]
    then
        clear
        pattern_out

    elif [[ $choosed_bank -eq num_bers_bank ]]
    then
        clear
        pattern_out        

    elif [[ $choosed_bank -eq num_fast_money ]]
    then
        clear
        pattern_out

    elif [[ $choosed_bank -eq num_mr_fresh_app ]]
    then
        clear
        pattern_out

    elif [[ $choosed_bank -eq num_snegir_bb ]]
    then
        clear
        pattern_out
            
    else
        clear
        printf "🚩 No such bank. Choose the correct bank! 🚩\n\n"   
        show_bank_list

    fi
}

function show_bank_list
{
    if [[ (! -e $true_bank) && (! -e $bers_bank) && (! -e $mr_fresh_app) && (! -e $fast_money) && (! -e $snegir_bb) ]]
    then
        end_game
    fi

    i=1

    printf "⭐ There are all banks for this moment: \n\n"

    if [[ -e $true_bank ]]
    then
        bank=$true_bank
        num_true_bank=$i 
        
        line=$(cat $bank)

        echo "$i 🏦: $(echo "$line" | cut -d'|' -f1)"; i=$((i+1))
    else
        echo "🚫 This bank is bankrupt 🚫"
    fi

    if [[ -e $bers_bank ]]
    then
        bank=$bers_bank
        num_bers_bank=$i 

        line=$(cat $bank)

        echo "$i 🏦: $(echo "$line" | cut -d'|' -f1)"; i=$((i+1))
    else
        echo "🚫 This bank is bankrupt 🚫"
    fi
    
    if [[ -e $snegir_bb ]]
    then
        bank=$snegir_bb
        num_snegir_bb=$i 

        line=$(cat $bank)

        echo "$i 🏦: $(echo "$line" | cut -d'|' -f1)"; i=$((i+1))
    else
        echo "🚫 This bank is bankrupt 🚫"
    fi
        
    if [[ -e $mr_fresh_app ]]
    then
        bank=$mr_fresh_app
        num_mr_fresh_app=$i 

        line=$(cat $bank)

        echo "$i 🏦: $(echo "$line" | cut -d'|' -f1)"; i=$((i+1))
    else
        echo "🚫 This bank is bankrupt 🚫"
    fi
        
    if [[ -e $fast_money ]]
    then
        bank=$fast_money
        num_fast_money=$i 

        line=$(cat $bank)

        echo "$i 🏦: $(echo "$line" | cut -d'|' -f1)"; i=$((i+1))
    else
        echo "🚫 This bank is bankrupt 🚫"
    fi

        printf "\n\n⏩ To select bank, enter the bank number\n⏩ Enter 0 to return to main menu \n\n"
        read -p "💠 Please choose the bank: " choosed_bank

        if ! echo "$choosed_bank" | grep -Eq '^[0-9]+$'
        then
            clear
            printf "🚩 There is no such option. The script uses only numbers, so don't enter characters here! 🚩\n\n"  
            show_bank_list  
        fi

        choose_bank
}

function offer_check
{   
    read -p "💠 Please choose the offer: " offer

    if ! echo "$offer" | grep -Eq '^[0-9]+$'
    then
        clear
        printf "🚩 There is no such option. The script uses only numbers, so don't enter characters here! 🚩\n\n"
        pattern_out  
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
        printf "🚩 No such offer. Choose the correct! 🚩\n\n"
        pattern_out
        offer_check
    fi  
}

function choose_sum
{   
    determine_bank

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

    printf "\n❗WARNING❗\n\n🚨 If you choose sum of 🤯 which not wultiple of $min_eh, all float part of a benefit will be the commission of bank! 🚨\n\n\n"
    printf "✅ For this moment you have $balance🤯 \n\n\n"
    printf "⏩ Choose 0 to teleport to bank office\n" 
    printf "⏩ Enter the sum in the bracket bellow\n\n"

    read -p "💠 Please choose the sum (min $min_eh🤯): " sum

    if ! echo "$sum" | grep -Eq '^[0-9]+$'
    then
        clear
        printf "🚩 There is no such option. The script uses only numbers, so don't enter characters here! 🚩\n\n"  
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

    if ! echo "$choice" | grep -Eq '^[0-9]+$'
    then
        clear
        printf "🚩 There is no such option. The script uses only numbers, so don't enter characters here! 🚩\n\n"  
        choice_check  
    fi

    echo " "
    
    if [[ $choice -eq 0 ]]
    then
        clear
        printf "💡 Now you can choose another sum of 🤯\n\n"
        choose_sum

    elif [[ $choice -eq 1 ]]
    then
        
        determine_bank
        clear

        printf "⏳ Time is going! ⏳ \n\n"

        start=1
        end=100

        for number in $(seq ${start} ${end})
        do
            sleep "$(bc<<<"scale=2;$offer_time/100")"
            progress_bar ${number} ${end}
        done

        determine_bank

        is_bankrupt=$(($RANDOM % 100 + 1))

        if [[ $is_bankrupt -lt $bankrupt_percent ]]
        then
            clear

            balance=$(($balance-$sum))

            echo $balance > ./program_data/balance.txt
            printf "💥 Sadly, but this bank now is bankrupt! Now you can't have deposits in this bank because it doesn't exist! 💥\n\n"
            printf "😭 Also you loose $sum🤯 - all 🤯, which were your deposit! 😭\n\n"
            printf "❗WARNING❗\nAfter 15 seconds programm will shut down!\n\n"

            determine_bank
            
            rm $bank
            
            sleep 10

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
    determine_bank

    clear

    benefit=$((($sum*$offer_percent)/100))

    balance=$(($balance+$benefit))
    echo $balance > ./program_data/balance.txt

    printf "🥳 Congratulations!🥳\n\n💸 Now you have $balance🤯. This offer gave you $benefit🤯 benefit! 💸\n\n"
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
    printf "\r✅ Progress: [${fill// /#}${empty// /-}] ${progress}%%"
}

function end_game
{
    main_f=./main.sh
    main_folder=./program_data
    banks=./banks

    if [[ $balance -lt 5 ]]
    then
        printf "🥳 Congratulations! 🥳 \n\n🎷🎷 Because you have $balance🤯 on your balance, game is over (minimum balance is 5🤯) 🎷🎷\n\n"
        printf "🌟 Thank you for plaing! Bye! 🌟\n"
    else
        printf "🥳 Congratulations! 🥳 \n\n🎷🎷 Because all banks are bankrupts, game is over 🎷🎷\n\n"
        printf "🌟 Thank you for plaing! Bye! 🌟\n"
    fi

    sleep 10

    rm -r $banks
    rm -r $main_folder
    rm  $main_f
    
    clear
    exit
}
