const global = `${process.env.NVM_BIN}/../lib/node_modules`;
const eslintPluginSortDestructureKeys = await import(`${global}/eslint-plugin-sort-destructure-keys/lib/index.js`);
const eslintPluginPerfectionist = await import(`${global}/eslint-plugin-perfectionist/dist/index.js`);
const eslintPluginReact = await import(`${global}/eslint-plugin-react/index.js`);
const eslintUnusedImportsPlugin = await import(`${global}/eslint-plugin-unused-imports/dist/index.js`);

export default [
	{
		plugins: {
			perfectionist: eslintPluginPerfectionist.default,
			react: eslintPluginReact.default,
			"sort-destructure-keys": eslintPluginSortDestructureKeys,
			"unused-imports": eslintUnusedImportsPlugin.default,
		},
		rules: {
			"no-console": "warn",
			"no-debugger": "error",
			"perfectionist/sort-named-exports": "warn",
			"perfectionist/sort-objects": "warn",
			// "sort-keys": "warn",
			"sort-destructure-keys/sort-destructure-keys": "warn",
			"no-unused-vars": "off", // or "@typescript-eslint/no-unused-vars": "off",
			"react/jsx-uses-react": "error",
			"react/jsx-uses-vars": "error",
			"unused-imports/no-unused-imports": "error",
			"unused-imports/no-unused-vars": [
				"warn",
				{
					"vars": "all",
					"varsIgnorePattern": "^_",
					"args": "after-used",
					"argsIgnorePattern": "^_",
				},
			]
		},
		languageOptions: {
			parserOptions: {
				ecmaFeatures: {
					jsx: true,
				},
			},
		},
	},
];
