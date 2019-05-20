const path = require("path");

module.exports = class FeqaPaths {
  static getRoot() {
    return path.resolve("./");
  }

  static libRoot() {
    return path.resolve(__dirname, "../");
  }
};
