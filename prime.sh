#!/bin/bash
#
# Author      :     Taco Bakker
# 
# Purpose     :     Generate prime numbers
#
# Description :                        
#
#
#
#
#

clear

STARTING=$(date +%s.%N)

COUNTER=0
if [ $# -gt 0 ]; then
  TOTAL=$1
else
  TOTAL=100
fi
PRIME=2

while [ $COUNTER -lt $TOTAL ]
do
   
   DIVIDERS=0
   START=2

#
# we start to test at 2 since 1 is trivial and so is the number itself
#

   while [[ $START -lt $PRIME && $DIVIDERS -eq 0 ]]
   do
      MODULO=$(( $PRIME % $START ))
      if [ $MODULO -eq 0 ]; then
        (( DIVIDERS++ ))
      fi
      (( START++ ))
   done

#
# if no other dividers other than 1 and the number itself are found
# we have found a prime
#

   if [ $DIVIDERS -eq 0 ]; then
     echo -n $PRIME "  " 
     (( COUNTER++ ))
     PRIMELIST[$COUNTER]=$PRIME
#
# New line after a certain amount of  numbers
#
     MODS=$(( $COUNTER % 20 ))
     if [ $MODS -eq 0 ]; then
       echo
     fi

   fi
 
   (( PRIME++ ))
done

#
# End the program with a calculation of the total execution time
#

ENDING=$(date +%s.%N)

DIFFING=$(echo "$ENDING - $STARTING" | bc)
echo
echo "Time it took me to calculate " $TOTAL " primes: " $DIFFING " seconds."
echo


#
# Now try to find twin primes
#
I=2
while [ $I -le $TOTAL ]; do
       TWINNIES=$(( ${PRIMELIST[$I]}  -  ${PRIMELIST[$I-1]} ))
       if [ $TWINNIES -eq 2 ]; then
         echo "Found twin primes: " ${PRIMELIST[$I-1]} " and " ${PRIMELIST[$I]}
       fi
     (( I++ ))
done

exit 0
