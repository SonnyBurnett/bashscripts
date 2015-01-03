#!/bin/bash
FILENAAM="bestandje.sh"
cat > $FILENAAM <<EOL
#!/bin/bash
#
#
${FILENAAM}
EOL
exit 0
