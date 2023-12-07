#!/bin/bash
 
# First argument: Client identifier

OUTPUT_DIR=./client-configs/
BASE_CONFIG=./client.conf
 
cat ${BASE_CONFIG} \
    <(echo -e '<ca>') \
    ca.crt \
    <(echo -e '</ca>\n<cert>') \
    Certs/${1}.crt \
    <(echo -e '</cert>\n<key>') \
    Pkeys/${1}.key \
    <(echo -e '</key>\n<tls-crypt>') \
    Pkeys/ta.key \
    <(echo -e '</tls-crypt>') \
    > ${OUTPUT_DIR}/${1}.ovpn

