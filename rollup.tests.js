import cleanup from 'rollup-plugin-cleanup'

export default {
  input: 'build/tests/tests-init.js',
  output: {
    file: 'build/tests/all-tests.js',
    format: 'es',
  },
  plugins: [
    cleanup(), // remove comments and extra whitespace (but keeps the code formatting)
  ],
};
