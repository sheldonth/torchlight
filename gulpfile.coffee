gulp = require('gulp')
sass = require('gulp-ruby-sass')
autoprefixer = require('gulp-autoprefixer')
minifycss = require('gulp-minify-css')
jshint = require('gulp-jshint')
uglify = require('gulp-uglify')
sourcemaps = require('gulp-sourcemaps')
imagemin = require('gulp-imagemin')
rename = require('gulp-rename')
concat = require('gulp-concat')
cache = require('gulp-cache')
iced = require('gulp-iced')
gutil = require('gulp-util')
gulplivereload = require('gulp-livereload')
livereload = require('connect-livereload')
bourbon = require('node-bourbon').includePaths
neat = require('node-neat').includePaths
lr = require('tiny-lr')()

paths =
  # styles: 'src/sass/**/*.sass'
  icedcoffee: 'src/frontend/*.iced'
  # scripts: 'public/js/*js'

gulp.task 'default', () ->
  console.log "Compiling icedcoffee from " + paths.icedcoffee
  gulp.src paths.icedcoffee
    .pipe iced(
      runtime: 'inline'
      bare: true
    ).on 'error', gutil.log
    .pipe gulp.dest 'public/js'