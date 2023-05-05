#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")" || exit

cache_dir=$(pwd)/cache
readonly cache_dir
rm -rf "$cache_dir"

bazel=${BAZEL_PATH:-bazel}
bazel_flags=(
    --repository_cache="$cache_dir/bazel/repo-cache/"
)

echo "initial build"
echo "============="
$bazel shutdown
$bazel clean --expunge
$bazel build @tensorflow//file:downloaded "${bazel_flags[@]}"
echo

echo "cached build"
echo "============"
rm -f /tmp/profile.json
$bazel shutdown
$bazel clean --expunge
$bazel build @tensorflow//file:downloaded "${bazel_flags[@]}" --profile=/tmp/profile.json
echo "fetch time: $(jq -r '.traceEvents | map(select(.name=="fetching: repository @tensorflow"))[0].dur / 1000.0' < /tmp/profile.json)ms"
echo

echo "xattr build"
echo "==========="
rm -f /tmp/profile.json
$bazel shutdown
$bazel clean --expunge
xattr -xw sha256 decbfd5a709eced3523f55ccfa239337a87e1ab3e000efda3617db79e1034ded cache/bazel/repo-cache/content_addressable/sha256/decbfd5a709eced3523f55ccfa239337a87e1ab3e000efda3617db79e1034ded/file
$bazel --unix_digest_hash_attribute_name=sha256 build @tensorflow//file:downloaded "${bazel_flags[@]}" --profile=/tmp/profile.json
echo "fetch time: $(jq -r '.traceEvents | map(select(.name=="fetching: repository @tensorflow"))[0].dur / 1000.0' < /tmp/profile.json)ms"
$bazel --unix_digest_hash_attribute_name=sha256 shutdown
echo

echo "xattr with hardlinks build"
echo "=========================="
rm -f /tmp/profile.json
$bazel shutdown
$bazel clean --expunge
xattr -xw sha256 decbfd5a709eced3523f55ccfa239337a87e1ab3e000efda3617db79e1034ded cache/bazel/repo-cache/content_addressable/sha256/decbfd5a709eced3523f55ccfa239337a87e1ab3e000efda3617db79e1034ded/file
$bazel --unix_digest_hash_attribute_name=sha256 build --experimental_repository_cache_hardlinks @tensorflow//file:downloaded "${bazel_flags[@]}" --profile=/tmp/profile.json
echo "fetch time: $(jq -r '.traceEvents | map(select(.name=="fetching: repository @tensorflow"))[0].dur / 1000.0' < /tmp/profile.json)ms"
$bazel --unix_digest_hash_attribute_name=sha256 shutdown
echo
