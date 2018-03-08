#!/usr/bin/env bash

ping -c 2 -t 5 www.google.com &>/dev/null || echo -n "×"
# ping -c 2 -t 5 www.google.com &>/dev/null && echo -n "✓" || echo -n "×"

