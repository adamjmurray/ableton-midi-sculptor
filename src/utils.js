export function clamp(value, min, max) {
  return Math.max(min, Math.min(max, value));
}

// check if two numbers are almost equal to compensate for floating point round-off error
export function fuzzyEquals(num1, num2, delta = 0.001) {
  return Math.abs(num1 - num2) < delta || Object.is(num1, num2);
}

export function mod(dividend, divisor) {
  const remainder = dividend % divisor;
  // Math.abs() converts -0 to 0 when the divisor is negative:
  return remainder >= 0 ? Math.abs(remainder) : remainder + divisor;
}

export function reflectedMod(dividend, divisor) {
  const n = Math.abs(dividend);
  const value = mod(n, divisor);
  const reversed = Math.floor(n / divisor) % 2 === 1;
  return reversed ? divisor - value : value;
}
