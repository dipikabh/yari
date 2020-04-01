#!/bin/bash
set -ex


# TEMPORARILY...
# Because, at the time of writing, we don't have any real content checked in, we'll fake some.

mkdir -p ci-content/files/en-us/foo/bar
echo "<p>I'm alive!</p>" > ci-content/files/en-us/foo/bar/index.html
cat > ci-content/files/en-us/foo/bar/index.yaml <<YAML
title: 'Sample Title'
slug: Foo/Bar
YAML
cat > ci-content/files/en-us/foo/bar/wikihistory.json <<JSON
{
  "modified": "2020-03-27T04:29:28.234Z",
  "_generated": "2020-04-01T15:02:53.589Z",
  "contributors": [
    "peterbe"
  ]
}
JSON

export BUILD_ROOT=ci-content/files
yarn run prebuild

ls -ltr client/build/

ls -ltr ci-content
ls -ltr content
