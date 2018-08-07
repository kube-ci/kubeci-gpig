#!/bin/sh

# clone and checkout
git clone $URL $REPO_ROOT
cd $REPO_ROOT
git checkout $HEAD_SHA

# run test script
chmod +x $TEST_SCRIPT
./$TEST_SCRIPT
