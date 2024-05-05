#!/bin/bash

function show_info_snegir_bb
{
    clear
    printf "✅ You in SnegirBB office!\n\n\n"
    printf "There are all offers of this bank: \n\n"
    printf "$(tail -n 2 ./banks/snegir_bb.txt) \n\n"
    printf "To leave to main menu please enter 0\n\n"
}

function show_bank_snegir_bb
{
    while true
    do
        is_balance_ok
        offer_check
    done

}