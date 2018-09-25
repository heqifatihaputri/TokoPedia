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