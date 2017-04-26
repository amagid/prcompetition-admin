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

    function clearForm(form) {
        form.find("input, textarea").val("");
        form.find(".checkbox:not([data-default=checked]), .radiobutton:not([data-default=checked])").removeClass("checked");
        form.find(".checkbox[data-default=checked], .radiobutton[data-default=checked]").addClass("checked");
    }

    $(".clear").click(function() {
        clearForm($(this).parent());
    });

    $(".open_modal").click(function() {
        openModalForm($(this).data("form"));
    });

    function openModalForm(form) {
        $(".modal_content").addClass(form);
        $("body").addClass("modal_open");
    }

    $(".close_modal").click(function() {
        closeModal();
    });

    $(document).keydown(function(e) {
        if (e.which == 27)
            closeModal();
    });

    function closeModal() {
        $("body").removeClass("modal_open");
    }

    //FORM SUBMISSIONS
    $(".participant_add .submit").click(function() {
        if (!$(this).hasClass("disabled")) {
            $(this).addClass("disabled");
            var name = $(this).parent().find("#name").val();
            var caseid = $(this).parent().find("#caseid").val();
            var points = $(this).parent().find("#points").val();
            var active = $(this).parent().find("#active").hasClass("checked");
        
            var button = $(this);
            $.post("/api/participants", {
                    name: name,
                    caseid: caseid,
                    points: points,
                    active: active
            }).done(function(result) {
                alert("Success!");
                clearForm(button.parent());
            }).fail(function(error) {
                alert("Operation Failed. Reason: " + (error.message || "Unknown Error"));
            }).always(function() {
                button.removeClass("disabled");
            });
        }
    });

    $(".opportunity_outer .opportunity_add .submit").click(function() {
        if (!$(this).hasClass("disabled")) {
            $(this).addClass("disabled");
            var opp = $(this).parent().find("#opp").val();
            var date = (new Date($(this).parent().find("#date").val())).toISOString().split('Z')[0];
            var value = $(this).parent().find("#value").val();
            var event = $(this).parent().find("#event").val();
            var description = $(this).parent().find("#synopsis").val();
            var semester = $(this).parent().find("#semester").val();
            var year = $(this).parent().find("#year").val();
        
            var button = $(this);
            $.post("/api/opportunities", {
                    opp: opp,
                    date: date,
                    value: parseInt(value),
                    event: event,
                    description: description,
                    semester: semester.toLowerCase(),
                    year: parseInt(year)
            }).done(function(result) {
                alert("Success!");
                clearForm(button.parent());
            }).fail(function(error) {
                alert("Operation Failed. Reason: " + (error.message || "Unknown Error"));
            }).always(function() {
                button.removeClass("disabled");
            });
        }
    });
});