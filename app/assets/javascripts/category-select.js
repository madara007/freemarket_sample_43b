$(function(){
  $(document).on('change', '#select-category', function () {
    var val = $(this).val();
    if ($(this).parent().next()[0] != null){
      $(this).parent().nextAll().remove();
    }
    if (val != 0) {
      $.ajax({
        type: 'GET',
        url: '/categories/search',
        data: {id:val},
        dataType: 'json'
      })
      .done(function(categories){
        if (categories.length != 0 ){
          addCategory(categories)
        }
        else{
          $.ajax({
            type: 'GET',
            url: '/sizes/' + val,
            dataType: 'json',
            processData: false,
            contentType: false
          })
          .done(function(sizes){
            if (sizes.length != 0){
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
  var html3 = ''
  categories.forEach(function(category){
    var html2 = "<option value="+ category.id + ">" + category.name + "</option>"
    html3 += html2;
  })
  var html =`<div class="select-wrap" id="select-wrap-category"><i class="fa fa-angle-down"></i><select class="select-default" id="select-category" name="item[category_id]"><option value="">---</option>` + html3
  $("#select-content-category").append(html);
}
function addSize(sizes) {
  var sizes_html = ''
  sizes.forEach(function(size){
    var size_html = '<option value='+ size.id + '>' + size.name + '</option>'
    sizes_html += size_html;
  })
  var html =`<div class="sell-content__sell-form-box--form-group margin-top" id="select-content-size">
<label>
サイズ
<span class="form-require">
必須
</span>
</label>
<div class="select-wrap" id="select-wrap-size"><i class="fa fa-angle-down"></i><select class="select-default"><option value="">---</option>` + sizes_html

  $("#select-content-category").append(html);
}
function addBrand(){
  var html = `<div class="sell-content__sell-form-box--form-group margin-top"><label>ブランド<span class="form-no-require">任意</span></label><div><input class="input-brand" value="" placeholder="例）シャネル" ></div><!-- react-empty: 35 --></div>`
  $("#select-content-category").append(html);
}
