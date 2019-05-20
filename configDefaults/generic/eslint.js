module.exports = {
  'env': {
    'browser': true,
    'es6': true
  },
  'extends': [
      'plugin:prettier/recommended',
      'plugin:vue/recommended'
  ],
  'globals': {
    'Atomics': 'readonly',
    'SharedArrayBuffer': 'readonly'
  },
  'parserOptions': {
    'ecmaVersion': 2018,
    'sourceType': 'module'
  },
  'rules': {

  }
};
