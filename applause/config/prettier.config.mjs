export default {
	importOrder: ["^[@]", "^[#]", "^[.]"],
	importOrderSeparation: false,
	importOrderSortSpecifiers: true,
	importOrderCaseInsensitive: true,
	plugins: [`${process.env.NVM_BIN}/../lib/node_modules/@trivago/prettier-plugin-sort-imports/lib/src/index.js`],
	printWidth: 120,
	semi: true,
	singleQuote: false,
	tabWidth: 2,
	trailingComma: "es5",
	useTabs: true,
};
