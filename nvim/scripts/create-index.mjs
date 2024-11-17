#! /usr/bin/env node
import { readdir, writeFile } from "fs/promises";

const camelize = (s) => s.replace(/(-|_)./g, (x) => x[1].toUpperCase());
const getDirectories = async (source) =>
  (await readdir(source, { withFileTypes: true }))
    .filter((dirent) => dirent.isDirectory())
    .map((dirent) => dirent.name);

const { imports, exports } = Object.entries(
  (await getDirectories(process.argv[2])).reduce((acc, dir) => {
    acc[camelize(dir)] = `./${dir}`;
    return acc;
  }, {}),
)
  .sort((a, b) => a[0].localeCompare(b[0]))
  .reduce(
    (acc, [key, value]) => {
      acc.imports.push(`import ${key} from "${value}";`);
      acc.exports.push(`  ${key},`);
      return acc;
    },
    { imports: [], exports: [] },
  );

await writeFile(
  `${process.argv[2]}/index.js`,
  `${imports.join("\n")}\n\nexport {\n${exports.join("\n")}\n};\n`,
);
