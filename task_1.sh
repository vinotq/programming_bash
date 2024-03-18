#!/bin/bash 
./math.sh

while read values
do
    avg="average $values"
    echo "<$values>: $avg"
done < deg