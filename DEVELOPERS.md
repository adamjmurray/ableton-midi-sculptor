Development Process

The package.json scripts provide everything needed to develop this device.

Setup
1. Install Node 6 or higher
2. `npm install`

Development Process
1. `npm run build` to build devices/sculptor.amxd
2. Add the device to a Live set
3. Edit the device
4. Switch to patching mode in the Max editor
5. Click the `autowatch 1` message
6. Open the Max console. You'll see a console message when the code is rebuilt.
7. Run `npm run build:watch` to automatically build changes to the code.
8. Click "Show containing project" in the Max editor toolbar. From here you can open and edit any patcher in the device.
9. To debug, import logger.ts (e.g. `import { log } from './logger'`), and `log("message")` to log to the Max console.

Pre-commit
1. `npm run test` - All tests must pass.
