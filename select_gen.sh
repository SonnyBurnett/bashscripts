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
# Function: genereate select statements
#

gen_select()
{

cat >>$FILENAAM <<EOL

#
# Example select statements
#

echo "Select a file by entering the number"
echo "type q to quit"
echo

select FILENAME in * 
do
   if [ \$REPLY == "q" ]; then
     break
   fi
   echo "Your choice is:  \$FILENAME (\$REPLY) "
done

exit 0
EOL
}

