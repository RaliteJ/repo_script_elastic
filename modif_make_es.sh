#!/bin/bash
cd /opt/siem/scripts

sed -i '$d; $d; $d' lance-ES.sh

echo "exit 0" >> lance-ES.sh
