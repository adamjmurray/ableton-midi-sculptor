export function mod(n: number, q: number): number {
  const value = n % q
  return value >= 0 ? value : value + q
}

export function reflectedMod(n: number, q: number): number {
  n = Math.abs(n)
  const value = mod(n, q)
  const reversed = (Math.floor(n / q)) % 2 === 1
  return reversed ? q - value : value
}
