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

source gen_fouten.sh
source gen_options.sh
source if_gen.sh
source while_gen.sh
source until_gen.sh
source case_gen.sh
source for_gen.sh
source getopts_gen.sh
source readwrite_gen.sh

#
#
#
#
#

NAAM="script"
CHOICE=""

#
# Check if user has specified any options on the command-line
#

if [ $# -gt 0 ] ; then
  while getopts "iwufrcgn:" OPTIE; do
    case $OPTIE in
       i  ) CHOICE="if"        ;;
       w  ) CHOICE="while"     ;;
       u  ) CHOICE="until"     ;;
       f  ) CHOICE="for"       ;;
       c  ) CHOICE="case"      ;;
       g  ) CHOICE="getopts"   ;;
       r  ) CHOICE="readwrite" ;;
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
   i|if)        gen_if        ;;
   w|while)     gen_while     ;;
   u|until)     gen_until     ;;
   c|case)      gen_case      ;;
   f|for)       gen_for       ;;
   g|getopts)   gen_getopts   ;;
   r|readwrite) gen_readwrite ;;
esac



chmod 755 $FILENAAM
echo "Script: " $FILENAAM " generated"
exit 0

