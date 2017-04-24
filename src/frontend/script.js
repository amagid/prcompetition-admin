$(document).ready(function() {
    $(".checkbox_container").click(function() {
        var checkbox = $(this).find(".checkbox");
        if (checkbox.hasClass("checked")) {
            checkbox.removeClass("checked");
        } else {
            checkbox.addClass("checked");
        }
    });

    $(".radiobutton_container").click(function() {
        if (!$(this).find(".radiobutton").hasClass("checked")) {
            $(this).parent().find(".radiobutton").removeClass("checked");
            $(this).find(".radiobutton").addClass("checked");
        }
    })
});