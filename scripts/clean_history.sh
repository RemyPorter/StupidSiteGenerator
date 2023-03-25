#!/usr/bin/env bash
git checkout --orphan temp_branch
git add -A
git commit -am "Initial Commit\nNew Stupid Static Site project"
git branch -D main
git branch -m main