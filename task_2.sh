#!/bin/bash 

group_1="Cat Dog Capibara Bobr"
group_2="Uzhik Pingvin Panda"

group_number=1
for group in "$group_1" "$group_2"
do
    echo "Group #$group_number"
    for student in $group
    do  
        echo $student
    done
    group_number=$(($group_number + 1))
done