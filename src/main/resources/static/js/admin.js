function loginPageSubmit() {
    showLoadingAnimation();
    $.ajax({
        contentType: 'application/json',
        dataType: 'json',
        type: 'POST',
        url: '/user/authenticate',
        data: JSON.stringify({
            username: $('#username').val(),
            password: $('#password').val()
        }),
        success: function(data) {
            hideLoadingAnimation();
            if (data.status == "SUCCESS") {
                console.log(data);
                sessionStorage.setItem("token", data.jwttoken);
                window.location = data.message;
            } else {
                processAdminErrorMessage(data);
            }
        },
        error: function(data) {
            hideLoadingAnimation();
            processAdminErrorMessage(JSON.parse(data.responseText));
        }
    });
}

function adminLoginReady() {
    var validator = $("#login-form").validate({
        rules: {
            "username": {
                required: true,
                email: true
            },
            "password": {
                required: true,
                minlength: 5,
                maxlength: 50
            }
        },
        submitHandler: function() {
            loginPageSubmit();
        }

    });

    $("#adminLoginEmail").focus();
}

function homePageReady() {
    var token = sessionStorage.getItem("token");
    if (!token) {
        window.location = "/user/login";
    }

    $("#search").focus(function() {
      $(".search-box").addClass("border-searching");
    });
    $("#search").blur(function() {
      $(".search-box").removeClass("border-searching");
    });
    $("#search").keyup(function() {
        if($(this).val().length > 0) {
          $(".go-icon").addClass("go-in");
        }
        else {
          $(".go-icon").removeClass("go-in");
        }
    });
    $(".go-icon").click(function(){
      $(".search-form").submit();
    });
}

function booksListPageReady() {
    $("#book").addClass("active");

    var validator = $("#bookAddForm").validate({
        rules: {
            "name": {
                required: true
            },
            "penName": {
                required: true
            }
        },
        submitHandler: function() {
            addBook();
        }
    });

    var validator = $("#bookEditForm").validate({
        rules: {
            "editName": {
                required: true
            },
            "editPenName": {
                required: true
            }
        },
        submitHandler: function() {
            editBook();
        }
    });

    $(".book-edit").click(function(event) {
        $("#editName").val($(event.target).siblings(".bookEditName").val());
        $("#editPenName").val($(event.target).siblings(".authorEditPenName").val());
        $("#editId").val($(event.target).siblings(".authorEditId").val());
    });
}

function addAuthor() {
        showLoadingAnimation();
        $.ajax({
            contentType: 'application/json',
            dataType: 'json',
            type: 'POST',
            url: '/author/add',
            data: JSON.stringify({
                name: $('#name').val(),
                penName: $('#penName').val()
            }),
            success: function(data) {
                hideLoadingAnimation();
                if (data.status == "SUCCESS") {
                    console.log(data);
                    window.location = data.message;
                } else {
                    processAdminErrorMessage(data);
                }
            },
            error: function(data) {
                hideLoadingAnimation();
                processAdminErrorMessage(JSON.parse(data.responseText));
            }
        });
}

function editAuthor() {
    showLoadingAnimation();
    $.ajax({
        contentType: 'application/json',
        dataType: 'json',
        type: 'POST',
        url: '/author/edit/',
        data: JSON.stringify({
            id: $('#editId').val(),
            name: $('#editName').val(),
            penName: $('#editPenName').val()
        }),
        success: function(data) {
            hideLoadingAnimation();
            if (data.status == "SUCCESS") {
                console.log(data);
                window.location = data.message;
            } else {
                processAdminErrorMessage(data);
            }
        },
        error: function(data) {
            hideLoadingAnimation();
            processAdminErrorMessage(JSON.parse(data.responseText));
        }
    });
}

function authorsListPageReady() {
    $("#author").addClass("active");

    var validator = $("#authorAddForm").validate({
        rules: {
            "name": {
                required: true
            },
            "penName": {
                required: true
            }
        },
        submitHandler: function() {
            addAuthor();
        }
    });

    var validator = $("#authorEditForm").validate({
        rules: {
            "editName": {
                required: true
            },
            "editPenName": {
                required: true
            }
        },
        submitHandler: function() {
            editAuthor();
        }
    });

    $(".author-edit").click(function(event) {
        $("#editName").val($(event.target).siblings(".authorEditName").val());
        $("#editPenName").val($(event.target).siblings(".authorEditPenName").val());
        $("#editId").val($(event.target).siblings(".authorEditId").val());
    });
}

function usersListPageReady() {
    $("#user").addClass("active");
}

function showLoadingAnimation() {
    $("#pageloaddiv").css("display", "block");
}

function hideLoadingAnimation() {
    $("#pageloaddiv").css("display", "none");
}

function processAdminErrorMessage(response) {
    if (typeof(response.errors) != "undefined") {
        showAdminPageAlert(response.errors[0]);
    } else if (response.status && response.status == "error") {
        showAdminPageAlert(response.message);
    }
}

function setPageHeight() {
   var getWindowHeight = $(document).height();
   var windowHeight = (getWindowHeight - 476) +"px";
   $('.admin-page').css("min-height",windowHeight);
}

function checkLoggedInStatus() {
    var token = sessionStorage.getItem("token");
    if (token) {
        $('#loggedIn').val("true");
        toggleSignupAndLogin();
    }
}

function toggleSignupAndLogin() {
    $('#signup').addClass('d-none');
    $('#login').addClass('d-none');
    $('.onlyForLoggedIn').removeClass('d-none');
    $('#logoutLink').click(function() {
        console.log("logout clicked");
        $.ajax({
            contentType: 'application/json',
            dataType: 'json',
            type: 'POST',
            headers: {
                "Authorization": sessionStorage.getItem("token")
            },
            url: '/user/logout',
            success: function(data) {
                hideLoadingAnimation();
                if (data.status == "SUCCESS") {
                    console.log(data);
                    sessionStorage.removeItem("token");
                    window.location = data.message;
                } else {
                    processAdminErrorMessage(data);
                }
            },
            error: function(data) {
                hideLoadingAnimation();
                processAdminErrorMessage(JSON.parse(data.responseText));
            }
        });
    });
}

$(document).ready(function() {
    setPageHeight();
    checkLoggedInStatus();
    var currentPage = $('#pageTracker').val();

    if (currentPage == 'home') {
        homePageReady();
    } else if (currentPage == 'adminLogin') {
        adminLoginReady();
    } else if (currentPage == 'booksList') {
        booksListPageReady();
    } else if (currentPage == 'authorsList') {
        authorsListPageReady();
    } else if (currentPage == 'usersList') {
        usersListPageReady();
    }
});
