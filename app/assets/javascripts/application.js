// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require prism
//= require tinymce
//= require_tree .

if (screen.width < 700) {
    tinymce.init({
      selector: '.tinymce',  // change this value according to your HTML
      plugins: ['image', 'link', 'codesample', 'preview'],
      toolbar: 'styleselect | bold italic | undo redo | link image | codesample | preview',
      branding: false,
      height: 250
    });
} else {
    tinymce.init({
      selector: '.tinymce',  // change this value according to your HTML
      plugins: ['image', 'link', 'codesample', 'preview'],
      toolbar: 'styleselect | bold italic | undo redo | link image | codesample | preview',
      branding: false,
      width: 700,
      height: 250
    });
}

