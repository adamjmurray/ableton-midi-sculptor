export function mod(n, q) {
  const value = n % q;
  return value >= 0 ? value : value + q;
}
export function reflectedMod(n, q) {
  n = Math.abs(n);
  const value = mod(n, q);
  const reversed = Math.floor(n / q) % 2 === 1;
  return reversed ? q - value : value;
}