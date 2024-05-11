#!/bin/bash

out=out

while [[ -n $1 ]]
do
    case $1 in
    "-d") dir=$2; shift;;
    "-o") out=$2; shift;;
    "-e") ext=$2; shift;;
    *) echo "no arg $1";
    esac
    shift 

done

if [[ ! -d $dir ]]
then
    echo "no dir"
    exit 1
fi

if [[ ! -n $ext ]]
then
    echo "no ext"
    exit 1
fi

if [[ ! -d $out ]]
then
    mkdir $out
fi

k=1

for file in ls $dir
do
    if [[ -f $dir/$file && $file == *.$ext ]]
    then
        cp $dir/$file $out/$k.$ext
        k=$(($k+1))
    fi
done
