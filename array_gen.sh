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
# Function: genereate array statements
#

gen_array()
{

cat >>$FILENAAM <<EOL

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

# Note: Bash does not support multi dimensional arrays out-of-the-box!

exit 0
EOL
}

