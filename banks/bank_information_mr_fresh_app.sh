#!/bin/bash

function show_info_mr_fresh_app
{
    printf "✅ You in Mr. Fresh Appartments office!\n\n\n"
    printf "🔎 There are all offers of this bank: \n\n"
    printf "$(tail -n 2 ./banks/mr_fresh_app.txt) \n\n\n"
    printf "⏩ To show a bank list enter 0\n\n"
}

function show_bank_mr_fresh_app
{
    while true
    do
        is_balance_ok
        offer_check
    done

}