#!/bin/bash

function show_bank_true_bank
{
    echo " "
    echo " "
    echo " "
    sleep 0.8
    echo "You in TrueBank office!"
    echo " "
    echo " "
    sleep 0.8
    echo "There are all offers of this bank:"
    echo " "
    sleep 0.8
    echo "$(tail -n 2 ./banks/true_bank.txt)"
    sleep 0.8
    echo " "
    sleep 0.8
    echo "To leave to main menu please enter 0"
    echo " "

    while true
    do
        if [[ $balance -eq 0 ]]
        then
            echo "You haven't got any money on yor balance!"
            echo " "
            exit
        
        elif [[ $balance ]]
        then

        read -p "Please choose the offer: " offer
        
        if [[ $offer -eq 0 ]]
        then
            echo " "
            sleep 0.8
            echo "You are in main bank menu"
            echo " "
            sleep 0.8
            show_bank_list
        
        elif [[ $offer -eq 1 ]]
        then
            sleep 0.8
            while true
            do
                echo " " 
                echo "!WARNING! If you chose sum which not wultiple of 10, all not an integer part of a benefit will be the commission of bank!"
                sleep 0.8
                echo " " 
                echo "If you chose 0, you will teleported to bank office"
                echo " " 
                sleep 0.8
                echo "(For this moment you have $balance money)"
                read -p "Please choose the sum of money (min 10): " sum

                if [[ $sum -eq 0 ]]
                then
                    return 47
                fi

                if [[ $sum -lt 10 ]]
                then
                    while [[ $sum -lt 10 ]]
                    do
                        echo " "
                        echo "Please enter correct sum!"
                        echo " "
                        read -p "Please choose the sum of money (min 10): " sum
                    done
                fi

                if [[ $(($balance-$sum)) -lt 0 ]]
                then
                    echo " "
                    echo "You haven't got this money on your balance! You have only $balance. Please enter correct sum!"
                    echo " "

                elif [[ $(($balance-$sum)) ]]
                then

                    echo " "            
                    read -p "Are you actally want to give bank $sum? To complete - enter 1; If you don't want - enter 0: " choice
                    echo " "
                    
                    offer_persent=10

                    if [[ $choice -eq 0 ]]
                    then
                        return 47

                    elif [[ $choice -eq 1 ]]
                    then

                        echo "Time is going!"

                        start=1
                        end=100

                        for number in $(seq ${start} ${end})
                        do
                            sleep 0.1
                            progress_bar ${number} ${end}
                        done

                        sleep 1

                        is_bankrupt=$(($RANDOM % 100 + 1))

                        echo $is_bankrupt > is_banckrup.txt 

                        sleep 1  

                        #if [[ ($is_bankrupt -eq 14) || ($is_bankrupt -eq 47) || ($is_bankrupt -eq 88) ]]
                        if [[ $is_bankrupt -lt 50 ]]
                        then
                            balance=$(($balance-$sum))
                            echo $balance > balance.txt
                            echo " "
                            echo " "
                            echo " "
                            echo "Sadly, but this bank now is bankrupt! Now you can't have deposits in this bank because it doesn't exist!"
                            echo "Also you loose $sum - all money, which was in bank while this deposit!"
                            echo " "
                            echo " "
                            sleep 5
                            cp bank_information_true_bank.sh ~/Документы/
                            rm bank_information_true_bank.sh
                            cp $true_bank ~/Документы/
                            rm $true_bank
                            exit
                        else

                        benefit=$((($sum*$offer_persent)/100))

                        balance=$(($balance+$benefit))
                        echo $balance > balance.txt

                        echo " "
                        echo "Congratulations! Now you have $balance. This offer gives you $benefit benefit!"

                        fi

                    elif [[ $choice ]]
                    then
                        echo "No such option. Please choose correct!"
                    fi
                fi
            done

        elif [[ $offer -eq 2 ]]
        then
            echo "funtion will be."

        elif [[ $offer ]]
        then
            echo "No such offer. Please choose correct!"
        fi
        fi
    done

}