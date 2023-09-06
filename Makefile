CSS_FILES += ${IHP}/static/vendor/bootstrap.min.css
CSS_FILES += ${IHP}/static/vendor/flatpickr.min.css
CSS_FILES += static/app.css

JS_FILES += ${IHP}/static/vendor/jquery-3.6.0.slim.min.js
JS_FILES += ${IHP}/static/vendor/timeago.js
JS_FILES += ${IHP}/static/vendor/popper.min.js
JS_FILES += ${IHP}/static/vendor/bootstrap.min.js
JS_FILES += ${IHP}/static/vendor/flatpickr.js
JS_FILES += ${IHP}/static/helpers.js
JS_FILES += ${IHP}/static/vendor/morphdom-umd.min.js
JS_FILES += ${IHP}/static/vendor/turbolinks.js
JS_FILES += ${IHP}/static/vendor/turbolinksInstantClick.js
JS_FILES += ${IHP}/static/vendor/turbolinksMorphdom.js
# JS_FILES += static/app.js

include ${IHP}/Makefile.dist

# https://ihp.digitallyinduced.com/Guide/realtime-spas.html
# Admin/Frontend/node_modules:
# 	cd Admin/Frontend && npm install

# static/app.js: Admin/Frontend/node_modules Admin/Frontend/app.jsx
# 	cd Admin/Frontend && ./node_modules/.bin/esbuild app.jsx --bundle --outfile=../static/app.js ${ESBUILD_FLAGS}

# watch-frontend:
# 	touch Admin/Frontend/app.jsx # Force rebuild 
# 	$(MAKE) static/app.js ESBUILD_FLAGS="--watch"
