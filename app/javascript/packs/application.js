// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require tinymce 
//= require tinymce-jquery
//= require_tree .
//= require modernizr
//= require froala_editor.min.js
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

$(function(){
  $('#questions-card').on('click', () => {
    window.location.replace('/questions')
  });
});


require("../../assets/javascripts/welcome/welcome")
require("../../assets/javascripts/answers/destroy")
require("../../assets/javascripts/question")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
