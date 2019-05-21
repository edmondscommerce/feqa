set +e;

jestExitCode=99;

while (( $jestExitCode > 0 ))
do
    # Run command
    cd $projectRoot;
    set -x;
    $projectRoot/node_modules/.bin/jest \
    --config=$jestConfigPath \
    --rootDir=$projectRoot
    set +x;
    cd -;

    jestExitCode=$?
    if (( $jestExitCode > 0 ))
    then
        tryAgainOrAbort "ES Lint"
    fi
done

set -e;