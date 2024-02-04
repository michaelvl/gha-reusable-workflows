#! /bin/bash

REPO=$1
REF=$2
SHA=$3

# FIXME handle if REF is not part of a PR

export PR=$(gh pr list --search $(git rev-parse $REF) --state=all --json "number,url,reviewDecision,reviews,author,state,baseRefName,closedAt,createdAt,mergedAt,assignees,reviews,reviewDecision,reviewRequests,labels")


cat <<EOF
{
  "pull_requests": $PR,
  "repository": {
    "name": "$REPO",
    "ref": "$REF",
    "digest": {"sha1": "$SHA"}
  }
}
EOF
