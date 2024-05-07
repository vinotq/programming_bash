#!/bin/bash
in_file=$1

ch=0
nch=0

for line in $(cat $in_file)
do

    if [[ -n $(echo $line | awk '/^[0-9]+$/{print $1}') ]] 
    then
        if [[ $(($line % 2)) -eq 0 ]]
        then
            ch=$(($ch+1))
        else    
            nch=$(($nch+1))
        fi
    fi
done

echo "Четные: $ch"
echo "Нечетные: $nch"

if [[ $ch -gt $nch ]]
then
    echo "Разница: $(($ch-$nch)) в пользу четных"
elif [[ $nch -gt $ch ]]
then
    echo "Разница: $(($nch-$ch)) в пользу нечетных"
else
    echo "Равное кол-во"
fi