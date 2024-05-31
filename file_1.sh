#!/bin/bash

word=$5

while [[ $# -gt 1 ]]
do
    case $1 in
        "-i") input_file=$2 ; shift ;;
        "-o") output_file=$2 ; shift ;;
        *) echo "Неверный ввод. -i - входной файл, -o - выходной файл, слово, которое требуется найти" ; exit 1 ;;
    esac
    shift
done

if [[ ! -f $input_file ]]
then
    echo "Нет входного файла"
    exit 1
fi

if [[ ! -n $word ]]
then
    echo "Не введено ключевое слово"
    exit 1
fi

echo "Результат работы скрипта: $(grep -c $word $input_file)" > $output_file
echo "Успешно!"