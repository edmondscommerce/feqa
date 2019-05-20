const cli = require("eslint/lib/cli");
const path = require("path");
const feqaPaths = require("./FeqaPaths");

module.exports = function(projectRoot) {
  const config = path.join(feqaPaths.libRoot(), ".eslintrc.js");

  let commandArgs = path.join(projectRoot, "resources/js/**/*.js --fix");

  commandArgs += " -c " + config;

  console.log(commandArgs);

  const returnCode = cli.execute(commandArgs);
  if (returnCode !== 0) {
    throw new Error("ESLint failed");
  }
};
