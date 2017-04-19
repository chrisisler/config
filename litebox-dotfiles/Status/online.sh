#!/usr/bin/env bash

ping -c 2 www.google.com &>/dev/null && echo -n "✓" || echo -n "×"

