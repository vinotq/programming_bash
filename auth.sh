#!/bin/bash
. ./functions.sh

db_names=users
separator="|"
attempts=3

echo "Hi! This is authorization script"     #hi!
read -p "Please, enter your login: " login   #enter login :|

login_pswd=$(chech_login $login $db_names $separator)

if [[ $? -eq 0 ]]     #is user in base?
then
    echo "User $login doesn't exist in our base!"
    exit 1
fi

while [[ $attempts -ne 0 ]]   #bro have 3 attempts to pass this exam!
do
    read -s -p "Ok, now please enter your password: " password
    echo " "

    hash_pswd=$(hash_password $password)

    if [[ $login_pswd == $login$separator$hash_pswd  ]]   #is all good?
    then
        echo "Welcome! Autorization is complete!" #yep
        exit 0
    else
        attempts=$(($attempts-1))
        echo "Ohh.. Password isn't right, now you have $attempts attempts to login!" #no
    fi
done

echo "You lost all yout tryes! Have a nice day!"
capture_intruder
exit 2