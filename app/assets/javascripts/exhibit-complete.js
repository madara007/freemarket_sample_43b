$(function(){
  const $modalContent = $(".modal"),
        $modalOpen = $(".btn-red"),
        $modalOpen_2 = $(".btn-red-2"),
        $modalOverlay = $(".opacity_box"),
        $body = $("body");
  $modalOpen.on({
    click: function () {
      this.blur();
      $body.addClass("is-fixed");
      $modalOverlay.addClass("is-visible");
      $modalContent.addClass("is-visible");
    }
  });
  $modalOpen.prop('disabled', false);
});
