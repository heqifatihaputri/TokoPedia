jQuery(function() {
  var sub_categories;
  $('#search_sub_category_id').parent().hide();
  sub_categories = $('#search_sub_category_id').html();
  console.log(sub_categories);
  return $('#search_category_id').change(function() {
    var category, escaped_category, options;
    category = $('#search_category_id :selected').text();
    escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(sub_categories).filter("optgroup[label=" + escaped_category + "]").html();
    console.log(options);
    if (options) {
      $('#search_sub_category_id').html(options);
      return $('#search_sub_category_id').parent().show();
    } else {
      $('#search_sub_category_id').empty();
      return $('#search_sub_category_id').parent().hide();
    }
  });
});