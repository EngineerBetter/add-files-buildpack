#!/bin/bash

set -exuo pipefail

tmp_dir=$(mktemp -d -t add-files-buildpack-test)

export CF_HOME=$tmp_dir

pushd "$tmp_dir"
  mkdir app
  touch app/Staticfile

  cf api "$CF_API"
  cf auth "$CF_USERNAME" "$CF_PASSWORD"
  cf target -o "$CF_ORG" -s "$CF_SPACE"
  cf push buildpack-test -p app/ -b https://github.com/EngineerBetter/add-files-buildpack.git -b staticfile_buildpack
  cf ssh buildpack-test --command "cat /home/vcap/deps/0/foo.txt"
  cf delete -f buildpack-test
  cf logout
popd

rm -rf "$tmp_dir"
