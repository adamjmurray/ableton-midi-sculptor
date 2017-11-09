const { watch } = require('fs')
const { execSync } = require('child_process')

const DEFAULT_COLOR = '\x1b[0m'
const RED = '\x1b[31m'
const GREEN = '\x1b[32m'

const TEST_COMMAND = 'npm test'

let timeout

function test() {
  try {
    console.log(DEFAULT_COLOR, `> ${TEST_COMMAND}\n`)
    execSync(TEST_COMMAND, { stdio: 'inherit' })
    console.log(GREEN, 'SUCCESS')
  } catch (_) { console.error(RED, 'ERROR')}
}

watch('./src', { recursive: true },  (eventType, filename) => {
  if (eventType !== 'change') return
  // the watch API is unstable and can fire duplicate events, so debounce:
  if (timeout) clearTimeout(timeout)
  timeout = setTimeout(() => {
    timeout = null
    console.log(DEFAULT_COLOR, `\n src/${filename} changed, testing...`)
    test()
  }, 500)
})

console.log('Watching src folder for changes...')
test()
