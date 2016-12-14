#!/bin/bash

# This file creates functions to be used in ~/.bashrc

# TODO: Symbol for unknown git status: ↕

function gitBracketL()
{
    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && echo -n "true" || echo -n "false")
    if [[ "${isGitRepo}" == "false" ]]; then return -1; fi

    echo -n " ["
}

function gitBracketR()
{
    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && echo -n "true" || echo -n "false")
    if [[ "${isGitRepo}" == "false" ]]; then return -1; fi

    echo -n "]"
}

function gitBranch()
{
    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && echo -n "true" || echo -n "false")
    if [[ "${isGitRepo}" == "false" ]]; then return -1; fi

    local branchInfo=$(git branch)
    local branchName=$(echo -n "${branchInfo}"| grep '*' | awk '{ print $2 }')
    echo -n "${branchName}"
}

function gitBranchAheadOrBehindOfMaster()
{
    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && echo -n "true" || echo -n "false")
    if [[ "${isGitRepo}" == "false" ]]; then return -1; fi

    local branchName=$(git branch -v)

    # if [[ $(git name-rev --name-only HEAD) != "master" ]]; then
    if [[ $(echo -n "${branchName}" | grep '*' | awk '{ print $2 }') != "master" ]]; then
        return -1;
    fi

    local ahead=$(echo -n "${branchName}" | grep -Eqi "\[ahead [0-9]+\]" && echo -n " ↑" || echo -n "")
    local behind=$(echo -n "${branchName}" | grep -Eqi "\[behind [0-9]+\]" && echo -n " ↓" || echo -n "")

    if [[ "${ahead}" == "" && "${behind}" == "" ]]; then
        echo -n " ≡"
        # echo -n " ✔"
    else
        echo -n "${ahead}${behind}"
    fi
}

function gitUnaddedChanges()
{
    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && echo -n "true" || echo -n "false")
    if [[ "${isGitRepo}" == "false" ]]; then return -1; fi

    local gitStatus=$(git status --porcelain)

    local unaddedChanges=""
    if [[ ! "${gitStatus}" == "" ]]; then
        local numAdded=$(echo -n "${gitStatus}" | grep -E '^\?\? ' | wc -l) # +N
        local numModified=$(echo -n "${gitStatus}" | grep -E '^ M ' | wc -l) # ~N
        local numDeleted=$(echo -n "${gitStatus}" | grep -E '^ D ' | wc -l) # -N
        if [[ "${numModified}" -ne 0 || "${numDeleted}" -ne 0 || "${numAdded}" -ne 0 ]]; then
            unaddedChanges+=" +${numAdded} ~${numModified} -${numDeleted} !"
        fi
    fi

    echo -n "${unaddedChanges}"
}

# Only difference between this and <gitUnaddedChanges()> is the whitespace
# in the `grep` when retrieving the variables: numAdded, numDeleted, etc.
function gitAddedChanges()
{
    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && echo -n "true" || echo -n "false")
    if [[ "${isGitRepo}" == "false" ]]; then return -1; fi

    local gitStatus=$(git status --porcelain)

    local addedChanges=""
    if [[ ! "${gitStatus}" == "" ]]; then
        # Notice the whitespace difference in the grep.
        local numAdded=$(echo -n "${gitStatus}" | grep -E '^A ' | wc -l) # +N
        local numDeleted=$(echo -n "${gitStatus}" | grep -E '^D ' | wc -l) # -N

        local numModified=$(echo -n "${gitStatus}" | grep -E '^M ' | wc -l) # ~N
        local numRenamed=$(echo -n "${gitStatus}" | grep -E '^R ' | wc -l)
        local numCopied=$(echo -n "${gitStatus}" | grep -E '^C ' | wc -l)
        numModified=$(( ${numModified} + ${numRenamed} + ${numCopied} ))

        if [[ "${numModified}" -ne 0 || "${numDeleted}" -ne 0 || "${numAdded}" -ne 0 ]]; then
            addedChanges+=" +${numAdded} ~${numModified} -${numDeleted} ~"
        fi
    fi

    echo -n "${addedChanges}"
}

