

# Allow uncommitted changes check by default
skipUncommittedChangesCheck=${skipUncommittedChangesCheck:-0}

# the path in the project to check for config
projectConfigPath="$projectRoot/qaConfig/"

# project var dir, sub directory for qa cache files and output files
varDir="$projectRoot/var/qa/feqa";

cacheDir="$varDir/cache";

# the path in this library for default config
defaultConfigPath="$(readlink -f ./../configDefaults/)"

# If a CI variable is set, we use that, otherwise default to false.
# Travis-CI sets a CI variable. You can easily set this in any other CI system
# The value should the the string 'true' if this is CI
CI=${CI:-'false'}

eslintConfigPath="$(configPath eslint.js)";
eslintIgnorePath="$(configPath eslintignore)";
jestConfigPath="$(configPath jest.js)";