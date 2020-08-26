#!/bin/bash

echo "enter directory you want to find a word : "
read dir
cd $dir

echo "enter word you want to find : "
read word
totalCount=0

for file in `find ./| grep "\\.txt$"`
do
  
    file="${file:1}"
    abspath="$dir$file"
    filename=${abspath##*/}
    if [ -d "$abspath" ];                                   
    then
        continue                                         
    fi  
    for i in `grep -o -w "$word" $abspath | wc -l`
    do
        
        echo "Number of occurance of Word \" "$word" \" found in  FILE : "$filename" is : $i"   
        totalCount="$[totalCount+i]"
    done
     
done
echo $totalCount
