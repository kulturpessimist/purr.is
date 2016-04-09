module.exports = {
	js:{
		options: {
			separator: ';',
		},
		src: [
			'src/_attachments/bower_components/fetch/fetch.js',
			'src/_attachments/bower_components/riot/riot.js',
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
			'src/_attachments/bower_components/normalize.css/normalize.css',
			'src/_attachments/bower_components/milligram/dist/milligram.css',
			'src/_attachments/css/style.css'
		],
		dest: 'src/_attachments/resources/PURR.css',
	}
};