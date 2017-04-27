$(document).ready(function () {
    $(".checkbox_container").click(function () {
        var checkbox = $(this).find(".checkbox");
        if (checkbox.hasClass("checked")) {
            checkbox.removeClass("checked");
        } else {
            checkbox.addClass("checked");
        }
    });

    $(".radiobutton_container").click(function () {
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

    $(".clear").click(function () {
        clearForm($(this).parent());
    });

    $(".open_modal").click(function () {
        openModalForm($(this).data("form"));
    });

    function openModalForm(form) {
        $(".modal_content").addClass(form);
        $("body").addClass("modal_open");
    }

    function openModalFormWithData(formSelector, data) {
        $(".modal_content").addClass(formSelector);
        var form = $(".modal_content .modal_tab." + formSelector);
        form.addClass("edit");
        var formElement;
        for (prop in data) {
            formElement = form.find("#" + prop);
            if (formElement.hasClass("radiobutton") || formElement.hasClass("checkbox")) {
                if (data[prop]) {
                    formElement.addClass("checked");
                } else {
                    formElement.removeClass("checked");
                }
            } else {
                formElement.val(data[prop]);
            }
        }

        $("body").addClass("modal_open");
    }

    $(".close_modal").click(function () {
        closeModal();
    });

    $(document).keydown(function (e) {
        if (e.which == 27)
            closeModal();
    });

    function closeModal() {
        $("body").removeClass("modal_open");
        $(".modal_tab.edit").removeClass("edit");
    }

    $(".form_button.rescore").click(function () {
        $.post('/api/participants/rescore')
            .done(loadParticipants)
            .fail(function (error) {
                alert("Score Recalculation Failed.");
            })
            .always(function () {
                alert("Score Recalculation Complete!");
            });
    })

    $(".load_participants").click(loadParticipants);
    //Data Loaders
    function loadParticipants() {
        $.get('/api/participants/')
            .done(function (participants) {
                var frag = $(document.createDocumentFragment('<div class="rows">'));
                for (var i = 0; i < participants.length; i++) {
                    frag.append('<div class="participant row">' +
                        '<div class="cell caseid">' + participants[i].caseid + '</div>' +
                        '<div class="cell name">' + participants[i].name + '</div>' +
                        '<div class="cell points">' + participants[i].points + '</div>' +
                        '<div class="cell active">' + (participants[i].active ? "Yes" : "No") + '</div>' +
                        '<div class="cell rescore_container"><i class="fa fa-calculator" id="rescore"></i></div>' +
                        '<div class="cell edit_container"><i class="fa fa-pencil-square-o" id="edit"></i></div>' +
                        '<div class="cell trash_container"><i class="fa fa-trash-o" id="delete"></i></div>' +
                        '</div>');
                }
                $(".table.participants_output").html('<div class="row bold header">' +
                    '<div class="cell caseid">CaseID</div>' +
                    '<div class="cell name">Full Name</div>' +
                    '<div class="cell points">Total Points</div>' +
                    '<div class="cell active">Active</div></div>');
                $(".table.participants_output").append(frag);
            }).fail(function (error) {
                $(".table.participants_output").text("Failed to load participants.");
            });
    }

    $(".participants_output").on('click', '#rescore', function () {
            var participant = $(this).parent().parent();
            var caseid = participant.find(".caseid").text();
            var name = participant.find(".name").text();
            $.post('/api/participants/' + caseid + '/rescore')
                .done(loadParticipants)
                .fail(function (error) {
                    alert("Rescore Failed.");
                })
                .always(function () {
                    alert("Successfully recalculated score for " + name + "!");
                });
        })
        .on('click', '#edit', function () {
            var participant = $(this).parent().parent();
            var caseid = participant.find(".caseid").text();
            var name = participant.find(".name").text();
            var points = participant.find(".points").text();
            var active = participant.find(".active").text() === "Yes";
            openModalFormWithData("participant_add", {
                caseid: caseid,
                name: name,
                points: points,
                active: active
            });
        })
        .on('click', '#delete', function () {
            var participant = $(this).parent().parent();
            var caseid = participant.find(".caseid").text();
            var name = participant.find(".name").text();
            if (confirm("Are you sure you want to delete " + name + "?")) {
                $.ajax({
                        url: '/api/participants/' + caseid,
                        method: 'DELETE'
                    })
                    .done(loadParticipants)
                    .fail(function (error) {
                        alert("Deletion Failed.");
                    });
            }
        });




    //FORM SUBMISSIONS
    $(".participant_add .submit").click(function () {
        if (!$(this).hasClass("disabled")) {
            $(this).addClass("disabled");
            var name = $(this).parent().find("#name").val();
            var caseid = $(this).parent().find("#caseid").val();
            var points = $(this).parent().find("#points").val();
            var active = $(this).parent().find("#active").hasClass("checked");

            var button = $(this);

            if (!$(this).parent(".participant_add").hasClass("edit")) {

                $.post("/api/participants", {
                    name: name,
                    caseid: caseid,
                    points: points,
                    active: active
                }).done(function (result) {
                    alert("Success!");
                    clearForm(button.parent());
                }).fail(function (error) {
                    alert("Operation Failed. Reason: " + (error.message || "Unknown Error"));
                }).always(function () {
                    button.removeClass("disabled");
                });

            } else {

                $.post("/api/participants/" + caseid, {
                    name: name,
                    caseid: caseid,
                    points: points,
                    active: active
                }).done(function (result) {
                    alert("Success!");
                    clearForm(button.parent());
                    closeModal();
                    loadParticipants();
                }).fail(function (error) {
                    alert("Operation Failed. Reason: " + (error.message || "Unknown Error"));
                }).always(function () {
                    button.removeClass("disabled");
                });
            }
        }
    });

    $(".opportunity_outer .opportunity_add .submit").click(function () {
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
            }).done(function (result) {
                alert("Success!");
                clearForm(button.parent());
            }).fail(function (error) {
                alert("Operation Failed. Reason: " + (error.message || "Unknown Error"));
            }).always(function () {
                button.removeClass("disabled");
            });
        }
    });
});