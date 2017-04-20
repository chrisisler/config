#!/usr/bin/env bash

git add "$(basename "${0}")"
git add ./*
git commit -m "$(date "+%Y-%m-%d %H:%M")"
