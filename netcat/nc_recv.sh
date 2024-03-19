#!/bin/bash

# Usage example: nc_recv.sh path_to_file_name

ONE_TIME_PASSWORD=$(openssl rand -base64 24)
echo $ONE_TIME_PASSWORD
echo "Waiting receive file......"

nc -l 8000 | gpg --decrypt --batch --passphrase $ONE_TIME_PASSWORD > $1

echo "sha256sum: $(sha256sum $1)"

exit 0
