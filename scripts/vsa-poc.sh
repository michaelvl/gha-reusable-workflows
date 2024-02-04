#1 /bin/bash

STATUS=$1
SUBJECT=$2
DIGEST=$3
POLICY=$4
POLICY_DIGEST=$5

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
      "id": "$POLICY"
    },
    "timeVerified": "$NOW",
    "policy": {
      "uri": "$POLICY",
      "digest": {"sha1": "$POLICY_DIGEST"}
    },
    "verificationResult": "$STATUS"
  }
}
EOF
