#!/bin/bash

valid_file=valid_emails
invalid_file=invalid_emails

for file in $valid_file $invalid_file
do
    if [[ -f $file ]]
    then
        echo -n "" > $file
    fi
done

for email in $(cat emails)
do
    is_email=$(echo $email | awk '/^[a-zA-Z0-9_\-\.\+]+@[a-zA-Z0-9_\-\.]+\.[a-zA-Z]{2,5}$/{print $1}')
    if [[ -n $is_email ]]
    then
        echo "valid email: $email" >> valid_emails
    else
        echo "invalid email: $email" >> invalid_emails
    fi
done