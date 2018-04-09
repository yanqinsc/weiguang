$(document).ready(function(){
    var categoryId = $("input[name=category]").val();
    $(".nav-link").removeClass("active");
    $("#" + categoryId).addClass("active");
});
