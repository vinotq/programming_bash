#!/bin/bash

. ./functions.sh
separator="|"
db_name=users

# starting script
echo "Hi, this is registration script!"
read -p "Please enter your login (all symbols, expect |): " login

if [[ ! -n $login ]]     # empty login cheching
then
    echo "Login can't be empty!"
    exit
fi

if [[ $login == *$separator* ]]     # is separator in login?
then
    echo "Login can't contain $separator!"
    exit
fi 

if ! chech_login $login $db_name $separator > /dev/null # checking loging in base
then
    echo "This login is already exist in base!"
    exit
fi

read -s -p "Please enter your password:" password
echo " "
read -s -p "Please repeat your password:" repeat
echo " "

if [[ ! -n $password ]] # is password empty?
then
    echo "Password can't be empty!"
    exit
fi

if [[ $password != $repeat ]] # is passwords OK?
then
    echo "Passwords are not same!"
    exit
fi

hash_pswd=$(hash_password $password)
echo "$login$separator$hash_pswd" >> $db_name # out login and password to file
echo "Now user '$login' is registered in our system!" # happy!