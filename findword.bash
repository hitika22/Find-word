#!/bin/bash

echo -n "enter directory you want to find a word : "
read dir
cd ./"$dir"
echo -n "enter word you want to find : "
read word
totalCount=0
flag=0
for file in `find ./| grep .txt`
do
  flag=0
  sepCount=0
  while IFS= read -r line
  do
    for word1 in $line
    do
      if [ $word1 == $word ]
      then
        totalCount="$[totalCount+1]"
        sepCount="$[sepCount+1]"
        flag=1
      fi
    done
  done < "$file"
  if [ $flag == 1 ]
  then
    echo "Total number of occurance of $word in "$file" : "$sepCount
  fi
done
echo "Total number of occurance of $word in $dir : "$totalCount
