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

balance="$(head -n 1 balance.txt)"

function show_info
{   
    printf "Please choose option:\n\n" 
    echo "To check your balance please enter 1"    
    echo "To show all banks please enter 2"    
    printf "To exit the program please enter 0\n\n"    
}

function is_balance_ok
{   
    if [[ $balance -eq 0 ]]
    then
        echo "You haven't got any money on yor balance!"
        echo " "
        exit
    fi
}

function show_balance 
{   
    clear
    balance="$(head -n 1 balance.txt)"    
    printf "✅ Your balance is: $balance🤯 \n\n"    
    show_info
}

function show_bank_list
{
    clear
    printf "There are all banks for this moment: \n\n"
    i=1
    if [[ ((-e $true_bank)) && (-e $inf_true_bank) ]]
    then
        num_true_bank=$i 
        echo "$i bank: $(head -n 1 $true_bank)"; i=$((i+1))
    else
        echo "😟 no more this bank :("
    fi

    if [[ ((-e $bers_bank)) && (-e $inf_bers_bank) ]]
    then
        num_bers_bank=$i 
        echo "$i bank: $(head -n 1 $bers_bank)"; i=$((i+1))
    else
        echo "😟 no more this bank :("
    fi
    
    if [[ ((-e $snegir_bb)) && (-e $inf_snegir_bb) ]]
    then
        num_snegir_bb=$i 
        echo "$i bank: $(head -n 1 $snegir_bb)"; i=$((i+1))
    else
        echo "😟 no more this bank :("
    fi
        
    if [[ ((-e $mr_fresh_app)) && (-e $inf_mr_fresh_app) ]]
    then
        num_mr_fresh_app=$i 
        echo "$i bank: $(head -n 1 $mr_fresh_app)"; i=$((i+1))
    else
        echo "😟 no more this bank :("
    fi
        
    if [[ ((-e $fast_money)) && (-e $inf_fast_money) ]]
    then
        num_fast_money=$i 
        echo "$i bank: $(head -n 1 $fast_money)"; i=$((i+1))
    else
        echo "😟 no more this bank :("
    fi
    
        echo " "
        echo " "
        echo "To select bank, enter number of bank"
        echo " "
        echo "Enter 0 to back to main menu"
        echo " "
        read -p "Please choose the bank: " choosed_bank
        echo " "
        echo " "

        if [[ $choosed_bank -eq 0 ]]
        then
            clear
            show_info
            return 47

        elif [[ $choosed_bank -eq num_true_bank ]]
        then
            show_bank_true_bank
        elif [[ $choosed_bank -eq num_bers_bank ]]
        then
            show_bank_bers_bank
        elif [[ $choosed_bank -eq num_fast_money ]]
        then
            show_bank_fast_money
        elif [[ $choosed_bank -eq num_mr_fresh_app ]]
        then
            show_bank_mr_fresh_app
        elif [[ $choosed_bank -eq num_snegir_bb ]]
        then
            show_bank_snegir_bb

        elif [[ $choosed_bank ]]
        then
            echo "There isn't this bank! Please choose correct bank!"    
        fi
}

function choose_sum
{   
    offer_percent
    clear

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

    printf "❗WARNING❗ If you chose sum of 🤯 which not wultiple of $min_eh, all not integer part of a benefit will be the commission of bank!\n\n\n"
    printf "✅ For this moment you have $balance🤯 \n\n"
    printf "If you chose 0, you will teleport to bank office\n\n" 

    read -p "Please choose the sum (min $min_eh🤯): " sum

    if [[ $sum -eq 0 ]]
    then
        show_bank_true_bank
    fi

    if [[ ($sum -lt $min_eh) || ($(($balance-$sum)) -lt 0) ]]
    then
        while [[ ($sum -lt $min_eh) || ($(($balance-$sum)) -lt 0) ]]
        do
            printf "\n❌ You haven't got this sum of 🤯 on your balance or sum less than $min_eh! \n\n"
            printf "✅ Please enter correct sum!\n\n"
            read -p "Please choose the sum (min $min_eh🤯): " sum
        done
        choise_check 
    else
        choise_check        
    fi

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
        show_info_fast_mone
    elif [[ num_mr_fresh_app -eq $choosed_bank ]]
    then
        show_info_mr_fresh_app
    elif [[ num_snegir_bb -eq $choosed_bank ]]
    then
        show_info_snegir_bb
    fi

    while true
    do
        read -p "Please choose the offer: " offer
        
        if [[ $offer -eq 0 ]]
        then
            show_bank_list
        
        elif [[ $offer -eq 1 ]]
        then 
            choose_sum
        
        elif [[ $offer -eq 2 ]]
        then
            choose_sum

        elif [[ $offer ]]
        then
            echo "No such offer. Please choose correct!"
        fi
    done       
}

function choise_check
{
    clear
    echo " "            
    read -p "❗WARNING❗ Are you actally want to give bank $sum? To complete - enter 1; If you don't want - enter 0: " choice
    echo " "
    
    if [[ $choice -eq 0 ]]
    then
        echo "✅ Now you can chose another sum of 🤯 or exit by enter 0"
        choose_sum

    elif [[ $choice -eq 1 ]]
    then
        
        offer_time
        clear

        printf "❗Time is going!❗\n\n"

        start=1
        end=100

        for number in $(seq ${start} ${end})
        do
            sleep $offer_time
            progress_bar ${number} ${end}
        done


        echo $(($RANDOM % 100 + 1)) > is_banckrup.txt

        for i in range 2
        do
            echo $(($RANDOM % 100 + 1)) >> is_banckrup.txt 
        done

        bankrupt=$(($RANDOM % 100 + 1))

        echo $(($RANDOM % 100 + 1)) > test_bankrup.txt #need to remove

        for i in $(cat "is_banckrup.txt")
        do
            if [[ $bankrupt -eq i ]]
            then
                clear
                balance=$(($balance-$sum))
                echo $balance > balance.txt
                printf "😭 Sadly, but this bank now is bankrupt! Now you can't have deposits in this bank because it doesn't exist!\n\n"
                printf "Also you loose $sum🤯 - all 🤯, which was in bank while this deposit!\n\n"
                printf "❗WARNING❗ After 10 seconds programm will shut down!\n\n"
                sleep 10
                cp $inf_true_bank ~/Документы/
                cp $true_bank ~/Документы/
                rm $inf_true_bank
                rm $true_bank
                exit

            else

            calculating_benefit 

            fi
        done
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

function calculating_benefit
{
    offer_percent

    clear

    benefit=$((($sum*$offer_percent)/100))

    balance=$(($balance+$benefit))
    echo $balance > balance.txt

    printf "🥳 Congratulations! Now you have $balance🤯. This offer gave you $benefit🤯 benefit! 🥳\n\n "
    printf "❗WARNING❗After 10 seconds you will teleport to bank office!\n\n"
    sleep 10
    show_bank_true_bank
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

