#!/usr/bin/env bash

# compile gulpfile
rm gulpfile.js
coffee -c -b ./lib/gulpfile.coffee

# deployment
cd ./lib && gulp

# vendor files
cp ./src/vendor/flexbox-reset.css dst/assets/css

rm -r dst/assets/js/i18n
rm -r dst/assets/js/network
rm -r dst/assets/js/conf
rm -r dst/assets/js/designs
rm -r dst/assets/js/helpers
rm -r dst/assets/js/sites
rm -r dst/assets/js/uis
rm dst/assets/js/app.js

# serve app
npx http-server ./dst --proxy http://localhost:8080?
