#!/bin/bash
NUMBER=$(( RANDOM % 100 ))
echo $NUMBER " is a prime."
for (( P=2; P<NUMBER; P++ )) 
do
   if [[ $(( NUMBER % P )) -ne 0 ]]; then
     continue
   fi
   echo "No you idiot! " $NUMBER " is not a prime"
   break
done
exit 0
