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
# Function: genereate stringstatements
#

gen_string()
{

cat >>$FILENAAM <<EOL


#
# String
#

STR_VAR="the quick brown dog jumped over the lazy brown dog"
echo "STR_VAR has the value:                                        " \$STR_VAR
echo "Length of this string is:                                     " \${#STR_VAR}

#
# Substrings
#

echo "remove the first 4 characters:                                " \${STR_VAR:4}
echo "remove the first 4 characters and take the next 5 characters: " \${STR_VAR:4:5}
echo "remove shortest matching -*brown- from beginning:             " \${STR_VAR#*brown}
echo "remove longest matching -*brown- from beginning:              " \${STR_VAR##*brown}
echo "remove shortest matching -brown*- from end:                   " \${STR_VAR%brown*}
echo "remove longest matching  -brown*- from end:                   " \${STR_VAR%%brown*} 

#
# find and replace
#

echo "replace the first match of dog with fox:                      " \${STR_VAR/dog/fox}
echo "replace all matches of dog with fox:                          " \${STR_VAR//dog/fox}

#
# Concatenate strings
#

STR1="Hello"
STR2="World"
STR3=\$STR1\$STR2
echo
echo "first string:  " \$STR1
echo "second string: " \$STR2
echo "concatenation: " \$STR3

exit 0

EOL
}

