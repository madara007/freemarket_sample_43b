$(function() {
  for (let i=1; i<=4; i++) {
    $(`.photos${i}`).on('change', 'input[type="file"]', function(e) {
        var file = e.target.files[0],
          reader = new FileReader(),
          $preview = $(`.photos${i}`);
      if(file.type.indexOf("image") < 0){
        return false;
      }
      reader.onload = (function(file) {
        return function(e) {
          $preview.empty();
          $preview.append($('<img>').attr({
                    src: e.target.result,
                    width: "143px",
                    height: "182px",
          }));
          $(`.box${i}`).css("display", "none");
          $(`.photos${i + 1}`).show();
          $(`img`).css("margin-left", "7px");
        };
      })(file);
      reader.readAsDataURL(file);
    });
  };
})
