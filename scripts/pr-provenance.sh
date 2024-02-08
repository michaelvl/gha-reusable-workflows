#! /bin/bash

OWNER=$1
REPO=$2
REF=$3
SHA=$4

#export PR=$(gh pr list --search $(git rev-parse $REF) --state=all --json "number,url,reviewDecision,reviews,author,state,baseRefName,closedAt,createdAt,mergedAt,assignees,reviews,reviewDecision,reviewRequests,labels")

export PR=$(gh api graphql -F repoOwner="$OWNER" -F repoName="$REPO" -F sha="$SHA" --jq '.data.repository.commit' -f query='
query ($repoOwner: String!, $repoName: String!, $sha: String!) {
  repository(name: $repoName, owner: $repoOwner) {
    commit: object(expression: $sha) {
      ... on Commit {
        commitUrl
        associatedPullRequests(first: 1) {
          nodes {
            author {
              login
              url
            }
            assignees(first: 10) {
              nodes {
                login
                url
              }
            }
            baseRefOid
            headRefName
            headRefOid
            merged
            number
            reviewDecision
            state
            title
            number
            body
            state
            createdAt
            mergedAt
            closedAt
          }
        }
      }
    }
  }
}')

cat | jq . <<EOF
{
  "pull_requests": $PR,
  "repository": {
    "name": "$name/$REPO",
    "ref": "$REF",
    "digest": {"sha1": "$SHA"}
  }
}
EOF
