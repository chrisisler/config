#!/bin/bash

# This file creates functions to be used in ~/.bashrc

# TODO: Symbol for unknown git status: ↕
# TODO: Rewrite in python for faster execution?

gitBracketL()
{
    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && printf "true" || printf "false")
    if [[ "${isGitRepo}" == "false" ]]; then exit -1; fi

    printf " ["
}

gitBracketR()
{
    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && printf "true" || printf "false")
    if [[ "${isGitRepo}" == "false" ]]; then exit -1; fi

    printf "]"
}

gitBranch()
{
    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && printf "true" || printf "false")
    if [[ "${isGitRepo}" == "false" ]]; then exit -1; fi

    local branchInfo=$(git branch)
    local branchName=$(printf "${branchInfo}"| grep '*' | awk '{ print $2 }')
    printf "${branchName}"
}

gitBranchAheadOrBehindOfMaster()
{
    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && printf "true" || printf "false")
    if [[ "${isGitRepo}" == "false" ]]; then exit -1; fi

    local branchName=$(git branch -v)

    # if [[ $(git name-rev --name-only HEAD) != "master" ]]; then
    if [[ $(printf "${branchName}" | grep '*' | awk '{ print $2 }') != "master" ]]; then
        return -1;
    fi

    local ahead=$(printf "${branchName}" | grep -Eqi "\[ahead [0-9]+\]" && printf " ↑" || printf "")
    local behind=$(printf "${branchName}" | grep -Eqi "\[behind [0-9]+\]" && printf " ↓" || printf "")

    if [[ "${ahead}" == "" && "${behind}" == "" ]]; then
        printf " ≡"
        # printf " ✔"
    else
        printf "${ahead}${behind}"
    fi
}

gitUnaddedChanges()
{
    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && printf "true" || printf "false")
    if [[ "${isGitRepo}" == "false" ]]; then exit -1; fi

    local gitStatus=$(git status --porcelain)

    local unaddedChanges=""
    if [[ ! "${gitStatus}" == "" ]]; then
        local numAdded=$(printf "${gitStatus}" | grep -E '^\?\? ' | wc -l | tr -d ' ') # +N
        local numModified=$(printf "${gitStatus}" | grep -E '^( |M)M' | wc -l | tr -d ' ') # ~N
        local numDeleted=$(printf "${gitStatus}" | grep -E '^( |D)D' | wc -l | tr -d ' ') # -N
        if [[ "${numModified}" -ne 0 || "${numDeleted}" -ne 0 || "${numAdded}" -ne 0 ]]; then
            unaddedChanges+=" +${numAdded} ~${numModified} -${numDeleted} !"
        fi
    fi

    printf "${unaddedChanges}"
}

# Only difference between this and <gitUnaddedChanges()> is the whitespace
# in the `grep` when retrieving the variables: numAdded, numDeleted, etc.
gitAddedChanges()
{
    # If current working directory is not a git repo, dont do anything.
    local isGitRepo=$(git status &>/dev/null && printf "true" || printf "false")
    if [[ "${isGitRepo}" == "false" ]]; then exit -1; fi

    local gitStatus=$(git status --porcelain)

    local addedChanges=""
    if [[ ! "${gitStatus}" == "" ]]; then
        # Notice the whitespace difference in the grep.
        local numAdded=$(printf "${gitStatus}" | grep -E '^A(A| )' | wc -l | tr -d ' ') # +N
        local numDeleted=$(printf "${gitStatus}" | grep -E '^D(D| )' | wc -l | tr -d ' ') # -N

        local numModified=$(printf "${gitStatus}" | grep -E '^M(M| )' | wc -l | tr -d ' ') # ~N
        local numRenamed=$(printf "${gitStatus}" | grep -E '^R(R| )' | wc -l | tr -d ' ')
        local numCopied=$(printf "${gitStatus}" | grep -E '^C(C| )' | wc -l | tr -d ' ')
        numModified=$(( ${numModified} + ${numRenamed} + ${numCopied} ))

        if [[ "${numModified}" -ne 0 || "${numDeleted}" -ne 0 || "${numAdded}" -ne 0 ]]; then
            addedChanges+=" +${numAdded} ~${numModified} -${numDeleted} ~"
        fi
    fi

    printf "${addedChanges}"
}
