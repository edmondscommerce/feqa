set +e;

jestExitCode=99;

while (( $jestExitCode > 0 ))
do
    # Run command
    set -x;
    $projectRoot/node_modules/.bin/jest \
    --rootDir=$projectRoot
    --config=$jestConfigPath
    set +x;

    jestExitCode=$?
    if (( $jestExitCode > 0 ))
    then
        tryAgainOrAbort "ES Lint"
    fi
done

set -e;