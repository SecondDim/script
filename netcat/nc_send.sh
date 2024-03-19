#!/bin/bash

# Usage example: nc_send.sh

read -p "file: " SEND_FILE
read -p "password: " ONE_TIME_PASSWORD

echo "sha256sum: $(sha256sum ${SEND_FILE})"

cat $SEND_FILE | gpg --symmetric --cipher-algo AES256 --batch --passphrase $ONE_TIME_PASSWORD > /tmp/nc_send_tmp.encfile
nc -vN 127.0.0.1 8000 < /tmp/nc_send_tmp.encfile

exit 0
