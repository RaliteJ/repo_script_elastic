#!/bin/bash

sed -i '/^echo "test de ES"$/ { N; s/make curlES$/exit 0/ }' /opt/siem/scripts/lance-ES.sh

exit 0
