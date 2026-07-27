#!/usr/bin/env node
/**
 * json5-build.js
 *
 * Converts JSON5 source configs into plain JSON output configs.
 * Built for: komorebi (Windows) + Waybar (Linux/Hyprland)
 *
 * Usage:
 *   node json5-build.js <source.json5> <output.json>
 *   node json5-build.js --config targets.json5   (batch mode, see below)
 *
 * Batch mode expects a targets file shaped like:
 *   {
 *     "targets": [
 *       { "src": "komorebi.json5", "out": "komorebi.json" },
 *       { "src": "waybar-config.json5", "out": "waybar-config" }
 *     ]
 *   }
 */

const fs = require("fs");
const path = require("path");
let JSON5;
try {
  JSON5 = require("json5");
} catch (e) {
  console.error("Missing dependency. Run: npm install -g json5");
  process.exit(1);
}

function convertOne(srcPath, outPath) {
  if (!fs.existsSync(srcPath)) {
    console.error(`✗ Source not found: ${srcPath}`);
    process.exitCode = 1;
    return;
  }
  try {
    const raw = fs.readFileSync(srcPath, "utf8");
    const parsed = JSON5.parse(raw);
    const out = JSON.stringify(parsed, null, 2) + "\n";
    fs.writeFileSync(outPath, out);
    console.log(`✓ ${srcPath} -> ${outPath}`);
  } catch (e) {
    console.error(`✗ Failed converting ${srcPath}: ${e.message}`);
    process.exitCode = 1;
  }
}

const args = process.argv.slice(2);

if (args[0] === "--config") {
  const targetsFile = args[1];
  if (!targetsFile) {
    console.error("Usage: node json5-build.js --config targets.json5");
    process.exit(1);
  }
  const raw = fs.readFileSync(targetsFile, "utf8");
  const { targets } = JSON5.parse(raw);
  const baseDir = path.dirname(path.resolve(targetsFile));
  for (const t of targets) {
    convertOne(path.resolve(baseDir, t.src), path.resolve(baseDir, t.out));
  }
} else if (args.length === 2) {
  convertOne(path.resolve(args[0]), path.resolve(args[1]));
} else {
  console.error("Usage:");
  console.error("  node json5-build.js <source.json5> <output.json>");
  console.error("  node json5-build.js --config targets.json5");
  process.exit(1);
}
