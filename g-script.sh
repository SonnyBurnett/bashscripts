#/!bin/bash
#
#

#
# Example getopts statements
#
# '0' is the total number of opts, including options (-n), arguments (name) and parameters (anything_else)
# 
# the while getopts loop, loops through options (-a -b -c  etcetera)
# after each option the OPTIND variable is increased
# with the case conditional the chosen option can trigger commands
# The OPTARG variable holds the options and the arguments that belong to the options
# so are options that require an argument (by putting a : after the option)
# the first : is meant to suppress some nasty error messages
# all other parameters, such as anything_else are ignored, and must be handled later in your program
# 

clear
echo "We start"
echo "OPTIND has the value of : " $OPTIND
echo "Now we loop through all options and their arguments"
echo

if [ $# -gt 0 ] ; then
  while getopts ":abcd:n:" OPT; do
    case $OPT in
       a  ) echo "You chose option -a"                             ;;
       b  ) echo "You chose option -b"                             ;;
       c  ) echo "You chose option -c"                             ;;
       d  ) echo "You chose option -d with argument " $OPTARG     ;;
       n  ) echo "You chose option -n with argument " $OPTARG     ;;
       \? ) echo "ERROR: Invalid option -" $OPTARG                   ;;
       :  ) echo "ERROR: Option -"$OPTARG " requires an argument"     ;;
       * ) echo "Anything else"                                    ;;
    esac
  done
fi


echo
echo "We are done with all options"
echo "OPTIND now has the value of : " $OPTIND
echo "Number of parameters, # has the value: " $#
echo "Name of the scripts, 0 has the value: " $0
echo "First parameter, 1 has the value: " $1
echo "Second parameter, 2 has the value: " $2
echo "Third parameter, 3 has the value: " $3
echo "The Last parameter is {!#} has the value: " ${!#}
echo

#
# with the shift command you can shift positional parameters
#
# OPTIND is the number of options + all arguments + 1 
# so when we substract 1 of this number
# and shift that number with the shift command
# we are left with only the rest of the parameters, just like the options never existed
#
# OPTIND is not affected, but # is, and so are 1 2 and 3 and etcetera

echo
echo "Now we shift the parameters"
echo
shift $(( OPTIND - 1 )) 
echo "OPTIND now has the value of : " $OPTIND
echo "Number of parameters, # has the value: " $#
echo "Name of the scripts, 0 has the value: " $0
echo "First parameter, 1 has the value: " $1
echo "Second parameter, 2 has the value: " $2
echo "Third parameter, 3 has the value: " $3
echo "The Last parameter is {!#} has the value: " ${!#}

#
# Now we loop through all the parameters
#
#  is the set of all parameters
#

echo
echo "Loop through all the remaining parameters"
echo
for VAR in "$@"
do
   echo $VAR
done
exit 0

