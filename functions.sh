#!/bin/bash

separator="|"
balance=$(head -n 1 balance.txt)

function show_balance 
{   
    balance=$(head -n 1 balance.txt)
    echo $balance
}

function show_bank_list
{
    echo "this funk works (real)"
}

