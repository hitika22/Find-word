#!/bin/bash

echo "enter directory you want to find a word : "
read dir
cd $dir

echo "enter word you want to find : "
read word
totalCount=0

for file in `find ./| grep txt$`
do
    abspath=`realpath $file`
    filename=`basename $abspath`
    for i in `grep -o -w "$word" $abspath | wc -l`
    do
        
        echo "Number of occurance of Word \" "$word" \" found in  FILE : "$filename" is : $i"   
        totalCount="$[totalCount+i]"
    done
done
echo $totalCount
