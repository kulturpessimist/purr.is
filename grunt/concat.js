module.exports = {
	js:{
		options: {
			separator: ';'
		},
		src: [
			// Polyfills
			'node_modules/es6-promise/dist/es6-promise.js',
			'node_modules/fetch-ponyfill/build/fetch-browser.js',
			'node_modules/scrollsnap-polyfill/dist/scrollsnap-polyfill.bundled.js',
			// Frameworks
			'node_modules/zenscroll/zenscroll.js',
			'node_modules/seen-js/dist/latest/seen.js',
			'node_modules/riot/riot.js',
			// own logic...
			'src/_attachments/resources/tags.js',
			'src/_attachments/js/main.js'
		],
		dest: 'src/_attachments/resources/PURR.js',
	},
	css:{
		options: {
			separator: '',
		},
		src: [
			'node_modules/normalize.css/normalize.css',
			'src/_attachments/css/main.css',
			'src/_attachments/css/sections.css',
			'src/_attachments/css/navigation.css',
			//'src/_attachments/css/cards.css',
			//'src/_attachments/css/forms.css'
		],
		dest: 'src/_attachments/resources/PURR.css',
	}
};