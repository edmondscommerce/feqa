set +e;

eslintExitCode=99;

while (( $eslintExitCode > 0 ))
do
    # Run command
    set -x;
    $projectRoot/node_modules/.bin/eslint \
        --debug \
        -c "$eslintConfigPath" \
        --ignore-path "$projectRoot/.gitignore" \
        --ext .js,.vue \
        --cache \
        --cache-location "$cacheDir" \
        "$projectRoot/**/*.js"
    set +x;
    eslintExitCode=$?
    if (( $eslintExitCode > 0 ))
    then
        tryAgainOrAbort "ES Lint"
    fi
done

set -e;