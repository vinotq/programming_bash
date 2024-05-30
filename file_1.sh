#!/bin/bash

hm_numbers=0
sum_1=0
x=0

balancedNum ()
{
    number=$1
    
    for num in $(echo $number | grep -oP '.')
    do
        hm_numbers=$(($hm_numbers+1))
    done

    echo $hm_numbers

    if [[ $(($hm_numbers%2)) -eq 0 ]]
    then
        n_num=$hm_numbers

        while [[ $n_num -gt $((($hm_numbers+4)/2)) ]]
        do
            x=$(($number%10))
            sum_1=$(($sum_1+$x))
            n_num=$(($n_num-1))
        done
    else
        echo "ol"
    fi
    
    echo $sum_1
    
}

balancedNum $1