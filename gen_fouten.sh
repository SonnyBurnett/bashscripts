#
# Functie: fouten
# Toon een foutboodschap en stop het programma met exit code 1
#
fouten()
{
FOUT=$1
case $FOUT in
  1 ) echo "E1: Geef een geldige optie op [-i -u -w -f -c -g -n]" ;;
  2 ) echo "E2: Geef een argument voor $2"               ;;
esac
exit 1
}


