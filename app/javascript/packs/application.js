
import "jquery-ujs"
import "bootstrap"
import 'popper.js'
import 'bootstrap'
import "./stylesheets/application.scss"
import "@fortawesome/fontawesome-free/js/all";
import '@fortawesome/fontawesome-free/scss/fontawesome.scss';
import '@fortawesome/fontawesome-free/scss/regular.scss';
import '@fortawesome/fontawesome-free/scss/solid.scss';

var Turbolinks = require("turbolinks");
Turbolinks.start();

var jquery = require("jquery");

$ = jquery
window.$ = jquery
window.jQuery = jquery

$(function(){
  $('#questions-card').on('click', () => {
    window.location.replace('/questions')
  });
});

// JavaScript
let webpackContext = require.context('./javascripts', true, /\.js$/)
for(let key of webpackContext.keys()) { webpackContext(key) }

// Images
require.context('./images', true, /\.(?:png|jpg|gif|ico|svg)$/)

// Stylesheets
require.context('./stylesheets', true, /\.sass$/)
