#!/usr/bin/env bash

git add "$(basename "${0}")"
git add -u ./*
git commit -m "$(date "+%Y-%m-%d %H:%M")"
