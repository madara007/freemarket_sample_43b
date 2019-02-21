// $(function(){
//   //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録



//   $('form').on('change', 'input[type="file"]', function(event) {
//     console.log($(this).next(".preview"));
//     console.log($(".preview").eq(0));
//     console.log($(".preview"));
//     // console.log($(this).next(".preview"))
//     // console.log($(".preview"))
//     $preview = $(this).next(".preview");
//     previewFile(event,$preview)
//   });
//   function previewFile(e,$preview) {
//     var file = e.target.files[0],
//         reader = new FileReader();
//         // t = this;

//     // 画像ファイル以外の場合は何もしない
//     if(file.type.indexOf("image") < 0){
//       return false;
//     }

//     // ファイル読み込みが完了した際のイベント登録
//     reader.onload = (function() {
//       return function(e) {
//         //既存のプレビューを削除
//         $preview.empty();
//         // .prevewの領域の中にロードした画像を表示するimageタグを追加
//         $preview.append($('<img>').attr({
//                   src: e.target.result,
//                   width: "150px",
//                   height: "100px",
//                   class: "preview",
//                   title: file.name
//         }));
//       };
//     })(file);
//     reader.readAsDataURL(file);
//   }
// });
