#
# Functie: ifoptions
#
# 

source if_gen.sh


ifoptions()
{
clear
echo "Generate Bash script constructs"
echo
echo "if"
echo
echo "Select an option"
echo "-------------------------------------------------------------------------"
echo "1 - single numeric condition  "
echo "2 - single string condition       "
echo "3 - if then else       "
echo "4 - multiple conditions        "
echo "5 - substitution operators"
echo
echo "9 - All of the above"
echo
echo "q - quit"
echo
echo
read -p "Your choice: " IFCH

if [ $IFCH != "q" ] ; then
   gen_if $IFCH
fi 

}
