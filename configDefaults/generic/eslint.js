module.exports = {
  'env': {
    'browser': true,
    'es6': true
  },
  'extends': [
      'plugin:@typescript-eslint/recommended',
      // 'plugin:prettier/recommended',
      'plugin:vue/recommended'
  ],
  'globals': {
    'Atomics': 'readonly',
    'SharedArrayBuffer': 'readonly'
  },
  'parserOptions': {
    'parser':  '@typescript-eslint/parser',
    'ecmaVersion': 2018,
    'sourceType': 'module'
  },
  'rules': {

  }
};
