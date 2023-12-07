#!/bin/bash

sed -i '$d; $d; $d; $d; $d; $d; $d; $d; $d; $d; $d'  /opt/siem/scripts/lance-ES.sh

echo "exit 0" >> lance-ES.sh
