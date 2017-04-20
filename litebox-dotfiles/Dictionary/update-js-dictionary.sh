#!/usr/bin/env bash

# This script concatenates various javascript words from many places into ./js-all.txt

finalDictionaryFileName="./js-all.txt"

# Clear the content of ./js-all.txt
clearFinalDictionary() {
    rm -v "${finalDictionaryFileName}"
    touch "${finalDictionaryFileName}"
    chmod 644 "${finalDictionaryFileName}" 2>/dev/null
}

# This function concatenates all js-dictionary-*.txt files into ./js-all.txt
concatenateJavaScriptDictionaries() {
    for jsDict in $(find . -name "js-dictionary-*.txt"); do
        cat "${jsDict}" >> "${finalDictionaryFileName}"
    done
}

# Scrapes function names from index.js from Chips library.
addChipsFunctions() {
    local chipsIndexJS="${HOME}/Main/Code/Git/chips/index.js"
    local fns="$(more "${chipsIndexJS}" | grep "require" | sed 's/:.*$//g' | tr -d ' ')"
    echo "${fns}" >> "${finalDictionaryFileName}"
}

# Scrapes function names from `ls` from Ramda library.
addRamdaFunctions() {
    local ramdaFunctionFilenames="${HOME}/Main/Code/JS/Ramda/Test/node_modules/ramda/src"
    for ramdaFn in $(ls -1 "${ramdaFunctionFilenames}" | sed 's/\.js$//g'); do
        echo "${ramdaFn}" >> "${finalDictionaryFileName}"
    done
}

# Scrapes Array methods from https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array
# addArrayMethodsFromMDN() {
    # TODO
# }

# addNodeJSModules() {
    # TODO
# }

clearFinalDictionary
concatenateJavaScriptDictionaries
addChipsFunctions
addRamdaFunctions
