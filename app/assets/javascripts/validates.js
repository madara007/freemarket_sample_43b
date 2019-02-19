$(function(){
  function error_message(error_message, error_msg_box) {
    var messages = {
      "nickname": "ニックネームを入力してください",
      "email": "メールアドレスを入力してください",
      "password": "パスワードを入力してください",
      "password_confirmation": "パスワード (確認)を入力してください",
      "last_name": "姓 (全角)を入力してください",
      "first_name": "名 (全角)を入力してください",
      "last_name_kana": "姓カナ (全角)を入力してください",
      "first_name_kana": "名カナ (全角)を入力してください"
    }
    $.each(messages,function(err_name, text){
      if (error_message == err_name) {
        error_msg_box.text(text);
      }
    })
  }
  $(".field").on("keyup", function(){
    var input_field_parent = $(this).parent();
    if (input_field_parent.attr("class") == "field_with_errors") {
      var input_field_parent = $(input_field_parent).parent();
    }
    var input_filed_boxs = input_field_parent.children();
    input_filed_boxs.each(function(){
      if ($(this).attr("class") == "span error-msg") {
        $(this).remove();
      }
    });
    input_field_parent.append(`<div class="span error-msg"></div>`);
    var error_msg_box = input_field_parent.children().last();
    if ($(this).val().length == 0 ) {
      var error_name = $(this).attr("name");
      var error_RegExp = RegExp(/\[(.*)\]/);
      var err_message = error_name.match(error_RegExp)[1];
      error_message(err_message, error_msg_box);
    } else {
      error_msg_box.text("");
    }
  });
  $('select').change(function() {
    var birthday_year = $('[name="user[birthday(1i)]"] option:selected').text();
    var birthday_month = $('[name="user[birthday(2i)]"] option:selected').text();
    var birthday_date = $('[name="user[birthday(3i)]"] option:selected').text();
    var err_msg = $('.birthday-select .error-msg');
    if ((err_msg.text.length > 0) && (birthday_year > 0) && (birthday_month > 0) && (birthday_date > 0)) {
      err_msg.empty();
    }
  })
});
