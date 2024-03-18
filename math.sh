#!/bin/bash 
function averge {
    sum=0
    for value in $@
    do  
        sum=$(($sum+$value))
    done
    echo $(($sum / $#))
}