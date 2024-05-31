#!/bin/bash

if [[ $# -ne 4 ]]; then
    echo "Usage: $0 -i input_file -o output_file"
    exit 1
fi

while [[ $# -gt 0 ]]; do
    case $1 in
        "-i") input_file=$2; shift ;;
        "-o") output_file=$2; shift ;;
        *) echo "Usage: $0 -i input_file -o output_file"
           exit 1 ;;
    esac
    shift
done

read -p "Enter the word to count: " word

if [[ ! -f "$input_file" ]]; then
    echo "Input file not found!"
    exit 1
fi

count=$(grep -o -w "$word" "$input_file" | wc -l)

echo "The word '$word' occurs $count times in the file '$input_file'" > "$output_file"
echo "Result written to '$output_file'."
