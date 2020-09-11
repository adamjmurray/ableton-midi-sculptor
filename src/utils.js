export function clamp(value, min, max) {
  return Math.max(min, Math.min(max, value));
}

// TODO: rename to indicate this is a numeric fuzzy equals
export function fuzzyEquals(float1, float2, delta = 0.000001) {
  return Math.abs(float1 - float2) < delta || Object.is(float1, float2);
}

export function mod(dividend, divisor) {
  const remainder = dividend % divisor;
  // the Math.abs() is to convert -0 to 0 when the divisor is negative:
  return remainder >= 0 ? Math.abs(remainder) : remainder + divisor;
}

export function reflectedMod(dividend, divisor) {
  const n = Math.abs(dividend);
  const value = mod(n, divisor);
  const reversed = Math.floor(n / divisor) % 2 === 1;
  return reversed ? divisor - value : value;
}
