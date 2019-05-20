#!/usr/bin/env node
let paths = require("../src/FeqaPaths");
let eslint = require("../src/Eslint");

const root = paths.getRoot();

console.log("Running ESLint with Prettier autofixing");
eslint(root);
console.log("Success");
