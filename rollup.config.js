import cleanup from 'rollup-plugin-cleanup'

export default {
  input: 'build/main.js',
  output: {
    file: 'distrib/sculptor.js',
    format: 'es',
  },
  plugins: [
    cleanup(),
  ],
};
