#!/bin/sh

set -e

curl -sS https://webi.sh/webi | sh; \
source ~/.config/envman/PATH.env
