#/!bin/bash
#
#

#
# define a function with function keyword
#

function funct1
{
  echo "This is function funct1"
}


#
# The simpeler and more common form
#

funct2()
{
  echo "This is function funct2"
}


#
# This example shows how to pass parameters to the function
#

funct3()
{
  echo "This is function funct3"
  echo "The number of parameters is: " $#
  echo "The first parameter is: " $1
  echo "The second parameter is: " $2
}

#
# A return value can be passed through the exit code
# not really because the whole script seems to stop?
#

funct4()
{
  echo "This is function funct4"
#  exit 4
}

#
# Now to show how local variables are within functions
#

funct5()
{
  local LOCALVAR=5
  echo "This is function funct5"
  GLOBALVAR=5
  echo "Within funct5 LOCALVAR is: " $LOCALVAR " and GLOBALVAR is: " $GLOBALVAR
}

#
# Main program
#

funct1
echo "The exit code of funct1 is: " $?
funct2
echo "The exit code of funct2 is: " $?
funct3 first second
echo "The exit code of funct3 is: " $?
funct4
echo "The exit code of funct4 is: " $?
GLOBALVAR=0
funct5
echo "The exit code of funct5 is: " $?
echo "Within Main Program LOCALVAR is: " $LOCALVAR " and GLOBALVAR is: " $GLOBALVAR

exit 0
