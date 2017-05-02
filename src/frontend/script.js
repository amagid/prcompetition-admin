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
        clearForm($(".modal_content"));
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
        form.attr("data-keys", JSON.stringify(data.keys));
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
    });

    function getEventString(entity) {
        return 'Title: ' + entity.event + '\n' +
            'Semester: ' + entity.semester[0].toUpperCase() + entity.semester.substring(1) + '\n' +
            'Year: ' + entity.year;
    }

    function extractEventData(eventString) {
        var eventArray = eventString.split('\n');
        return {
            event: eventArray[0].substring(7),
            semester: eventArray[1].substring(10),
            year: eventArray[2].substring(6),
        };
    }

    function formatDateString(dateString) {
        var date = new Date(dateString);
        return date.getMonth() + 1 + '/' + date.getDate() + '/' + date.getFullYear();
    }

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
                        '<div class="cell rescore_container"><i class="fa fa-calculator" id="rescore" title="Recalculate Score"></i></div>' +
                        '<div class="cell edit_container"><i class="fa fa-pencil-square-o" id="edit" title="Edit Participant"></i></div>' +
                        '<div class="cell trash_container"><i class="fa fa-trash-o" id="delete" title="Delete Participant"></i></div>' +
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
                active: active,
                keys: {
                    caseid: caseid
                }
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



    $(".load_opportunities").click(loadOpportunities);
    //Data Loaders
    function loadOpportunities() {
        $.get('/api/opportunities/')
            .done(function (opportunities) {
                var frag = $(document.createDocumentFragment('<div class="rows">'));
                for (var i = 0; i < opportunities.length; i++) {
                    frag.append('<div class="opportunity row">' +
                        '<div class="cell opportunity" title="' + opportunities[i].opportunity + '">' + opportunities[i].opportunity + '</div>' +
                        '<div class="cell value" title="' + opportunities[i].value + '">' + opportunities[i].value + '</div>' +
                        '<div class="cell date" title="' + formatDateString(opportunities[i].date) + '">' + formatDateString(opportunities[i].date) + '</div>' +
                        '<div class="cell description" title="' + opportunities[i].description + '">' + opportunities[i].description + '</div>' +
                        '<div class="cell event" title="' + getEventString(opportunities[i]) + '">' + opportunities[i].event + '</div>' +
                        '<div class="cell attendance_container"><i class="fa fa-bar-chart" id="attendance" title="Show Attendance Data"></i></div>' +
                        '<div class="cell edit_container"><i class="fa fa-pencil-square-o" id="edit" title="Edit Opportunity"></i></div>' +
                        '<div class="cell trash_container"><i class="fa fa-trash-o" id="delete" title="Delete Opportunity"></i></div>' +
                        '</div>');
                }
                $(".table.opportunities_output").html('<div class="row bold header">' +
                    '<div class="cell opportunity">Name</div>' +
                    '<div class="cell value">Value</div>' +
                    '<div class="cell date">Date</div>' +
                    '<div class="cell description">Description</div>' +
                    '<div class="cell event">Event</div></div>');
                $(".table.opportunities_output").append(frag);
            }).fail(function (error) {
                $(".table.opportunities_output").text("Failed to load opportunities.");
            });
    }

    $(".opportunities_output").on('click', '#attendance', function () {})
        .on('click', '#edit', function () {
            var opp = $(this).parent().parent();
            var opportunity = opp.find(".opportunity").text();
            var value = opp.find(".value").text();
            var date = opp.find(".date").text();
            var description = opp.find(".description").text();
            var eventData = extractEventData(opp.find(".event").attr("title"));
            openModalFormWithData("opportunity_add", {
                opportunity: opportunity,
                value: value,
                date: date,
                synopsis: description,
                event: eventData.event,
                semester: eventData.semester,
                year: eventData.year,
                keys: {
                    opportunity: opportunity,
                    event: eventData.event,
                    semester: eventData.semester,
                    year: eventData.year
                }
            });
        })
        .on('click', '#delete', function () {
            var opp = $(this).parent().parent();
            var opportunity = opp.find(".opportunity").text();
            var eventData = extractEventData(opp.find(".event").attr("title"));
            if (confirm("Are you sure you want to delete " + opportunity + "?")) {
                $.ajax({
                        url: '/api/opportunities/' + opportunity,
                        method: 'DELETE',
                        data: {
                            opportunity: opportunity,
                            event: eventData.event,
                            semester: eventData.semester,
                            year: eventData.year
                        }
                    })
                    .done(loadOpportunities)
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
            var keys = $(this).parent().data("keys");

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
                    keys: keys,
                    updates: {
                        name: name,
                        caseid: caseid,
                        points: points,
                        active: active
                    }
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

    $(".opportunity_add .submit").click(function () {
        if (!$(this).hasClass("disabled")) {
            $(this).addClass("disabled");
            var opportunity = $(this).parent().find("#opportunity").val();
            var date = (new Date($(this).parent().find("#date").val())).toISOString().split('Z')[0];
            var value = $(this).parent().find("#value").val();
            var event = $(this).parent().find("#event").val();
            var description = $(this).parent().find("#synopsis").val();
            var semester = $(this).parent().find("#semester").val();
            var year = $(this).parent().find("#year").val();
            var keys = $(this).parent().data("keys");

            var button = $(this);

            if ($(this).parent(".opportunity_add").hasClass("edit")) {

                $.post("/api/opportunities/" + encodeURIComponent(opportunity), {
                    keyOpp: keys.opportunity,
                    keyEvent: keys.event,
                    keySemester: keys.semester,
                    keyYear: keys.year,
                    opp: opportunity,
                    date: date,
                    value: parseInt(value),
                    event: event,
                    desc: description,
                    sem: semester.toLowerCase(),
                    year: parseInt(year)
                }).done(function (result) {
                    alert("Success!");
                    clearForm(button.parent());
                }).fail(function (error) {
                    alert("Operation Failed. Reason: " + (error.message || "Unknown Error"));
                }).always(function () {
                    button.removeClass("disabled");
                });

            } else {

                $.post("/api/opportunities", {
                    opp: opportunity,
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
        }
    });
});