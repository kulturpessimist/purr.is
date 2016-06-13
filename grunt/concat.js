module.exports = {
	js:{
		options: {
			separator: ';'
		},
		src: [
			// Polyfills
			'src/_attachments/bower_components/es6-promise/es6-promise.js',
			'src/_attachments/bower_components/fetch/fetch.js',
			'src/_attachments/bower_components/scrollsnap-polyfill/dist/scrollsnap-polyfill.bundled.js',
			// Frameworks
			'src/_attachments/bower_components/zenscroll/zenscroll.js',
			'src/_attachments/bower_components/seenjs/index.js',
			'src/_attachments/bower_components/riot/riot.js',
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
			'src/_attachments/bower_components/normalize-css/normalize.css',
			'src/_attachments/css/main.css',
			'src/_attachments/css/sections.css',
			'src/_attachments/css/navigation.css',
			//'src/_attachments/css/cards.css',
			//'src/_attachments/css/forms.css'
		],
		dest: 'src/_attachments/resources/PURR.css',
	}
};