import cleanup from 'rollup-plugin-cleanup'

export default {
  input: 'build/test/test-main.js',
  output: {
    file: 'build/test/all-tests.js',
    format: 'es',
  },
  plugins: [
    cleanup(), // remove comments and extra whitespace (but keeps the code formatting)
  ],
};
