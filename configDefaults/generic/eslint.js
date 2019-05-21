module.exports = {
  'env': {
    'browser': true,
    'es6': true
  },
  'parser':  '@typescript-eslint/parser',
  'extends': [
      'plugin:@typescript-eslint/recommended',
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
