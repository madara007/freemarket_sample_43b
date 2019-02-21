$(function() {
  $('.sell-content__image-upload-box--sell-dropbox-container .form-mask-image:first').removeClass('box-display-none')
  $(document).on('change', 'input[type="file"]', function(event) {
    $preview = $(this).parent();
    previewFile(event,$preview)
    $(this).parent().addClass("box-display-none");
    $(this).parent().parent().parent().addClass("box-display-none");
    // $(this).parent().parent().parent().next().removeClass("box-display-none");
    // $(this).parent().parent().parent().next().children().children().removeClass("box-display-none");
    // console.log($(".image-box-1:last"))
    $(this).parent().parent().parent().next('.form-mask-image').removeClass("box-display-none");
    $(this).parent().parent().parent().next('.form-mask-image').children().children().removeClass("box-display-none");
  })
  function previewFile(e,$preview) {
    var file = e.target.files[0],
        reader = new FileReader();
    if(file.type.indexOf("image") < 0){
      return false;
    }
    reader.onload = (function(file) {
      return function(e){
        var html_whole = `
<div class="image-box-1">
  <div class="image-box-2">
    <img>
  </div>
  <div class="edit-delete-button">
    <div class="edit-button">編集</div>
    <div class="replace"></div>
  </div>
</div>
        `
        $preview.parent().parent().after(html_whole)
        $preview.parent().parent().next().children().children('img').attr({
          src: e.target.result,
          width: "150px",
          height: "100px",
          class: "preview",
          title: file.name
        })
        var delete_btn = $('<div class="delete-button">').text('削除').on('click',function(){
          var c = $(this).parent().parent().prev().children().children().children("").clone();
          c.val('');
          $(this).parent().parent().prev().children().children().children("").replaceWith(c);
          c.remove()
          // $(this).parent().parent().prev().children().children().removeClass("box-display-none")
          $(this).parent().parent().prev().addClass("box-display-none")

          $(this).parent().parent().prev().appendTo('.sell-content__image-upload-box--sell-dropbox-container');
          $(this).parent().parent().remove()

          $(".image-box-1:last").next(".form-mask-image").removeClass("box-display-none");

          $(".image-box-1:last").next(".form-mask-image").children().children().removeClass("box-display-none");
        });
        $('.replace').replaceWith(delete_btn)
      };
    })(file);
    reader.readAsDataURL(file);
  }
})
