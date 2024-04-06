#!/bin/bash
balance=$(head -n 1 data.txt)

function show_balance ()
{
    echo $balance
}

