#!/bin/bash
. ./functions.sh

function show_bank_true_bank
{
    echo " "
    echo "You in TrueBank office!"
    echo " "
    echo "There are all offers of this bank:"
    echo "$(tail -n 2 ./banks/true_bank.txt)"
    echo " "
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
        
        if [[ $offer -eq 1 ]]
        then

            while true
            do
                read -p "Please choose the sum of money: " sum
                
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

                        echo " "
                        echo "You good!"

                        
                        benefit=$((($sum*$offer_persent)/100))

                        balance=$(($balance+$benefit))
                        echo $balance > balance.txt

                        echo "Congratulations! Now you have $balance. This offer gives you $benefit benefit!"

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

        elif [[ $offer -eq 0 ]]
        then
            return 47
        fi
        fi
    done



}