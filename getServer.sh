#!/usr/bin/env bash

VERSION_MANIFEST="https://launchermeta.mojang.com/mc/game/version_manifest.json" && \
# echo "Download and parse latest version: $VERSION_MANIFEST" && \
LATEST_RELEASE_MANIFEST_URL=$(wget -q -O - "$VERSION_MANIFEST" | jq -r '.latest.release as $r | .versions[] | select(.id  == $r) | .url') && \
# echo "Download and parse latest version: $LATEST_RELEASE_MANIFEST_URL" && \
SERVER_URL=$(wget -q -O - "$LATEST_RELEASE_MANIFEST_URL" | jq -r '.downloads.server.url') && \
# echo "Download Server: $SERVER_URL" && \
wget -qO server.jar "$SERVER_URL"
