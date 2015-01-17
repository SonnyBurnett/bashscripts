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
# Function: genereate variable statements
#

gen_float()
{

cat >>$FILENAAM <<EOL

#
# Floating point calculations 
#


# divide
RES1=\$(echo "scale=5;3/5" | bc)
echo "3/5 = " \$RES1 

# square root 
RES2=\$(echo "scale=25;sqrt(2)" | bc)
echo "square root of 2 = " \$RES2 

# multiply
RES3=\$(echo "scale=2;2*3" | bc)
echo "2 * 3 = " \$RES3 

# power
RES4=\$(echo "scale=2;2^16" | bc)
echo "2 to the power 16 = " \$RES4 

# parenthesis
RES5=\$(echo "scale=2;(2^3)^2" | bc)
echo "(2^3)^2 = " \$RES5 

# no parenthesis
RES6=\$(echo "scale=2;2^3^2" | bc)
echo "2^3^2 = " \$RES6 

# convert decimal to hexadecimal
# with obase
RES6=\$(echo "obase=16;512" | bc)
echo "512 decimaal = " \$RES6 " hexadecimal" 

# convert decimal to binary
RES6=\$(echo "obase=2;64" | bc)
echo "64 decimal = " \$RES6 " binary" 

# convert binary to decimal
# with ibase. Note that all settings of ibase and obase are Hexadecimal!
RES6=\$(echo "ibase=2;obase=A;0101010001110101010" | bc)
echo "0101010001110101010 binary = " \$RES6 " decimal" 

exit 0
EOL
}

