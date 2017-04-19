#!/bin/bash

# This file creates functions to be used in ~/.bashrc

# TODO: Symbol for unknown git status: ↕
# TODO: Rewrite in python for faster execution?

function gitStatus()
{
    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && echo -n "true" || echo -n "false")
    if [[ "${isGitRepo}" == "false" ]]; then exit 1; fi


    echo -n " ["


    local branchInfo=$(git branch -v)
    local branchName=$(echo -n "${branchInfo}"| grep '*' | awk '{ print $2 }')
    echo -n "${branchName}"


    if [[ $(echo -n "${branchName}" | grep '*' | awk '{ print $2 }') != "master" ]]; then
        echo -n ""
    else
        local ahead=$(echo -n "${branchName}" | grep -Eqi "\[ahead [0-9]+\]" && echo -n " ↑" || echo -n "")
        local behind=$(echo -n "${branchName}" | grep -Eqi "\[behind [0-9]+\]" && echo -n " ↓" || echo -n "")

        if [[ "${ahead}" == "" && "${behind}" == "" ]]; then
            echo -n " ≡"
            # echo -n " ✔"
        else
            echo -n "${ahead}${behind}"
        fi
    fi


    local gitStatus=$(git status --porcelain)
    local addedChanges=""
    if [[ ! "${gitStatus}" == "" ]]; then
        # Notice the whitespace difference in the grep between this and the above.
        local numAdded=$(echo -n "${gitStatus}" | grep -E '^A(A| )' | wc -l) # +N
        local numDeleted=$(echo -n "${gitStatus}" | grep -E '^D(D| )' | wc -l) # -N
        local numModified=$(echo -n "${gitStatus}" | grep -E '^M(M| )' | wc -l) # ~N
        local numRenamed=$(echo -n "${gitStatus}" | grep -E '^R(R| )' | wc -l)
        local numCopied=$(echo -n "${gitStatus}" | grep -E '^C(C| )' | wc -l)
        numModified=$(( ${numModified} + ${numRenamed} + ${numCopied} ))
        if [[ "${numModified}" -ne 0 || "${numDeleted}" -ne 0 || "${numAdded}" -ne 0 ]]; then
            addedChanges+=" +${numAdded} ~${numModified} -${numDeleted} ~"
        fi
    fi


    echo -n "${addedChanges}"
    local unaddedChanges=""
    if [[ ! "${gitStatus}" == "" ]]; then
        local numAdded=$(echo -n "${gitStatus}" | grep -E '^\?\? ' | wc -l) # +N
        local numModified=$(echo -n "${gitStatus}" | grep -E '^( |M)M' | wc -l) # ~N
        local numDeleted=$(echo -n "${gitStatus}" | grep -E '^( |D)D' | wc -l) # -N
        if [[ "${numModified}" -ne 0 || "${numDeleted}" -ne 0 || "${numAdded}" -ne 0 ]]; then
            unaddedChanges+=" +${numAdded} ~${numModified} -${numDeleted} !"
        fi
    fi
    echo -n "${unaddedChanges}"


    echo -n "]"
}

