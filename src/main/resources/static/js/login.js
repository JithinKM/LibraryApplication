$(document).ready(function() {
    if($(window).width() > 765) {
        $('#signupDiv').addClass('d-flex');
        $('#signupDiv').removeClass('d-none');
        var height = $('#signupDiv').height();
        $('#signupDiv').removeClass('d-flex');
        $('#signupDiv').addClass('d-none');
        $('#loginDiv').height(height);
    }

    $('#signupDiv').removeClass('d-flex');
    $('#signupDiv').addClass('d-none');

    $("#loginLink").click(function() {
        $('#signupDiv').removeClass('d-flex');
        $('#signupDiv').addClass('d-none');
        $('#loginDiv').removeClass('d-none');
        $('#loginDiv').addClass('d-flex');
    });

    $("#signupLink").click(function() {
        $('#loginDiv').removeClass('d-flex');
        $('#loginDiv').addClass('d-none');
        $('#signupDiv').removeClass('d-none');
        $('#signupDiv').addClass('d-flex');
    });

    $(".form-radio input[name='type']").click(function() {
        if($(".form-radio input[name='type']:checked").val() == "TEACHER") {
            $('#standard-select, #division-select').addClass('hide-element');
            $('#standard').val(0);
        } else {
            $('#standard-select, #division-select').removeClass('hide-element');
        }
    });

    function checkPasswordMatch() {
        var password = $("#password").val();
        var confirmPassword = $("#confirmPassword").val();
        if (password != confirmPassword) {
            $("#passwordMatchError").removeClass("hide-element");
            $("#signup-btn").attr("disabled", true);
        } else {
            $("#passwordMatchError").addClass("hide-element");
            $("#signup-btn").attr("disabled", false);
        }
    }

    $("#confirmPassword").keyup(checkPasswordMatch);

    function buildUsername() {
        var firstname = $('#firstname').val().trim().toLowerCase();
        var lastname = $('#lastname').val().trim().toLowerCase();
        var batch = new Date().getFullYear() + (10 - $('#standard').val());
        var userName = "";
        if($(".form-radio input[name='type']:checked").val() == "TEACHER"
            && firstname !== "" && lastname != "") {
            userName = firstname + lastname;

        } else if ($(".form-radio input[name='type']:checked").val() == "STUDENT"
            && firstname !== "" && lastname != "" && $('#standard').val() != 0) {
            userName = firstname + lastname + '_b' + batch;
        }
        $('#username').val(userName.replace(/\s/g, ""));
    };

    $(".form-radio input[name='type']").click(buildUsername);
    $('#firstname').change(buildUsername);
    $('#lastname').change(buildUsername);
    $("#standard").change(buildUsername);
});
