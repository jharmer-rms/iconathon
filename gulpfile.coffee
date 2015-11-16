gulp = require 'gulp'
rename = require 'gulp-rename'
svgmin = require 'gulp-svgmin'
iconfont = require 'gulp-iconfont'
consolidate = require 'gulp-consolidate'

# https://github.com/svg/svgo/tree/master/plugins
# We use these plugins for all our svg optimizing.
svgoPluginOpts = [
  { removeViewBox: false }
  { removeDesc: true }
  { removeTitle: true }
  { removeRasterImages: true }
  { cleanupNumericValues: false }
]

gulp.task 'font', ->
  gulp
    .src ["./src/icons/*.svg"]
    .pipe svgmin
      plugins: svgoPluginOpts
    .pipe iconfont
      fontName: "rmsicons"
      fixedWidth: true
      centerHorizontally: true
    .on 'codepoints', (codepoints, options) ->
      # Outputs a CSS file with the right characters.
      templateData = {
        glyphs: codepoints
        className: 'icon'
        fontName: options.fontName
      }
      gulp
        .src './src/templates/icon-css-points.tmpl'
        .pipe consolidate 'lodash', templateData
        .pipe rename 'icon-points.less'
        .pipe gulp.dest "./build/fonts"
    .pipe gulp.dest "./build/fonts"

gulp.task 'watch', ->
  gulp.watch './src/icons/*'

gulp.task 'default', [
  'watch',
  'font'
]
