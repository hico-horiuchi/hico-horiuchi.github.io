gulp = require('gulp')
mainBowerFiles = require('main-bower-files')
$ = require('gulp-load-plugins')()

app = '.'
src = app + '/src'
config =
  input:
    slim: src + '/slim/*.slim'
    css: src + '/css/*.css'
    fonts: app + '/bower_components/fontawesome/fonts/fontawesome-webfont.*'
  output:
    slim: app + '/'
    css: app + '/assets/stylesheets/'
    fonts: app + '/assets/fonts/'

gulp.task 'slim', ->
  gulp.src(config.input.slim)
    .pipe($.slim())
    .pipe(gulp.dest(config.output.slim))

gulp.task 'css', ->
  gulp.src(config.input.css)
    .pipe($.concat('application.min.css'))
    .pipe($.minifyCss({ keepSpecialComments: 0 }))
    .pipe(gulp.dest(config.output.css))

gulp.task 'bower_css', ->
  gulp.src(mainBowerFiles({ filter: '**/*.scss' }))
    .pipe($.sass())
    .pipe($.concat('bower_components.min.css'))
    .pipe($.minifyCss({ keepSpecialComments: 0 }))
    .pipe(gulp.dest(config.output.css))

gulp.task 'bower_fonts', ->
  gulp.src(config.input.fonts)
    .pipe(gulp.dest(config.output.fonts))

gulp.task 'watch', ->
  gulp.watch(config.input.slim, ['slim'])
  gulp.watch(config.input.css, ['css'])

gulp.task 'webserver', ->
  gulp.src(app)
    .pipe($.webserver({ host: '0.0.0.0' }))

gulp.task 'default', [
  'slim',
  'css',
  'bower_css',
  'bower_fonts'
]

gulp.task 'development', [
  'webserver',
  'watch'
]
