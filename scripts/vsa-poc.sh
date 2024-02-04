#1 /bin/bash

SUBJECT=abc
DIGEST=def

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
      "digest": {"sha256": "1234abcd"}
    },
    "verificationResult": "PASSED"
  }
}
EOF
