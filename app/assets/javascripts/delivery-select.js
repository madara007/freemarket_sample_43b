$(function(){
  $(document).on('change','#select-delivery', function (){
    var delivery_fee_id_val = $(this).val();
    if ($(this).parent().next()[0] != null){
      $(this).parent().nextAll().remove();
    }
    if (delivery_fee_id_val > 0) {
      $.ajax({
        type: 'GET',
        url: '/ship_methods',
        data: {id: delivery_fee_id_val},
        dataType: 'json'
      })
      .done(function(ship_methods){
        if (ship_methods.length > 0 ){
          addDelivery(ship_methods)
        }
      });
    }
  });
});
function addDelivery(ship_methods) {
  var delivery_base_html = ''
  ship_methods.forEach(function(ship_method){
    var delivery_option_html = "<option value="+ ship_method.id + ">" + ship_method.type + "</option>"
    delivery_base_html += delivery_option_html;
  })
  var add_delivery_html =`<div class="sell-content__sell-form-box--form-group margin-top" id="select-content-size">
<label>
配送の方法
<span class="form-require">
必須
</span>
</label><div class="select-wrap" id="select-wrap-delivery"><i class="fa fa-angle-down"></i><select class="select-default" name="item[ship_method_id]"><option value="">---</option>` + delivery_base_html
  $("#select-content-delivery").append(add_delivery_html);
}
