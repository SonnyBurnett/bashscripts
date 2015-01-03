#!/bin/bash
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

clear

# Functie: fouten
# Toon een foutboodschap en stop het programma met exit code 1
#
fouten()
{
FOUT=$1
case $FOUT in
  1 ) echo "E1: Geef een geldige optie op [-i -u -w -f -c -g -n]" ;;
  2 ) echo "E2: Geef een argument voor $2"               ;;
esac
exit 1
}

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


#
# Function: genereate while statements
#

gen_while()
{

cat >>$FILENAAM <<EOL

#
# Example while statements
#

#
# single numerical condition
# -eq = equal   -ne = not equal    -lt = less than    -le = less or equal    -gt = greater than    -ge = greater or equal
#

VARIABLE=0
while [ \$VARIABLE -le 10 ]
do
   echo "VARIABLE: " \$VARIABLE
   (( VARIABLE++ ))
done

#
# single string condition
# -z = empty    -n = not empty    == equal    !=   not equal
#

NAME="something"
while [ "\$NAME" == "something" ]
do
   echo "NAME: " \$NAME
   read -p "Enter something: " NAME
done

while [ -n "\$NAME" ]
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
while [[ \$NUMVAR -ge 40 && \$NUMVAR -le 60 ]]
do
  echo \$NUMVAR
  (( NUMVAR++ ))
done

#
# example 2, most recommended
#

echo "Example 3 multiple while condition"
NUMVAR=50
while (( NUMVAR >= 40 && NUMVAR <= 60 ))
do
  echo \$NUMVAR
  (( NUMVAR++ ))
done

#
# example 3
#

echo "Example 3 multiple while condition"
NUMVAR=50
while [[ "\$NUMVAR" -ge 40 && "\$NUMVAR" -le 60 ]]
do
  echo \$NUMVAR
  (( NUMVAR++ ))
done

#
# infinite loop
#

COUNTER=1
while true; do
  echo $COUNTER
  echo "Infinite loop still going on. Interrupt with Crtl-C"
  sleep 60
  (( COUNTER++ ))
done


exit 0
EOL
}

#
# Function: genereate until statements
#

gen_until()
{

cat >>$FILENAAM <<EOL

#
# Example until statements
# until is the opposite of while
#

#
# single numerical condition
# -eq = equal   -ne = not equal    -lt = less than    -le = less or equal    -gt = greater than    -ge = greater or equal
#

VARIABLE=0
until [ \$VARIABLE -gt 10 ]
do
   echo "VARIABLE: " \$VARIABLE
   (( VARIABLE++ ))
done

#
# single string condition
# -z = empty    -n = not empty    == equal    !=   not equal
#

NAME="something"
until [ "\$NAME" != "something" ]
do
   echo "NAME: " \$NAME
   read -p "Enter something: " NAME
done

until [ -z "\$NAME" ]
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
until [[ \$NUMVAR -ge 40 && \$NUMVAR -le 60 ]]
do
  echo \$NUMVAR
  (( NUMVAR++ ))
done

#
# example 2, most recommended
#

echo "Example 2 multiple until condition"
NUMVAR=30
until (( NUMVAR >= 40 && NUMVAR <= 60 ))
do
  echo \$NUMVAR
  (( NUMVAR++ ))
done

#
# example 3
#

echo "Example 3 multiple until condition"
NUMVAR=30
until [[ "\$NUMVAR" -ge 40 && "\$NUMVAR" -le 60 ]]
do
  echo \$NUMVAR
  (( NUMVAR++ ))
done

#
# infinite loop
#

COUNTER=1
until false; do
  echo $COUNTER
  echo "Infinite loop still going on. Interrupt with Crtl-C"
  sleep 60
  (( COUNTER++ ))
done


exit 0
EOL
}


#
# Functie: status_balk
#
# 

status_balk()
{
clear
echo "Generate Bash script constructs"
echo
echo
echo "Select a construct"
echo "-------------------------------------------------------------------------"
echo "i - if-then-else"
echo "w - while"
echo "u - until"
echo "f - for"
echo "c - case"
echo "g - getopts"
echo
echo "q - quit"
echo
echo
}

#
#
#
# Hier start het hoofdprogramma
#
#

NAAM="script"
CHOICE=""

#
# De gebruiker kan alle opties ook via de command-prompt specificeren
# Controleer of er opties zijn opgegeven
#

if [ $# -gt 0 ] ; then
  while getopts "iwufcgn:" OPTIE; do
    case $OPTIE in
       i  ) CHOICE="if"        ;;
       w  ) CHOICE="while"     ;;
       u  ) CHOICE="until"     ;;
       f  ) CHOICE="for"       ;;
       c  ) CHOICE="case"      ;;
       g  ) CHOICE="getopts"   ;;
       n  ) NAAM=$OPTARG       ;;
       \? ) fouten 1           ;;
       :  ) fouten 2 -$OPTARG  ;;
    esac
  done
fi

if [ "$CHOICE" == "" ]; then
  status_balk
  read -p "Your choice: " CHOICE
fi

FILENAAM="$CHOICE-$NAAM.sh"

cat >$FILENAAM <<EOL
#/!bin/bash
#
#
EOL


case $CHOICE in
   i|if)     gen_if      ;;
   w|while)  gen_while   ;;
   u|until)  gen_until   ;;
esac



chmod 755 $FILENAAM
exit 0

