$(document).ready(function() {
    $(".checkbox").click(function() {
        if ($(this).hasClass("checked")) {
            $(this).removeClass("checked");
        } else {
            $(this).addClass("checked");
        }
    })
});