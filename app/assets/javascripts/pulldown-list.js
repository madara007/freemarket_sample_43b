$(document).ready(function(){
  var nav = $(".category-nav");
  var parent = $(".pulldown-parent__list");
  var child = $(".pulldown-child__list");
  var descendant = $(".pulldown-descendant")
  $(nav).mouseover(function(){
    $(parent).show();
  })
  $(parent).mouseover(function(){
    $(this).children(child).show();
  })
  $(child).mouseover(function(){
    $(this).children(descendant).show();
  })

  $(child).mouseout(function(){
    $(this).children('ul').hide();
  })

  $(parent).mouseout(function(){
    $(this).children('ul').hide();
  })
  $(nav).mouseout(function(){
    $(parent).hide();
  })

  var brand = $(".brand-nav");
  var list = $(".pulldown-brand__list");

  $(brand).mouseover(function(){
    $(list).show();
  })
  $(brand).mouseout(function(){
    $(list).hide();
  })
})
