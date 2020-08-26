#!/bin/bash

echo -n "enter directory you want to find a word : "
read dir
cd ./"$dir"
echo -n "enter word you want to find : "
read word
totalCount=0
count=0
echo
IFS=$'\n'
for file in `find ./| grep "\\.txt$"`
do
  count=0
  unset IFS
  while read line || [ -n "$line" ];
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
  echo "Number of occurance of \""$word"\" found in  FILE : "$file" is : $count"
done
echo
echo "Total number of occurance of \""$word"\" in the directory \""$dir"\" is : "$totalCount
