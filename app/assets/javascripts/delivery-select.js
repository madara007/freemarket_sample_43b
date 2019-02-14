$(function(){
  $(document).on('change','#select-delivery', function (){
    var val = $(this).val();
    if ($(this).parent().next()[0] != null){
      $(this).parent().nextAll().remove();
    }
    if (val != 0) {
      $.ajax({
        type: 'GET',
        url: '/ship_methods',
        data: {id: val},
        dataType: 'json'
      })
      .done(function(ship_methods){
        console.log(ship_methods)
        if (ship_methods.length != 0 ){
          addDelivery(ship_methods)
        }
      });
    }
  });
});
function addDelivery(ship_methods) {
  var html3 = ''
  ship_methods.forEach(function(ship_method){
    var html2 = "<option value="+ ship_method.id + ">" + ship_method.type + "</option>"
    html3 += html2;
  })
  var html =`<div class="sell-content__sell-form-box--form-group margin-top" id="select-content-size">
<label>
配送の方法
<span class="form-require">
必須
</span>
</label><div class="select-wrap" id="select-wrap-delivery"><i class="fa fa-angle-down"></i><select class="select-default" name="item[ship_method_id]"><option value="">---</option>` + html3
  $("#select-content-delivery").append(html);
}
