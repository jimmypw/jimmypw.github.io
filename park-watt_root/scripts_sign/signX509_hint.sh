export OPENSSL_CONF=openssl.cnf


SERIAL=$(openssl rand -engine pkcs11 128 | od -vAn -N16 -tu8 | tr -d ' ')

openssl x509 -engine pkcs11 \
            -CAkeyform engine \
            -CA root.der \
            -CAform DER \
            -CAkey "pkcs11:object=CA_PARK_WATT_ROOT;type=private" \
            -set_serial ${SERIAL} \
            -days 365 \
            -extfile extensions.cnf \
            -extensions ext_intermediate_unrestricted \
            -req \
            -in int.csr \
            -out int.crt

openssl x509 -in int.crt -text -noout
