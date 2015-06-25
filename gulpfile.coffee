gulp = require('gulp')
$ = require('gulp-load-plugins')()

app = '.'
src = app + '/src'
config =
  input:
    slim: src + '/slim/*.slim'
    css: src + '/css/*.css'
    js: src + '/js/*.js'
  output:
    slim: app + '/'
    css: app + '/assets/stylesheets/'
    js: app + '/assets/javascripts/'

gulp.task 'webserver', ->
  gulp.src(app)
    .pipe($.webserver({
      host: '0.0.0.0'
    }))

gulp.task 'slim', ->
  gulp.src(config.input.slim)
    .pipe($.slim())
    .pipe(gulp.dest(config.output.slim))

gulp.task 'css', ->
  gulp.src(config.input.css)
    .pipe($.concat('application.min.css'))
    .pipe($.minifyCss({
      keepSpecialComments: 0
    }))
    .pipe(gulp.dest(config.output.css))

gulp.task 'js', ->
  gulp.src(config.input.js)
    .pipe($.concat('application.min.js'))
    .pipe($.uglify())
    .pipe(gulp.dest(config.output.js))

gulp.task 'watch', ->
  gulp.watch(config.input.slim, ['slim'])
  gulp.watch(config.input.css, ['css'])
  gulp.watch(config.input.js, ['js'])

gulp.task 'default', [
  'webserver',
  'slim',
  'css',
  'js',
  'watch'
]
