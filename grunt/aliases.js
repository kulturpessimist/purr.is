module.exports = {
	'default': [
		'preflight',
		'connect',
		'watch'
	],
  	'preflight': [
		'concat:css',
		'postcss',
		'riot',
		'concat:js',
		'uglify'
  	],
  	'compile': [
  		'preflight',
  		'couch-compile',
  		'clean-couch-compile'
  	],
  	'deploy': [
  		'compile',
  		'couch-push'
  	]
};