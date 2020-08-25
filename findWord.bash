#!/bin/bash

echo "enter directory you want to find a word : "
read dir
cd ./"$dir"
echo "enter word you want to find : "
read word
totalCount=0
count=0
IFS=$'\n'
for file in `find ./| grep .txt$`
do
  count=0
  unset IFS
  while IFS= read -r line
  do
    for word1 in $line
    do 
      if [ $word1 == $word ]
      then
        
        totalCount="$[totalCount+1]"
        count="$[count+1]"
      fi
    done
  done < "$file"
  IFS=$'\n'
  echo "Number of occurance of Word \" "$word" \" found in  FILE : "$file" is : $count"     
done
echo "Total number of occurance of $word is : "$totalCount

