module.exports = function(grunt) {

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		cfg: grunt.file.readJSON('.couchapprc'),

		connect: {
			server: {
				options: {
					port: 9090,
					base: 'src/_attachments',
					livereload: true,
					open: 'http://127.0.0.1:9090'
				}
			 }
		},
		watch: {
			src: {
				files: [
					'src/_attachments/**/*', '!src/_attachments/resources/**/*'
				],
				//tasks: ['myth'],
				options: {
					livereload: true
				}
			},
			gruntfile: {
				files: ['Gruntfile.js']
			},
			livereload: {
				options: {
					livereload: true
				},
				files: [
					'src/_attachments/**/*', '!src/_attachments/resources/**/*'
				]
			}
		},
		myth: {
			options: {
				sourcemap: true
			},
			dist: {
				files: {
					'src/main.css': ['src/_attachments/css/normalize.css', 'src/_attachments/css/style.css']
				}
			}
		},
		'couch-compile': {
			website: {
				files: {
					'build/website.json': 'src'
				}
			}
		},
		'couch-push': {
			options: {
			  user: "<%= cfg.cloudant.username %>",
			  pass: "<%= cfg.cloudant.password %>",
			},
			cloudant: {
				files: {
					'<%= cfg.cloudant.url %>/<%= cfg.cloudant.couch %>': 'build/website.json'
				}
			}
		}
	});

	grunt.loadNpmTasks('grunt-myth');
	grunt.loadNpmTasks('grunt-couch');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-connect');

	grunt.registerTask('default', ['connect', 'watch']);
	//grunt.registerTask('default', ['myth', 'connect']);
	grunt.registerTask('compile', ['couch-compile']);
	grunt.registerTask('deploy', ['couch-compile', 'couch-push']);

};