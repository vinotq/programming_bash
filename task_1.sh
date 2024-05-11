#!/bin/bash

read -p "Input first: " a
read -p "Input second: " b

echo $(( ($a - $a % 2 + $b + $b % 2) / 2 ))