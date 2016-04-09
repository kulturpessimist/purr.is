module.exports = {
	'default': [
		'connect',
		'watch'
	],
  	'preflight': [
		'concat:css',
		'myth',
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