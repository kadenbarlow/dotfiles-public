#! /usr/bin/env node
import { mkdir, readFile, writeFile } from "fs/promises"
import { spawnSync } from "child_process"

// node ./create-function.mjs .../index.js queries getUser
const directory = process.argv[2]
const folder = process.argv[3]
const functionName = process.argv[4]
const fileName = functionName.replace(/([a-z0-9])([A-Z])/g, "$1-$2").toLowerCase()

await mkdir(`${directory}/${folder}/${fileName}`, { recursive: true })
await writeFile(`${directory}/${folder}/${fileName}/index.js`, "export default (ctx) => {\n\n}")

spawnSync(`${process.env.HOME}/.dotfiles/nvim/scripts/create-index.mjs`, [`${directory}/${folder}`])

const content = await readFile(`${directory}/index.js`, "utf8")
const regex = new RegExp(`import {(([a-zA-Z, \\t]|\n)*)} from "\.\/${folder}";`)
const matches = content.match(regex)
if (matches && !matches[0].includes(functionName)) {
  await writeFile(
    `${directory}/index.js`,
    content.replace(matches[0], `import { \n\t${functionName}, ${matches[1]} } from "./${folder}"\n`),
  )
} else {
  await writeFile(`${directory}/index.js`, `import { ${functionName} } from "./${folder}"\n` + content)
}

console.log(`${directory}/${folder}/${fileName}/index.js`)
