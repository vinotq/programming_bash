#!/bin/bash

in_file=$1

twos=0
threes=0
fours=0
fives=0

while read line; do

  if [[ -n $(echo "$line" | awk '/^\w*\s2$/{print $1}') ]] then
    twos=$(($twos + 1))
  elif [[ -n $(echo "$line" | awk '/^\w*\s3$/{print $1}') ]] then
    threes=$(($threes + 1))
  elif [[ -n $(echo "$line" | awk '/^\w*\s4$/{print $1}') ]] then
    fours=$(($fours + 1))
  elif [[ -n $(echo "$line" | awk '/^\w*\s5$/{print $1}') ]] then
    fives=$(($fives + 1))
  fi

done < $in_file

total=$(($twos + $threes + $fours + $fives))

echo "2: $twos | $(($twos * 100 / $total))%"
echo "3: $threes | $(($threes * 100 / $total))%"
echo "4: $fours | $(($fours * 100 / $total))%"
echo "5: $fives | $(($fives * 100 / $total))%"