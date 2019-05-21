set +e;

eslintExitCode=99;

while (( $eslintExitCode > 0 ))
do
    # Run command
    cd $projectRoot;
    set -x;
    $projectRoot/node_modules/.bin/eslint \
        --debug \
        -c "$eslintConfigPath" \
        --ignore-path "$eslintIgnorePath"\
        --cache \
        --cache-location "$cacheDir" \
        --fix \
        "$projectRoot/**/*.{js,vue,ts}"
    set +x;
    cd -;
    eslintExitCode=$?
    if (( $eslintExitCode > 0 ))
    then
        tryAgainOrAbort "ES Lint"
    fi
done

set -e;