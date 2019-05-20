const cli = require('eslint/lib/cli')
const path = require('path')

module.exports = function (projectRoot) {
  const targetPath = path.join(projectRoot, '**/*.js')

  cli.execute(targetPath);
}
