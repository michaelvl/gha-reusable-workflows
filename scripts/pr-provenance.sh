#! /bin/bash

OWNER=$1
REPO=$2
REF=$3
SHA=$4

#export PR=$(gh pr list --search $(git rev-parse $REF) --state=all --json "number,url,reviewDecision,reviews,author,state,baseRefName,closedAt,createdAt,mergedAt,assignees,reviews,reviewDecision,reviewRequests,labels")

export PR=$(gh api graphql -F repoOwner='{owner}' -F repoName='{repo}' -F sha="f7721f0" -f query="$(cat ../gha-reusable-workflows/vsa/pr-query.graphql)" --jq '.data.repository.commit')

cat | jq . <<EOF
{
  "pull_requests": $PR,
  "repository": {
    "name": "$REPO",
    "ref": "$REF",
    "digest": {"sha1": "$SHA"}
  }
}
EOF
