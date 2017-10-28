const { watch } = require('fs')
const { execSync } = require('child_process')

const DEFAULT_COLOR = '\x1b[0m'
const RED = '\x1b[31m'
const GREEN = '\x1b[32m'

const BUILD_COMMAND = 'npm run build --silent'

let timeout

function build() {
  try {
    console.log(DEFAULT_COLOR, `> ${BUILD_COMMAND}\n`)
    execSync(BUILD_COMMAND, { stdio: 'inherit' })
    console.log(GREEN, 'SUCCESS')
  } catch (_) { console.error(RED, 'ERROR')}
}

watch('./src', { recursive: true },  (eventType, filename) => {
  if (eventType !== 'change') return
  // the watch API is unstable and can fire duplicate events, so debounce:
  if (timeout) clearTimeout(timeout)
  timeout = setTimeout(() => {
    timeout = null
    console.log(DEFAULT_COLOR, `\n src/${filename} changed, rebuilding...`)
    build()
  }, 500)
})

console.log('Watching src folder for changes...')
build()
