$(function(){
  $(document).ready(function(){
    $('.owl-carousel__area--stage').bxSlider({
      auto: true,
      autoHover: true,
      speed: 600
    });
  });
  $(function(){
    for (let i=1; i<=4; i++) {  //商品にカーソルを合わせると対象のイメージを表示する
      let m = "#mini" + i
      let b = "#big"  + i
      $(m).mouseover(function() {
        $('.mini').css("opacity", "0.5");
        $(this).css('opacity', '1.0');
        $(".bigs").not(b).css("display", "none");
        $(b).fadeIn();
      });
    }
  });
});

