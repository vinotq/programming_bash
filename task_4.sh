#!/bin/bash 
read start
read end
read step
for ((i=$start; i<$end; i+=$step))
do
    echo $i
done