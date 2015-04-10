#/!bin/bash
#
#

#
# Simple write statements
#

VAR="Some value"
echo "write and go to the next line."
echo -n "write and stay on the same line. "
echo " The value of variable VAR is: " $VAR
#Empty line
echo

#
# Simple read and write statements
#

echo -n "Type in your name: "
read YOURNAME
echo "You seem to be " $YOURNAME

#
# read multiple variables
#

echo -n "Type in your first and last name: "
read FIRSTNAME LASTNAME
echo "You seem to be " $FIRSTNAME " " $LASTNAME

#
# Combiing this in one statement
#

read -p "Your choice: " CHOICE
echo "You chose: " $CHOICE

exit 0
