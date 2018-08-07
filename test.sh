#!/bin/sh

# githhub status api post data

generate_post_data() {
	cat <<EOF
{
  "state": "$STATE",
  "target_url": "$TARGET_URL",
  "description": "$DESCRIPTION",
  "context": "$CONTEXT"
}
EOF
}

API_URL=https://api.github.com/repos/${REPO}/statuses/${HEAD_SHA}?access_token=${TOKEN}

# set pending status

STATE='pending'
DESCRIPTION=$DESCRIPTION_PENDING
curl -X POST -d "$(generate_post_data)" "${API_URL}"

# run tests
go test -v

# set succeed/failed status

if [ $? -eq 0 ]; then
	STATE='success'
	DESCRIPTION=$DESCRIPTION_SUCCESS
else
	STATE='failure'
	DESCRIPTION=$DESCRIPTION_FAILURE
fi

curl -X POST -d "$(generate_post_data)" $API_URL

# remove ok-to-test label

API_URL=https://api.github.com/repos/${REPO}/issues/${PR_NUMBER}/labels/ok-to-test?access_token=${TOKEN}
curl -X DELETE $API_URL
