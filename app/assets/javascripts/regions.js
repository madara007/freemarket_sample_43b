$(function(){
  $("#hokkaido").click(function(){
    var position = $("#area_1").offset().top;
    $("html,body").animate({
      scrollTop : position
    })
  })
  $("#tohoku").click(function(){
    var position = $("#area_2").offset().top;
    $("html,body").animate({
      scrollTop : position
    })
  })
  $("#kanto").click(function(){
    var position = $("#area_3").offset().top;
    $("html,body").animate({
      scrollTop : position
    })
  })
  $("#hokuriku").click(function(){
    var position = $("#area_4").offset().top;
    $("html,body").animate({
      scrollTop : position
    })
  })
  $("#tyubu").click(function(){
    var position = $("#area_5").offset().top;
    $("html,body").animate({
      scrollTop : position
    })
  })
  $("#kinki").click(function(){
    var position = $("#area_6").offset().top;
    $("html,body").animate({
      scrollTop : position
    })
  })
  $("#tyugoku").click(function(){
    var position = $("#area_7").offset().top;
    $("html,body").animate({
      scrollTop : position
    })
  })
  $("#sikoku").click(function(){
    var position = $("#area_8").offset().top;
    $("html,body").animate({
      scrollTop : position
    })
  })
  $("#kyusyu").click(function(){
    var position = $("#area_9").offset().top;
    $("html,body").animate({
      scrollTop : position
    })
  })
})
