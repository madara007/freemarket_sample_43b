$(function() {
  $('.select__tag').click(function() {
    var index = $('.select__tag').index(this);
    $('.select__tag').removeClass('active');
    var itemlist = $('.select__items');
    itemlist.each(function(){
      this.setAttribute("hidden", "hidden");
    });
    $(this).addClass('active');
    $('.select__items')[index].removeAttribute('hidden');
  });
});
