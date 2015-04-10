#/!bin/bash
#
#

#
# Example until statements
# until is the opposite of while
#

#
# single numerical condition
# -eq = equal   -ne = not equal    -lt = less than    -le = less or equal    -gt = greater than    -ge = greater or equal
#

VARIABLE=0
until [ $VARIABLE -gt 10 ]
do
   echo "VARIABLE: " $VARIABLE
   (( VARIABLE++ ))
done

#
# single string condition
# -z = empty    -n = not empty    == equal    !=   not equal
#

NAME="something"
until [ "$NAME" != "something" ]
do
   echo "NAME: " $NAME
   read -p "Enter something: " NAME
done

until [ -z "$NAME" ]
do
   echo "NAME has a value"
   NAME=""
done

#
# multiple conditions
#
# example 1
#

echo "Example 1 multiple until condition"
NUMVAR=30
until [[ $NUMVAR -ge 40 && $NUMVAR -le 60 ]]
do
  echo $NUMVAR
  (( NUMVAR++ ))
done

#
# example 2, most recommended
#

echo "Example 2 multiple until condition"
NUMVAR=30
until (( NUMVAR >= 40 && NUMVAR <= 60 ))
do
  echo $NUMVAR
  (( NUMVAR++ ))
done

#
# example 3
#

echo "Example 3 multiple until condition"
NUMVAR=30
until [[ "$NUMVAR" -ge 40 && "$NUMVAR" -le 60 ]]
do
  echo $NUMVAR
  (( NUMVAR++ ))
done

#
# infinite loop
#

COUNTER=1
until false; do
  echo 
  echo "Infinite loop still going on. Interrupt with Crtl-C"
  sleep 60
  (( COUNTER++ ))
done


exit 0
