#!/bin/bash
#2 variables
#$1 is the id of the policy
#$2 is the password of elastic
curl --cacert /opt/siem/ca.crt -k  -X POST "https://10.202.0.180:5601/api/fleet/agent_policies?sys_monitoring=true" --header 'kbn-xsrf: true' --header 'Content-Type: application/json'  --data-raw '{
  "name": "$1",
  "id": "$1",
  "description": "",
  "namespace": "default",
  "monitoring_enabled": [
    "logs",
    "metrics"
  ],
  "inactivity_timeout": 1209600
}' -K- <<< "--user elastic:$2"
