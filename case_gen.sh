#!/bin/bash
#
#
#


#
# Function: genereate case statements
#

gen_case()
{


cat >>$FILENAAM <<EOL

#
# Example until statements
read -p "Pick your choice: " CHOICE

case \$CHOICE in
   1|een)         echo "You picked one. Excellent choice!"                 ;;
   2|twee)        echo "Two is not a bad choice"                           ;;
   3|drie|three)  echo
                  echo "So you want three? You asked for it, you got it"   ;;
   a*)            echo "Anything that starts with an a"                    ;;
   *)             echo "Basically anything else you did not think of "     ;;
esac



EOL
}
