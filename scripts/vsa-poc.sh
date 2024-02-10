#1 /bin/bash

STATUS=$1
POLICY=$2
POLICY_DIGEST=$3

# This is also RFC3339 format - OPA understands this format
NOW=$(date --iso-8601=seconds -u)

# https://slsa.dev/spec/v1.0/verification_summary
cat <<EOF
{
  "verifier": {
    "id": "$POLICY"
  },
  "timeVerified": "$NOW",
  "policy": {
    "uri": "$POLICY",
    "digest": {"sha1": "$POLICY_DIGEST"}
  },
  "verificationResult": "$STATUS",
  "verifiedLevels": ["SLSA_BUILD_LEVEL_3"],
  "slsaVersion": "1.0"
}
EOF
