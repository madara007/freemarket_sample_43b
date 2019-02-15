$(function(){
  $(document).on('change', '#select-category', function () {
    var category_id_val = $(this).val();
    if ($(this).parent().next()[0] != null){
      $(this).parent().nextAll().remove();
    }
    if (category_id_val > 0) {
      $.ajax({
        type: 'GET',
        url: '/categories/search',
        data: {id:category_id_val},
        dataType: 'json'
      })
      .done(function(categories){
        if (categories.length > 0 ){
          addCategory(categories)
        }
        else{
          $.ajax({
            type: 'GET',
            url: '/sizes/' + category_id_val,
            dataType: 'json',
            processData: false,
            contentType: false
          })
          .done(function(sizes){
            if (sizes.length > 0){
              addSize(sizes)
            }
            addBrand()
          });
        }
      });
    }
  });
});
function addCategory(categories) {
  var category_base_html = ''
  categories.forEach(function(category){
    var category_option_html = "<option value="+ category.id + ">" + category.name + "</option>"
    category_base_html += category_option_html;
  })
  var add_category_html =`<div class="select-wrap" id="select-wrap-category"><i class="fa fa-angle-down"></i><select class="select-default" id="select-category" name="item[category_id]"><option value="">---</option>` + category_base_html
  $("#select-content-category").append(add_category_html);
}
function addSize(sizes) {
  var sise_base_html = ''
  sizes.forEach(function(size){
    var size_option_html = '<option value='+ size.id + '>' + size.name + '</option>'
    sise_base_html += size_option_html;
  })
  var add_size_html =`<div class="sell-content__sell-form-box--form-group margin-top" id="select-content-size">
<label>
サイズ
<span class="form-require">
必須
</span>
</label>
<div class="select-wrap" id="select-wrap-size"><i class="fa fa-angle-down"></i><select class="select-default" name="item[size_id]"><option value="">---</option>` + sise_base_html

  $("#select-content-category").append(add_size_html);
}
function addBrand(){
  var add_brand_html = `<div class="sell-content__sell-form-box--form-group margin-top"><label>ブランド<span class="form-no-require">任意</span></label><div><input class="input-brand" value="" placeholder="例）シャネル" name="item[brand_name]"></div><!-- react-empty: 35 --></div>`
  $("#select-content-category").append(add_brand_html);
}
