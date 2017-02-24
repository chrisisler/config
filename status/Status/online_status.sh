#!/usr/bin/env bash

# This scripts outputs a symbol (character) based on whether
# or not this computer is connected to the internet or not.

ping -n 2 www.google.com >/dev/null && echo "✔" || echo "×"

