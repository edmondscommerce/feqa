#!/usr/bin/env bash
readonly DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd $DIR;
set -e
set -u
set -o pipefail
standardIFS="$IFS"
IFS=$'\n\t'

singleToolToRun=
specifiedPath=

function usage {
    echo "Usage:"
    echo "npx feqa [-t tool to run ] [ -p path to scan ]"
    echo ""
    echo "Defaults to using all tools and scanning whole project based on platform"
    echo ""
    echo " - use -h to see this help"
    echo ""
    echo " - use -p to specify a specific path to scan"
    echo ""
    echo " - use -t to specify a single tool:"
    echo "     lint|eslint                   ES Linting and fixing"
    echo "     jest|jest                     Jest testing framework"
    exit 1
}

while getopts ":t:p:h" opt; do
    case "$opt" in
        t) singleToolToRun=$OPTARG ;;
        p) specifiedPath=$OPTARG ;;
        h) usage ;;
        \?)
            printf "\nERROR:\nInvalid option: -$OPTARG\n\n" >&2
            usage
        ;;
        :)
            printf "\nERROR\nOption -$OPTARG requires an argument\n\n" >&2
            usage
        ;;
    esac
done

if [[ "" != "$singleToolToRun" ]]
then
    case "$singleToolToRun" in
        lint | eslint                  ) singleToolToRun="eslint";;
        jest | jtest                  ) singleToolToRun="jest";;
        * )
            printf "\nERROR:\nInvalid tool: $singleToolToRun\n\n" >&2
            usage
        ;;
    esac
    echo "Running Single Tool: $singleToolToRun"
fi