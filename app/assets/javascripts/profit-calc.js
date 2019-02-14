$(function() {
  $(".input-price").on("keyup", function() {
    var input_price = $(".input-price").val();
    var profit = Math.ceil(input_price*0.9)
    var comission = input_price - profit
    if ( 300 <= input_price && input_price <= 9999999){
      document.getElementById('comission-content').innerHTML = "¥"+ Number(comission).toLocaleString();
      document.getElementById('profit-content').innerHTML = "¥"+ Number(profit).toLocaleString();
    }
    else{
      document.getElementById('comission-content').innerHTML = "-";
      document.getElementById('profit-content').innerHTML = "-";
    }
  });
});
