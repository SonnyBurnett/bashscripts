#/!bin/bash
#
#

#
# integer
#

INT_VAR=1
echo "Example 1 simple integer give value"
echo "INT_VAR has the value: " $INT_VAR

#
# Now declare the variable
# available for integer and array
#

declare -i INT_VAR2=10
echo "Example 2, declare an integer"
echo " INT_VAR2 has the value: " $INT_VAR2

#
# Make a constant
#

readonly CONST=100
CONST=0
echo "Example 3, make a constant"
echo "CONST has the value: " $CONST

#
# How to do calculations
#

# Use command expr
# Note: no spaces after variable, or it will think OUTCOME1 is a command!

OUTCOME1=$(expr 6 \+ 12)
echo "Example 4, use add with expr"
echo "6 + 12 = " $OUTCOME1

OUTCOME2=$(expr 6 \* 12)
echo "Example 5, use * with expr"
echo "6 * 12 = " $OUTCOME2

OUTCOME3=$(expr 12 / 6)
echo "Example 6, use divide with expr"
echo "12 / 6 = " $OUTCOME3

OUTCOME4=$(expr 2 \/* 3)
echo "Example 7, use x to the power y with expr"
echo "2 tot de macht 3 = " $OUTCOME4

INT1=6
INT2=12
echo "Example 8, use expr with all variables"
OUTCOME5=$(expr $INT1 + $INT2)
echo "6 + 12 = " $OUTCOME5

# Use command let

INT3=6
echo "Example 9, use let with add"
let OUTCOME6=INT3+12
echo "6 + 12 = " $OUTCOME6

let OUTCOME6+=1
echo "Example 10, use let to add 1 to the previous calculation"
echo "1 erbij is: " $OUTCOME6

# Use parentheses

INT4=12
INT5=6
echo "Example 11, use paranthesis with add"
OUTCOME7=$((INT4 + INT5))
echo $INT4 " + " $INT5 " = " $OUTCOME7

# Or use brackets

INT6=12
INT7=6
echo "Example 12, use brackets with add"
OUTCOME8=$[INT6 + INT7]
echo $INT6 " + " $INT7 " = " $OUTCOME8

# C-style programming

OUTCOME9=12
(( OUTCOME9++ ))
echo "Example 13, use C-style add 1 after"
echo "C-style add 1 gives me: " $OUTCOME9

(( ++OUTCOME9 ))
echo "Example 14, use C-style add 1 before"
echo "C-style add 1 gives me: " $OUTCOME9

(( OUTCOME9-- ))
echo "Example 15, use C-style substract 1 after"
echo "C-style substract 1 gives me: " $OUTCOME9


exit 0
