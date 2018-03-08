#!/bin/bash

__dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
printf "$(cat "${__dirname}/what-am-i-doing.txt" | tail -1)"
