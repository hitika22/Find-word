#!/bin/bash

printf "\nYou are currently in %s \nwith the directories as follows in the present working directory" `pwd`
for j in `ls -d */`
do
  printf "\n$j"
done
printf "\n\n"
printf "Enter the directory name from above listed directories or simply press enter if you want to search the word in the files of current working directory : "
read -r dir
printf "\n"
cd ./"$dir" || exit
printf "Enter the word you want to find : "
read -r word
printf "\n  Searching .......\n\n"
totalCount=0
for file in $(find ./| grep txt$)
do
    abspath=$(realpath "$file")
    i=$(grep -o -w "$word" "$abspath" | wc -l)
    printf "Number of occurence of Word %s found in  FILE : %s is : %d\n\n" "$word" "$file" "$i"  
    totalCount="$((totalCount+i))"
done
printf "Total number of occurences of %s is : %d\n\n" "$word" "$totalCount"