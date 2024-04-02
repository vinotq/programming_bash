#!/bin/bash

# $1 is login, $2 is db_name, $3 is separator

function chech_login      # is login in base? + is base exist?
{
    login=$1
    db_name=$2
    separator=$3
    if [[ -f $db_name ]]     
    then
        for line in $(cat $db_name)
        do 
            if [[ $line == $login$separator* ]]
            then
                echo $line
                return 1 # exit with error
            fi
        done
    fi
}

function hash_password   # hashing password :| 
{
    echo $1 | sha256sum | awk '{print $1}'
}

function capture_intruder 
{
    directory=intruders

    if [[ ! -d $directory ]]
    then
        mkdir $directory
    fi

    today=$(date)

    ffmpeg -i /dev/video0 -t 1 "$directory/$today.png" 1> /dev/null 2> /dev/null 
}
