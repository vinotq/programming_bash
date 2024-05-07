#!/bin/bash

function show_info_fast_money
{
    clear
    printf "✅ You in FastMoney office!\n\n\n"
    printf "🔎 There are all offers of this bank: \n\n"
    printf "$(tail -n 2 ./banks/fast_money.txt) \n\n\n"
    printf "⏩ To show a bank list enter 0\n\n"
}

function show_bank_fast_money
{
    while true
    do
        is_balance_ok
        offer_check
    done

}