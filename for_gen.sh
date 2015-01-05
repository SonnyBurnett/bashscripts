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

for NMBR in 1,2,3,4,5,6,7,8,9
do
  echo "Loop number: " \$NMBR 
done

#
# Infinite loop
#

for (( ; ; ))
do
  echo "This wil keep going until you enter Ctrl-C, but I will stop it anyway"
  sleep 10
  break
done  

#
# Break from the loop -- Dirty programming
#

for LOOPNUM in {1..50}
do
  echo "Loop number: " \$LOOPNUM
  RNDM=\$RANDOM
  if [ \$[\$RNDM % 10] -eq "0" ]; then
     break
  else
     echo \$RNDM
  fi
done

#
# loop through a directory
#

for file in "./*"
do
   echo \${file}
   echo
done



exit 0
EOL
}

