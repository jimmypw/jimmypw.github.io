OPENSSL_CONF=openssl.cnf openssl ca -engine pkcs11 -keyform engine -revoke ${1}
