#!/usr/bin/env bash

set -e

# This script concatenates various javascript words from many places into the final dictionary

# Dynamically grab the full path to the final dictionary filename from ~/.vimrc
finalDictionaryFile="$(cat ~/.vimrc | grep "'javascript' :" | awk '{ print $4 }' | tr -d "'")"

# Clear the content of the final dictionary if it exists.
clearFinalDictionary() {
    if [ -f "${1}" ]; then
        rm -v "${1}"
        touch "${1}"
        chmod 644 "${1}" 2>/dev/null
    fi
}

# This function concatenates all js-dictionary-*.txt files into the final dictionary
concatenateJavaScriptDictionaries() {
    for jsDict in $(find . -name "js-dictionary-*.txt"); do
        cat "${jsDict}" >> "${1}"
    done
}

# Scrapes function names from index.js from Chips library.
addChipsFunctions() {
    local chipsIndexJS="${HOME}/Main/Code/Git/chips/index.js"
    local fns="$(more "${chipsIndexJS}" | grep "require" | sed 's/:.*$//g' | tr -d ' ')"
    echo "${fns}" >> "${1}"
}

# Scrapes function names from `ls` from Ramda library.
addRamdaFunctions() {
    local ramdaFunctionFilenames="${HOME}/Main/Code/JS/Ramda/Test/node_modules/ramda/src"
    for ramdaFn in $(ls -1 "${ramdaFunctionFilenames}" | sed 's/\.js$//g'); do
        echo "${ramdaFn}" >> "${1}"
    done
}

removeDuplicates() {
    cat "${1}" | awk '!x[$0]++' > "${1}"
}

# Scrapes Array methods from https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array
# addArrayMethodsFromMDN() {
    # TODO
# }

# addNodeJSModules() {
    # TODO
# }

clearFinalDictionary "${finalDictionaryFile}"
concatenateJavaScriptDictionaries "${finalDictionaryFile}"
addChipsFunctions "${finalDictionaryFile}"
addRamdaFunctions "${finalDictionaryFile}"
# removeDuplicates "${finalDictionaryFile}"
