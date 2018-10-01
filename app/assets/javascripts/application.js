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
//= require activestorage
//= require turbolinks
//= require lightbox
//= require jquery
//= require jquery_ujs
//= require_tree .

jQuery(function() {
  var sub_categories;
  $('#product_sub_category_id').parent().hide();
  sub_categories = $('#product_sub_category_id').html();
  console.log(sub_categories);
  return $('#product_category_id').change(function() {
    var category, escaped_category, options;
    category = $('#product_category_id :selected').text();
    escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(sub_categories).filter("optgroup[label=" + escaped_category + "]").html();
    console.log(options);
    if (options) {
      $('#product_sub_category_id').html(options);
      return $('#product_sub_category_id').parent().show();
    } else {
      $('#product_sub_category_id').empty();
      return $('#product_sub_category_id').parent().hide();
    }
  });
});