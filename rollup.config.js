import babel from "rollup-plugin-babel";

export default {
  input: "src/main.js",
  output: {
    file: "device/sculptor.js",
    format: "es",
  },
  plugins: [
    babel(),
    { renderChunk: (code) => code.replace(/\nexport.*/, "") }, // remove top-level exports
  ],
};
