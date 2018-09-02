import typescript from 'rollup-plugin-typescript';

export default {
  input: 'src/main.js',
  output: {
    file: 'device/sculptor.js',
    format: 'es',
  },
  plugins: [
    typescript({
      typescript: require('typescript') // use the version of typescript from package.json (not the one bundled with the plugin)
    }),
    { renderChunk: code => code.replace(/\nexport.*/, '') }, // remove top-level exports
  ],
};