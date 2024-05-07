#!/bin/bash

function show_info_true_bank
{
    printf "✅ You in TrueBank office!\n\n\n"
    printf "🔎 There are all offers of this bank: \n\n"
    printf "$(tail -n 2 ./banks/true_bank.txt) \n\n\n"
    printf "⏩ To show a bank list enter 0\n\n"
}

function show_bank_true_bank
{
    while true
    do
        is_balance_ok
        offer_check
    done

}