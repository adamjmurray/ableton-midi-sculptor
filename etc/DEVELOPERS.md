Development Process

The package.json scripts provide everything needed to develop this device.

Setup
1. Use Node.js 16 or higher
2. `npm install`

Development Process
1. `npm run build` to build `devices/sculptor.amxd`
2. Add the device to a Live set
3. Edit the device
4. Open the Max Console. You'll see message when the code is rebuilt.
5. Run `npm run dev` to automatically build changes to the code.
6. Click "Show containing project" in the Max editor toolbar. From here you can open and edit any patcher in the device.
7. Use `console.log()` to print to the Max console for debugging.

Pre-commit
1. `npm run test` - All tests must pass.

Updating Screenshots
1. Use zoom level 150%
2. Crop out the window toolbar

Releasing
1. Bump the version number in the `log()` message in `main.js`
2. Bump the version number in the device's UI and the version check logic in `sculptor.amxd`
3. Create a release:
   - Save the device (after bumping the version number)
   - Freeze the device
   - "Save as" the frozen device to `releases/{VERSION}/Sculptor.amxd`
4. Confirm this copy of the device works by re-adding it to your set
5. Update the README's link to the device
6. Update `release/latest-version.txt` (if not releasing a beta)
7. Commit all changes and push
