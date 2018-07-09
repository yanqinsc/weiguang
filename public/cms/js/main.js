$(document).ready(function(){
    let categoryId = $("input[name=category]").val();
    $(".nav-link").removeClass("active");
    $("#" + categoryId).addClass("active");
});
