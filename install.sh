#!/usr/bin/env bash
# The one line people paste into Terminal runs this. Terminal downloads aren't blocked
# the way a browser download of an unsigned app is. Fetches the release, checks it,
# and installs it. Needs no admin password.
set -euo pipefail
NAME=Offwire-0.9.0-beta-macos-arm64
SHA=e499e34b82d6c6c6179c4b6cd68a246cab47b3d4a3adba606cab0bec20bd9727
URL="${OFFWIRE_RELEASE_URL:-https://github.com/Suryanshgarg80/offwire/releases/download/v0.9.0-beta/Offwire-0.9.0-beta-macos-arm64.tar.gz}"

[ "$(uname -s)" = Darwin ] && [ "$(uname -m)" = arm64 ] || { echo "Offwire needs an Apple Silicon Mac (M1 or newer)."; exit 1; }
cd "$HOME"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
echo "Downloading Offwire (198 MB)..."
curl -fL --progress-bar --retry 3 -o "$TMP/offwire.tar.gz" "$URL" || { echo "The download didn't finish. Check your connection and paste the line again."; exit 1; }
[ "$(shasum -a 256 "$TMP/offwire.tar.gz" | cut -d' ' -f1)" = "$SHA" ] || { echo "The download failed its safety check, so nothing was installed. Please try again in a while."; exit 1; }
tar -xzf "$TMP/offwire.tar.gz" -C "$TMP"
bash "$TMP/$NAME/install.sh" "$@"
