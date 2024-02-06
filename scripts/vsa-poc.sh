#1 /bin/bash

STATUS=$1
POLICY=$2
POLICY_DIGEST=$3

# This is also RFC3339 format - OPA understands this format
NOW=$(date --iso-8601=seconds -u)

cat <<EOF
{
  "verifier": {
    "id": "$POLICY"
  },
  "verifiedAt": "$NOW",
  "policy": {
    "uri": "$POLICY",
    "digest": {"sha1": "$POLICY_DIGEST"}
  },
  "verificationResult": "$STATUS"
}
EOF
