#!/bin/sh

if git rev-parse --verify HEAD >/dev/null 2>&1
then
        against=HEAD
else
        # Initial commit: diff against an empty tree object
        against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# Redirect output to stderr.
exec 1>&2

# ruby lint
if ! ruby -c $(git diff-index --cached --name-only HEAD -- | grep '\.rb$') >/dev/null; then
    exit 1
fi
