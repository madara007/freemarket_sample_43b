$(function(){
  const $modalContent = $(".modal"),
        $modalOpen = $(".btn-red"),
        $modalOpen_2 = $(".btn-red-2"),
        $modalOverlay = $(".opacity_box"),
        $body = $("body");
  console.log('aaa')
  $modalOpen.on({
    click: function () {
      this.blur();
      $body.addClass("is-fixed");
      $modalOverlay.addClass("is-visible");
      $modalContent.addClass("is-visible");
      console.log('bbb')
    }
  });
  $modalOpen.prop('disabled', false);
  console.log('ccc')
});
