#!/bin/bash

echo "enter directory you want to find a word : "
read dir
cd ./"$dir"
echo "enter word you want to find : "
read word
totalCount=0
flag=0
for file in `find ./| grep .txt`
do
  flag=0
  while IFS= read -r line
  do
    for word1 in $line
    do 
      if [ $word1 == $word ]
      then
        totalCount="$[totalCount+1]"
        flag=1
      fi
    done
  done < "$file"
  if [ $flag == 1 ]
  then
    echo "Word "$word" is found in "$file" " 
  fi
done
echo "Total number of occurance of $word is : "$totalCount

