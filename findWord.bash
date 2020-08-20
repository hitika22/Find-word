#!/bin/bash

echo "enter directory you want to find a word : "
read dir
cd ./"$dir"
for file in `ls`
do
echo "$file"
echo
while IFS= read -r line
do
  echo "$line"
done < "$file"

done
