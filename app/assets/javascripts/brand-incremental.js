$(function() {
  function appendBrand(brand) {
    var search_list = $(".brand-box");
    var html = `<div class="brands">
                  <p class="brand-name data-brand-id="${brand.id} data-brand-name="${brand.name}">${brand.name}</p>
                </div>`
    search_list.append(html);
  }

  $(document).on("keyup", ".input-brand", function() {
    var input = $(this).val();
       $(".brand-box").empty();
    if (input !== ""){
     $.ajax({
        type: "GET",
        url: "/items/search",
        dataType: "json",
        data: { keyword: input },
      })
     .done(function(brands) {
       $(".brand-box").empty();
       if (brands.length !== 0) {
         brands.forEach(function(brand){
           appendBrand(brand);
         });
       }
     })
    }
  });

  $(document).on("click",".brand-name", function(){
    var brand_id = $(this).attr('data-brand-id');
    var name = $(this).attr('data-brand-name');
    $(".brands").css("display", "none");
    $(".input-brand").val(name, brand_id);
  });
});
