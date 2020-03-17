
import "jquery-ujs"
import "bootstrap"
import 'popper.js'
import 'bootstrap'
import "application.scss"
import './javascripts/welcome'

var Turbolinks = require("turbolinks");
Turbolinks.start();

var jquery = require("jquery");
debugger;
jquery.start();

$ = jquery
window.$ = jquery
window.jQuery = jquery

// $(function(){
//   $('#questions-card').on('click', () => {
//     window.location.replace('/questions')
//   });

// });

document.getElementById("questions-card").addEventListener("click", function() {
  window.location.replace('/questions')
})

$('#questions-card').on('click', () => {
  window.location.replace('/questions')
});

// JavaScript
let webpackContext = require.context('../javascripts', true, /\.js$/)
for(let key of webpackContext.keys()) { webpackContext(key) }

// Images
require.context('../images', true, /\.(?:png|jpg|gif|ico|svg)$/)

// Stylesheets
require.context('../stylesheets', true, /\.sass$/)


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
