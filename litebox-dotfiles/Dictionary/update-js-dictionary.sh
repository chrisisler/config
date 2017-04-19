#!/usr/bin/env bash

# This script concatenates all js-dictionary-*.txt files into ./js-all.txt

finalDictionaryFileName="./js-all.txt"

clearFinalDictionary() {
    rm -v "${finalDictionaryFileName}"
    touch "${finalDictionaryFileName}"
    chmod 644 "${finalDictionaryFileName}" 2>/dev/null
}

concatenateJavaScriptDictionaries() {
    for jsDict in $(find . -name "js-dictionary-*.txt"); do
        cat "${jsDict}" >> "${finalDictionaryFileName}"
    done
}

clearFinalDictionary
concatenateJavaScriptDictionaries
