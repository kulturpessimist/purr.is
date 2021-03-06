module.exports = {
	js:{
		options: {
			separator: ';'
		},
		src: [
			// Polyfills
			'node_modules/es6-promise/dist/es6-promise.js',
			'node_modules/whatwg-fetch/fetch.js',
			'node_modules/scrollsnap-polyfill/dist/scrollsnap-polyfill.bundled.js',
			// Frameworks
			'node_modules/zenscroll/zenscroll.js',
			//'node_modules/seen-js/dist/latest/seen.js',
			// own logic...
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
	},
	html:{
		options: {
			separator: '\n<!-- next -->\n',
		},
		src: [
			'src/_attachments/partials/_header.html',
			'src/_attachments/partials/maximum.html',
			'src/_attachments/partials/about.html',
			'src/_attachments/partials/cloud.html',
			'src/_attachments/partials/streams.html',
			'src/_attachments/partials/team.html',
			'src/_attachments/partials/contact.html',
			'src/_attachments/partials/imprint.html',
			'src/_attachments/partials/_footer.html'
		],
		dest: 'src/_attachments/resources/index.html',
	}
};