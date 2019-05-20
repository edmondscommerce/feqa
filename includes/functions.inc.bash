#!/usr/bin/env bash

readonly platformGeneric="generic"

################################################################
# Can add other platforms as required
function detectPlatform(){
    echo $platformGeneric
}

################################################################
# Run a tool
# First check for a project qaConfig tool override
# Then a platform tool
# finally the Generic tool
function runTool(){
    local tool="$1"
    local projectOverridePath="$projectConfigPath/tools/$tool.inc.bash"
    local platformPath="$DIR/../includes/$platform/$tool.inc.bash"
    local genericPath="$DIR/../includes/generic/$tool.inc.bash"

    if [[ -f "$projectOverridePath" ]]
    then
        echo "Running Project Override $tool"
        source "$projectOverridePath"
        return 0
    elif [[ -f "$platformPath" ]]
    then
        echo "Running $platform $tool"
        source "$platformPath"
        return 0
    fi
    echo "Running generic $tool"
    source "$genericPath"
}

function runCommand() {
    set -x
    "$@";
    local exitCode=$?;
    set +x

    printf "$exitCode";
}
################################################################
# Get the path for a config file
# Config file will be search for in:
#   A qaConfig folder in the project root
#   The phpqa library's configDefaults/{platform}
#   The phpqa library's configDefaults/generic
#
# Usage:
#
# `configPath "relative/path/to/file/or/folder"
function configPath(){
    local relativePath="$1"
    local platformPath="$defaultConfigPath/$platform/$relativePath"
    local genericPath="$defaultConfigPath/generic/$relativePath"
    if [[ -f $projectConfigPath/$relativePath ]]
    then
        echo $projectConfigPath/$relativePath
    elif [[ -f $platformPath ]]
    then
        echo $platformPath
    else
        echo $genericPath
    fi
}


###############################################################
# Function to check there are no uncommitted changes.
#
# This will also prompt you to commit these changes if you want to.
#
# Usage:
# checkForUncommitedChanges
function checkForUncommittedChanges {
    if [[ "false" != "${CI:-'false'}" ]]
    then
        echo "Skipping uncommited changes check in CI"
        return 0;
    fi
    if [[ "$skipUncommittedChangesCheck" == "1" ]]
    then
        echo "Skipping uncommitted changes check. export skipUncommittedChangesCheck=0 to reinstate"
        return 0
    fi

    targetDir=${1:-$(pwd)}
    originalDir=$(pwd)

    if [[ ! -d $targetDir/.git/ ]]
    then
        echo "$targetDir is not a git repo"
        return
    fi

    cd $targetDir

    set +e
    inGitRepo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    if [[ "" != "$inGitRepo" ]]
    then
        git status | grep -Eq "nothing to commit, working .*? clean"
        repoDirty=$?
        set -e
        if (( $repoDirty > 0 ))
        then
            git status
            echo "

    ==================================================

        Untracked or Uncommited changes detected

        Would you like to commit (c) or abort (a)

        (git commit will be 'git add -A; git commit')

        or export skipUncommittedChangesCheck=1 to ignore

    ==================================================

            "
            read -n 1 commitOrAbort
            if [[ "$commitOrAbort" != "c" ]]
            then
                printf "\n\n\nAborting...\n\n\n"
                exit 1
            fi
            git add -A
            git commit
        fi
    fi

    cd $originalDir
}


function tryAgainOrAbort(){
    toolname="$1"
    if [[ "false" != "${CI:-'false'}" ]]
    then
        echo "

    ==================================================

        $toolname Failed...

    ==================================================

        "
        exit 1
    fi
    echo "

    ==================================================

        $toolname Failed...

        would you like to try again? (y/n)

        (note: if you change config files, you might have to run from the top for it to take effect...)

    ==================================================

    "
    while read -n 1 tryAgainOrAbort
    do
        if [[ "n" == "$tryAgainOrAbort" ]]
        then
            printf "\n\nAborting...\n\n"
            exit 1
        fi
        if [[ "y" == "$tryAgainOrAbort" ]]
        then
            break;
        fi
        printf "\n\ninvalid choice: $tryAgainOrAbort - should be y or n \n\n        would you like to try again? (y/n)"
    done
    printf "\n\nTrying again, good luck!\n\n"
    hasBeenRestarted="true"
}