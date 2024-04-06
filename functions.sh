#!/bin/bash
function show_balance 
{   
    balance=$(head -n 1 data.txt)
    echo $balance
}

