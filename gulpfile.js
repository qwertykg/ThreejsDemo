var gulp = require("gulp");
var runner = require("gulp-run");
var connect = require("gulp-connect");
var open = require("gulp-open");

gulp.task("compile", function () {
    return gulp.src("./")
               .pipe(runner("compile.hxml"))
});

gulp.task('connectDev', function () {
    connect.server({
        name: 'Dev App',
        root: ['./', 'index'],
        port: 8000,
        livereload: true
    });

    gulp.src(__filename)
        .pipe(open({uri: 'http://localhost:8000'}));
});
