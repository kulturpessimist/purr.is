module.exports = {
	default:{
		files: [
			{
	  			expand: true,
	  			cwd: 'src/_attachments/i18n',
	  			src: ['*.hjson'],
	  			dest: 'src/_attachments/resources/',
	  			ext: '.json',
			}
  		]
	}
};