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
        --cache \
        --cache-location "$cacheDir" \
        "$projectRoot/**/*.{js,vue}"
    set +x;
    eslintExitCode=$?
    if (( $eslintExitCode > 0 ))
    then
        tryAgainOrAbort "ES Lint"
    fi
done

set -e;