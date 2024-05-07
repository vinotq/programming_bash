#!/bin/bash

function show_info_bers_bank
{
    clear
    printf "✅ You in BersBank office!\n\n\n"
    printf "🔎 There are all offers of this bank: \n\n"
    printf "$(tail -n 2 ./banks/bers_bank.txt) \n\n\n"
    printf "⏩ To show a bank list enter 0\n\n"
}

function show_bank_bers_bank
{
    while true
    do
        is_balance_ok
        offer_check
    done

}