export OPENSSL_CONF=openssl.cnf

SERIAL=$(openssl rand -engine pkcs11 128 | od -vAn -N16 -tu8 | tr -d ' ')

openssl req \
    -new \
    -x509 \
    -engine pkcs11 \
    -key "pkcs11:object=PARK_WATT_ERCA_RSA_4096_1903;type=private" \
    -keyform engine \
    -out root.pem \
    -outform pem \
    -days 3650 \
    -set_serial ${SERIAL}

openssl x509 \
    -in root.pem \
    -inform pem \
    -out root.der \
    -outform der

openssl x509 \
    -in root.pem \
    -inform pem \
    -text \
    -noout
