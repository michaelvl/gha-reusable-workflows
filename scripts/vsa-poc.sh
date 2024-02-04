#1 /bin/bash

STATUS=$1
SUBJECT=$2
DIGEST=$3
POLICY_DIGEST=$4

NOW=$(date --iso-8601=seconds)

cat <<EOF
{
  "_type": "https://in-toto.io/Statement/v1",
  "subject": [{
    "name": "$SUBJECT",
    "digest": {"sha256": "$DIGEST"}
  }],

  "predicateType": "https://slsa.dev/verification_summary/v1",
  "predicate": {
    "verifier": {
      "id": "https://github.com/michaelvl/gha-reusable-workflows"
    },
    "timeVerified": "$NOW",
    "policy": {
      "uri": "https://github.com/michaelvl/gha-reusable-workflows/organisation-policy",
      "digest": {"sha1": "$POLICY_DIGEST"}
    },
    "verificationResult": "$STATUS"
  }
}
EOF
