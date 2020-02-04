#!/bin/sh
set -e -u
/usr/local/bin/ghr -u "${GITHUB_REPOSITORY%/*}" -r "${GITHUB_REPOSITORY#*/}" "${GITHUB_REF#refs/tags/}" "${SOURCE_PATH}"
