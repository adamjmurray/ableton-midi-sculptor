import cleanup from 'rollup-plugin-cleanup'

export default {
  input: 'build/main.js',
  output: {
    file: 'sculptor-device/sculptor.js',
    format: 'es',
  },
  plugins: [
    cleanup(), // remove comments and extra whitespace (but keeps the code formatting)
  ],
};
