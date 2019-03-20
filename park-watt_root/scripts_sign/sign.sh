export OPENSSL_CONF=openssl.cnf 

# Write a random serial number to serial.txt
SERIAL=$(openssl rand -engine pkcs11 128 | od -vAn -N8 -tu8 | tr -d ' ')
echo ${SERIAL} > attic/serial.txt

openssl ca -engine pkcs11 \
  -keyform engine \
  -extfile extensions.cnf \
  -extensions ext_intermediate_restricted_pathlen0 \
  -in ${1}
