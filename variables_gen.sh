#
# Author      :     Taco Bakker
# 
# Purpose     :     Generate standard bash script constructs
#
# Description :     A standard script construct can be generated
#                   
#                   Can be used as a quick start for a new script 
#                   or to be included in another script
#
#
#
#
#
#

#
# Function: genereate variable statements
#

gen_readwrite()
{

cat >>$FILENAAM <<EOL

#
# String
#

STR_VAR="This text is too nice to be true"
echo "STR_VAR has the value: " \$STR_VAR
echo "Length of this string is: " \${#STR_VAR}

#
# Substrings
#

echo "remove the first 5 characters of STR_VAR: " \${STR_VAR:5}
echo "remove the first 5 characters and take the next 2 characters of STR_VAR: " \${STR_VAR:5:2}
echo "remove the word nice from STR_VAR: " \${STR_VAR:#nice}
echo "remove all leading t's from STR_VAR: " \${STR_VAR#t*)
echo "remove all words with a leading t from STR_VAR: " \${STR_VAR##t*}
echo "remove all trailing e's from STR_VAR: " \${STR_VAR%e}
echo "remove all words with a trailing e from STR_VAR: " \${STR_VAR%%e} 

#
# integer
#

INT_VAR=1
echo "INT_VAR has the value: " \$INT_VAR

#
# Now declare the variable
# available for integer and array
#

declare -i INT_VAR2=10
echo " INT_VAR2 has the value: " \$INT_VAR2

#
# Make a constant
#

readonly CONST=100
CONST=0
echo "CONST has the value: " \$CONST

#
# Array's
#

declare -a ARRAY1
ARRAY1[0]="first"
ARRAY1[1]="second"
ARRAY1[2]="third"
ARRAY1[3]="fourth"

echo "Print ARRAY1"
echo \${ARRAY1[0]}
echo \${ARRAY1[1]}
echo \${ARRAY1[2]}
echo \${ARRAY1[3]}

#
# Now a more simple form
#

declare -a ARRAY2
ARRAY2=("one" "two" "three" "four" "five" "six")
echo "Print ARRAY2"
echo \${ARRAY2[*]}

#
# Delete an array or part of an array
#

unset ARRAY1[2]
echo "Print ARRAY1"
echo \${ARRAY1[*]}
unset ARRAY1
echo "Print ARRAY1"
echo \${ARRAY1[*]}

#
# What is the number of elements in an array
#

echo "The number of elements in ARRAY2 is: " \${#ARRAY2}


exit 0
EOL
}

