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
# Function: generate if statements
#

gen_if()
{

cat >>$FILENAAM <<EOL
#
# Example if statements
#


#
# single numerical condition
# -eq = equal   -ne = not equal    -lt = less than    -le = less or equal    -gt = greater than    -ge = greater or equal
#

VARIABLE=0
if [ \$VARIABLE -eq 0 ]; then
   echo "VARIABLE"
   echo \$VARIABLE
fi

#
# single string condition
# -z = empty    -n = not empty    == equal    !=   not equal
#

NAME="value"
if [ "\$NAME" == "value" ]; then
   echo "NAME"
   echo \$NAME
fi

if [ -n "\$NAME" ]; then
   echo "NAME has a value"
fi

#
# if then else with strings
#

if [ -z "\$NAME" ]; then
   echo "NAME has no value"
else
   echo "NAME has a value"
fi


#
# multiple numerical condition
# && = and    || = or
#

VAR1=0
VAR2=0
if [[ \$VAR1 -eq 0 && \$VAR2 -eq 0 ]]; then
   echo "VAR1 VAR2"
   echo \$VAR1 " " \$VAR2
fi

#
# multiple conditions
#

YEARNUM=\`date +%Y\`
if [ \$YEARNUM -lt 2000 ]; then
   echo "long time ago"
elif [ \$YEARNUM -lt 2010 ]; then
   echo "not so long ago"
else
   echo "very recent"
fi

#
# calculation in an if condition
# % is the modulo operator
#

YEARNUM=\`date +%Y\`
if [ \$[\$YEARNUM % 400] -eq "0" ]; then
   echo \$YEARNUM " leap year"
elif [ \$[\$YEARNUM % 4] -eq 0 ]; then
   if [ \$[$YEARNUM % 100] -ne 0 ]; then
      echo \$YEARNUM " leap year"
   else
      echo \$YEARNUM " Not a leap year"
   fi
else
   echo \$YEARNUM " not a leap year"
fi


exit 0
EOL
}

