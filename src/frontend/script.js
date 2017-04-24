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
    });

    $(".clear").click(function() {
        $(this).parent().find("input, textarea").val("");
        $(this).parent().find(".checkbox, .radiobutton").removeClass("checked");
    });

    //FORM SUBMISSIONS
    $(".participant_outer .participant_add .submit").click(function() {
        if (!$(this).hasClass("disabled")) {
            $(this).addClass("disabled");
            var name = $(this).parent().find("#name").val();
            var caseid = $(this).parent().find("#caseid").val();
            var points = $(this).parent().find("#points").val();
        
            var button = $(this);
            $.post("/api/participants", {
                    name: name,
                    caseid: caseid,
                    points: points
            }).done(function(result) {
                alert("Success!");
            }).fail(function(error) {
                alert("Operation Failed. Reason: " + error);
            }).always(function() {
                button.removeClass("disabled");
            });
        }
    });
});