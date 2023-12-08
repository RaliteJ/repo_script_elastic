#!/bin/bash

echo {"echo ${ELASTIC_PASSWORD} > /opt/siem/repo_script_elastic/pass_elastic"} >> /opt/siem/scripts/print_password.sh

exit 0
