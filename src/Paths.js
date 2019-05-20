const path = require("path");

module.exports = class Paths {
  static getRoot() {
    return path.join(__dirname, "/../");
  }
};
