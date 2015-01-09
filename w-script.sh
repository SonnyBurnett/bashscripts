#/!bin/bash
#
#

#
# Example while statements
#

#
# single numerical condition
# -eq = equal   -ne = not equal    -lt = less than    -le = less or equal    -gt = greater than    -ge = greater or equal
#

VARIABLE=0
while [ $VARIABLE -le 10 ]
do
   echo "VARIABLE: " $VARIABLE
   (( VARIABLE++ ))
done

#
# single string condition
# -z = empty    -n = not empty    == equal    !=   not equal
#

NAME="something"
while [ "$NAME" == "something" ]
do
   echo "NAME: " $NAME
   read -p "Enter something: " NAME
done

while [ -n "$NAME" ]
do
   echo "NAME has a value"
   NAME=""
done

#
# multiple conditions
#
# example 1
#

echo "Example 1 multiple while condition"
NUMVAR=50
while [[ $NUMVAR -ge 40 && $NUMVAR -le 60 ]]
do
  echo $NUMVAR
  (( NUMVAR++ ))
done

#
# example 2, most recommended
#

echo "Example 3 multiple while condition"
NUMVAR=50
while (( NUMVAR >= 40 && NUMVAR <= 60 ))
do
  echo $NUMVAR
  (( NUMVAR++ ))
done

#
# example 3
#

echo "Example 3 multiple while condition"
NUMVAR=50
while [[ "$NUMVAR" -ge 40 && "$NUMVAR" -le 60 ]]
do
  echo $NUMVAR
  (( NUMVAR++ ))
done

#
# infinite loop
#

COUNTER=1
while true; do
  echo 
  echo "Infinite loop still going on. Interrupt with Crtl-C"
  sleep 60
  (( COUNTER++ ))
done


exit 0
