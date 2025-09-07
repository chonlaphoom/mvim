#!/bin/sh

set -e

# Install webi *webinstall.dev
curl -sS https://webi.sh/webi | sh; \
source ~/.config/envman/PATH.env
