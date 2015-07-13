// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .
//= require bootstrap
jQuery(function($) {
  $("tr[data-link]").click(function() {
    window.location = this.dataset.link
  });
})

function remove_fields(field) {
  $(field).prev().val("true");
  $(field).parent().hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var expression = "_[0-9]+_";
  var regexp = new RegExp(expression, 'g');

  content = content.replace(regexp, "_" + new_id + "_");
  expression = association + "_attributes\]\[[0-9]+\]";
  regexp = new RegExp(expression, 'g');
  $(link).parent().before(content.replace(regexp, association + "_attributes][" + new_id + "]"));
}

var countChecked = function() {
  var n = $( "input:checked" ).length;
  var num_words = $( "#lesson_stats" ).data("num-words");
  $( "#lesson_stats" ).html( n + "/" + num_words);
};

$(document).ready(function(){
  countChecked();
  $("input").on("click",countChecked );
});