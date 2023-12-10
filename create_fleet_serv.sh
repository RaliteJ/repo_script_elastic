#$1 = cafingerprint
#$2 = yaml
# Set your Elasticsearch and Kibana URLs
ELASTICSEARCH_URL="https://10.202.0.180:9200"
KIBANA_URL="https://10.202.0.180:5601"

# Create a Fleet Server enrollment token
ENROLLMENT_TOKEN=$(curl -X POST "${KIBANA_URL}/api/fleet/enrollment-api-keys" \
  --header "kbn-xsrf: true" \
  --header "Content-Type: application/json" \
  --data-raw '{
    "name": "my-enrollment-token",
    "expiration": "1d",
    "type": "output"
  }' | jq -r '.item.api_key')

FLEET_SERVER_CONFIG=$(cat <<EOF
{
  "hosts": ["${ELASTICSEARCH_URL}"],
  "enrollment_token": "${ENROLLMENT_TOKEN}",
  "outputs": [
    {
      "name": "elasticsearch",
      "hosts": ["https://10.202.0.180:9200"],
      "ca_sha256": "'$1'",
    }
  ],
  "elasticsearch_ca_sha256": ["$1"],
  "yaml_configs": ["$2"]
}
EOF
)

FLEET_SERVER_ID=$(curl -X POST "${ELASTICSEARCH_URL}/_fleet/setup" \
  --header "Content-Type: application/json" \
  --data-raw "${FLEET_SERVER_CONFIG}" | jq -r '.id')
