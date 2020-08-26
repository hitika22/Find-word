#!/bin/bash

echo -n "enter directory you want to find a word : "
read dir
cd ./"$dir"
echo -n "enter word you want to find : "
read word
totalCount=0
echo
IFS=$'\n'
for file in `find ./| grep "\\.txt$"`
do
  count=0
  unset IFS
  for i in `grep -o -w "$word" "$file" | wc -l`
  do
    echo "Number of occurance of Word \" "$word" \" found in  FILE : "$file" is : $i"   
    totalCount="$[totalCount+$i]"
  done
done
echo
echo "Total number of occurance of \""$word"\" in the directory \""$dir"\" is : "$totalCount
