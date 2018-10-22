#!/usr/bin/env bash

MAJOR=$(echo ${1} | cut -d. -f1)
MINOR=$(echo ${1} | cut -d. -f2)
REVISION=$(echo ${1} | cut -d. -f3)

if [[ ${REVISION} -eq 0 ]]; then
  GIT_BRANCH=release-${MAJOR}.${MINOR}
  echo "Creating branch $GIT_BRANCH"
  git checkout -b ${GIT_BRANCH}
fi