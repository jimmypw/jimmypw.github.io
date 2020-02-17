export OPENSSL_CONF=openssl.cnf 

# Write a random serial number to serial.txt
SERIAL=$(./util/serialgen)
echo ${SERIAL} > attic/serial.txt

openssl ca -engine pkcs11 \
  -keyform engine \
  -extfile extensions.cnf \
  -extensions ext_intermediate_restricted_pathlen0 \
  -in ${1}
