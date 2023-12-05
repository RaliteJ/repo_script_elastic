#!/bin/bash
#2 variables
#$1 is the id of the policy
#$2 is the password of elastic
curl --cacert /opt/siem/ca.crt -k --user elastic:$2 --request GET --url 'https://10.202.0.180:5601/api/fleet/enrollment-api-keys'   -H 'kbn-xsrf: true' | jq '.list[] | select(.policy_id == "$1") | .api_key'
