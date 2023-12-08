#!/bin/bash

sed -i '/^echo "test de ES"$/ { N; s/make curlES\n\n\n#sudo chown -R root.root $(pwd)\/config$/exit 0/ }' /opt/siem/scripts/lance-ES.sh


exit 0
