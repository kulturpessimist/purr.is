module.exports = function (grunt, options) {
    
    return {
        de: {
            options: grunt.file.readJSON('src/_attachments/resources/de.json'),
            cwd: 'src/_attachments/resources',
            src: 'index.html',
            dest: 'src/_attachments/',
            expand: true,
            ext: '.html',
            rename: function () {
                return 'src/_attachments/de.html';
            }
        },
        en: {
            options: grunt.file.readJSON('src/_attachments/resources/en.json'),
            cwd: 'src/_attachments/resources',
            src: 'index.html',
            dest: 'src/_attachments/',
            expand: true,
            ext: '.html',
            rename: function () {
                return 'src/_attachments/en.html';
            }
        }
    }
};