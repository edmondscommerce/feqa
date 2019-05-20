set +e;

eslintStanExitCode=99;

while (( $eslintStanExitCode > 0 ))
do
    # Run command
    eslintStanExitCode=$(runCommand e)

    if (( $eslintStanExitCode > 0 ))
    then
        tryAgainOrAbort "ES lint Stan"
    fi
done

set -e;