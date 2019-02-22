// $(function(){

//   const $modalContent = $(".modal"),
//         $modalOpen = $(".btn-red"),
//         $modalOpen_2 = $(".btn-red-2"),
//         $modalOverlay = $(".opacity_box"),
//         $body = $("body");
//   var formData = new FormData(this);
//   $modalOpen.on('click',function () {
//     var params = $('form').serialize();
//     console.log(params)
//     $.ajax({
//       url: '/items',
//       type: 'post',
//       data: params
//     })
//     .done(function(){
//       console.log("aaa")
//       // this.blur();
//       $body.addClass("is-fixed");
//       $modalOverlay.addClass("is-visible");
//       $modalContent.addClass("is-visible");
//       return false
//     })
//     .fail(function(XMLHttpRequest, textStatus, errorThrown) {
//       console.log("ss")
//       console.log(XMLHttpRequest.status);
//       console.log(textStatus);
//       console.log(errorThrown);
//       return false
//     });
//   });
//   $modalOpen.prop('disabled', false);
// });
