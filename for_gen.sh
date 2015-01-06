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
# Function: genereate for statements
#

gen_for()
{

cat >>$FILENAAM <<EOL

#
# Example for statements
#

for (( COUNT=1; COUNT<=10; COUNT++ ))
do
  echo "Loop number: " \$COUNT 
done

#
# loop a range
#

for NUM in {1..5}
do
  echo "Loop number: " \$NUM 
done

#
# loop through numbers
#

for NMBR in 1 2 3 4 5 6 7 8 9
do
  echo "Loop number: " \$NMBR 
done

#
# Infinite loop
#

for (( ; ; ))
do
  echo "This wil keep on going until you enter Ctrl-C, but I will stop it anyway"
  sleep 10
  break
done  

#
# Break from the loop -- Dirty programming
#

for LOOPNUM in {1..50}
do
  RNDM=\$RANDOM
  echo "My random number is: " \$RNDM
  if [ \$[\$RNDM % 10] -eq "0" ]; then
     break
  fi
done

#
# loop through a directory
#

for file in *.sh
do
   echo \${file}
done

#
# skip remaining part of iteration with continue -- dirty programming
# it is more or less the else part of an if statement.
# but now it skips all code after the continue, and goes to the next iteration.
#

NUMBER=\$(( RANDOM % 100 ))
echo \$NUMBER " is a prime."
for (( P=2; P<NUMBER; P++ )) 
do
   if [[ \$(( NUMBER % P )) -ne 0 ]]; then
     continue
   fi
   echo "No you idiot! " \$NUMBER " is not a prime"
   break
done

exit 0
EOL
}

