#/!bin/bash
#
#

#
# Example select statements
#

echo "Select a file by entering the number"
echo "type q to quit"
echo

select FILENAME in * 
do
   if [ $REPLY == "q" ]; then
     break
   fi
   echo "Your choice is:  $FILENAME ($REPLY) "
done

exit 0
