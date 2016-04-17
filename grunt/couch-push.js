module.exports = {
	production:{
		options: {
			user: "<%= cfg.cloudant.username %>",
		  	pass: "<%= cfg.cloudant.password %>",
		},
		files: {
			'<%= cfg.cloudant.url %>/<%= cfg.cloudant.couch %>': 'build/website.json'
		}
	},
	staging:{
		options: {
			user: "<%= cfg.staging.username %>",
		  	pass: "<%= cfg.staging.password %>",
		},
		files: {
			'<%= cfg.staging.url %>/<%= cfg.staging.couch %>': 'build/website.json'
		}
	}
};