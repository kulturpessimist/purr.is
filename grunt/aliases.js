module.exports = {
	'default': [
		'preflight',
		'connect',
		'watch'
	],
  	'preflight': [
		'concat:css',
		'postcss',

		'hjson',
		'concat:html',
		'ejs',

		'concat:js',
		'uglify'
  	],
  	'compile': [
  		'preflight',
  		'couch-compile',
  		'clean-couch-compile'
  	],
  	'deploy:staging': [
  		'compile',
  		'couch-push:staging'
  	],
  	'deploy:production': [
  		'compile',
  		'couch-push:production'
  	]
};