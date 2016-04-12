module.exports = {
	options: {
		map: {
			inline: false,
		  	annotation: 'src/_attachments/resources/'
	  	},
	  	processors: [
			require('postcss-cssnext')({browsers: 'last 2 versions'}),
			require('cssnano')({autoprefixer: false}) // minify the result
	  	]
	},
	dist: {
		files: {
			'src/_attachments/resources/PURR.min.css': 'src/_attachments/resources/PURR.css'
		}
	}
};