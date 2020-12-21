Development Process

The package.json scripts provide everything needed to develop this device.

Setup
1. Install Node.js 14 or higher
2. `npm install`

Development Process
1. `npm run build` to build devices/sculptor.amxd
2. Add the device to a Live set
3. Edit the device
4. Open the Max console. You'll see a console message when the code is rebuilt.
5. Run `npm run dev` to automatically build changes to the code.
6. Click "Show containing project" in the Max editor toolbar. From here you can open and edit any patcher in the device.
7. Use `console.log()` to print to the Max console for debugging.

Pre-commit
1. `npm run test` - All tests must pass.

Updating Screenshots
1. Use zoom level 150%
2. Crop out the window toolbar

Releasing
1. Bump the version number: Edit the device to update the version number text and save
2. Freeze the device, then "Save as" the frozen device to the releases folder (e.g. releases/{VERSION}/Sculptor.amxd)
3. Confirm this copy of the device works by re-adding it to your set
4. Update the README's link to the device
5. Update release/latest-version.txt
5. Commit all changes and push
