#!/bin/bash
#Take 2 variables:
#$1: id of the user
#$2: pass of elastic
curl --cacert /opt/siem/ca.crt -k --user elastic:$2 --request POST \
  --url 'https://10.202.0.180:5601/api/fleet/package_policies' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'kbn-version: 8.9.0' \
  -d \
'
{
  "name": "Protect",
  "description": "",
  "namespace": "default",
  "policy_id": "'$1'", 
  "enabled": true,
  "inputs": [
    {
      "enabled": true,
      "streams": [],
      "type": "ENDPOINT_INTEGRATION_CONFIG",
      "config": {
        "_config": {
          "value": {
            "type": "endpoint",
            "endpointConfig": {
              "preset": "EDRComplete",
              "tls": {
                "verify_peer": false,
                "verify_hostname": false,
                "ca_cert": false
              }
            }
          }
        }
      }
    }
  ],
  "package": {
    "name": "endpoint",
    "title": "Elastic Defend",
    "version": "8.11.0" 
  }
}'
