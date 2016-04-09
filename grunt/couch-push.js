module.exports = {
	options: {
		user: "<%= cfg.cloudant.username %>",
	  	pass: "<%= cfg.cloudant.password %>",
	},
	cloudant: {
		files: {
			'<%= cfg.cloudant.url %>/<%= cfg.cloudant.couch %>': 'build/website.json'
		}
	}
};