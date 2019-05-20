const cli = require("eslint/lib/cli");
const path = require("path");

module.exports = function(projectRoot) {
  const targetPath = path.join(projectRoot, "**/*.js --fix");
  const returnCode = cli.execute(targetPath);

  if (returnCode !== 0) {
    throw new Error("ESLint failed");
  }
};
