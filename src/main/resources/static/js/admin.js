//function loginPageSubmit() {
//    showLoadingAnimation();
//    $.ajax({
//        contentType: 'application/json',
//        dataType: 'json',
//        type: 'POST',
//        url: '/user/authenticate',
//        data: JSON.stringify({
//            username: $('#username').val(),
//            password: $('#password').val()
//        }),
//        success: function(data) {
//            hideLoadingAnimation();
//            if (data.status == "SUCCESS") {
//                console.log(data);
//                sessionStorage.setItem("token", data.jwttoken);
//                window.location = data.message;
//            } else {
//                processAdminErrorMessage(data);
//            }
//        },
//        error: function(data) {
//            hideLoadingAnimation();
//            processAdminErrorMessage(JSON.parse(data.responseText));
//        }
//    });
//}

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
    redirectToLogin();

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

function addBook() {
        showLoadingAnimation();
        $.ajax({
            contentType: 'application/json',
            dataType: 'json',
            type: 'POST',
            url: '/book/add',
            data: JSON.stringify({
                id: $('#bookId').val(),
                name: $('#name').val(),
                author: {
                    id: $('#authorId').val(),
                    name: $('#authorName').val(),
                    pen_name: $('#authorPenName').val()
                },
                category: $('#category').val(),
                language: $('#language').val(),
                publication: $('#publication').val(),
                rack: $('#rack').val(),
                purchased: new Date($('#purchased').val()),
                price: $('#price').val()
            }),
            success: function(data) {
                hideLoadingAnimation();
                if (data.status == "SUCCESS") {
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

function editBook() {
        showLoadingAnimation();
        $.ajax({
            contentType: 'application/json',
            dataType: 'json',
            type: 'POST',
            url: '/book/edit',
            data: JSON.stringify({
                id: $('#bookEditId').val(),
                name: $('#bookEditName').val(),
                author: {
                    id: $('#bookEditAuthorId').val(),
                    name: $('#bookEditAuthor').val(),
                    pen_name: $('#bookEditAuthorPenName').val()
                },
                category: $('#bookEditCategory').val(),
                language: $('#bookEditLanguage').val(),
                publication: $('#bookEditPublication').val(),
                rack: $('#bookEditRack').val(),
                purchased: new Date($('#bookEditPurchased').val()),
                price: $('#bookEditPrice').val()
            }),
            success: function(data) {
                hideLoadingAnimation();
                if (data.status == "SUCCESS") {
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

$.validator.methods.localDate = function( value, element ) {
    return this.optional( element ) || /[0-9]{2}\/[0-9]{2}\/[0-9]{4}/.test( value );
}

function prepareBookAddForm(authors) {

    $( "#purchased" ).datepicker({
        changeMonth: true,
        changeYear: true
    });

    $('#bookAddForm .typeahead').typeahead({
        highlight: true
    },
    {
        display: 'value',
        source: authors.ttAdapter()
    });

    $('#bookAddForm').on('typeahead:selected', function (e, data) {
        $("#authorId").val(data.id);
        $("#authorName").val(data.value);
        $("#authorPenName").val(data.pen_name);
    });

    var validator = $("#bookAddForm").validate({
        rules: {
            "bookId": {
                required: true
            },
            "name": {
                required: true
            },
            "author": {
                required: true
            },
            "category": {
                required: true
            },
            "language": {
                required: true
            },
            "rack": {
                required: true
            },
            "purchased": {
                required: true,
                localDate: true
            },
            "price": {
                required: true,
                number: true
            }
        },
        submitHandler: function() {
            addBook();
        }
    });
}

function prepareBookEditForm(authors) {

    $( "#bookEditPurchased" ).datepicker({
        changeMonth: true,
        changeYear: true
    });

    $('#bookEditForm .typeahead').typeahead({
        highlight: true
    },
    {
        display: 'value',
        source: authors.ttAdapter()
    });

    $('#bookEditForm').on('typeahead:selected', function (e, data) {
        $("#authorEditId").val(data.id);
        $("#authorEditName").val(data.value);
        $("#authorEditPenName").val(data.pen_name);
    });

    var validator = $("#bookEditForm").validate({
        rules: {
            "bookId": {
                required: true
            },
            "name": {
                required: true
            },
            "author": {
                required: true
            },
            "category": {
                required: true
            },
            "language": {
                required: true
            },
            "rack": {
                required: true
            },
            "purchased": {
                required: true,
                localDate: true
            },
            "price": {
                required: true,
                number: true
            }
        },
        submitHandler: function() {
            editBook();
        }
    });
}

function booksListPageReady() {
    redirectToLogin();
    $("#book").addClass("active");

    var authors = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: '/author/all/%QUERY',
            wildcard: '%QUERY',
            transform: response => $.map(response, author => ({
              id: author.id,
              value: author.name,
              pen_name: author.penName
            }))
        }
    });

    authors.initialize();
    prepareBookAddForm(authors);
    prepareBookEditForm(authors);

    $(".book-edit").click(function(event) {
        $("#bookEditId").val($(event.target).siblings(".bookEditId").val());
        $("#bookEditName").val($(event.target).siblings(".bookEditName").val());
        $("#bookEditAuthor").val($(event.target).siblings(".bookEditAuthor").val());
        $("#bookEditAuthorId").val($(event.target).siblings(".bookEditAuthorId").val());
        $("#bookEditAuthorPenName").val($(event.target).siblings(".bookEditAuthorPenName").val());
        $("#bookEditCategory").val($(event.target).siblings(".bookEditCategory").val());
        $("#bookEditLanguage").val($(event.target).siblings(".bookEditLanguage").val());
        $("#bookEditPublication").val($(event.target).siblings(".bookEditPublication").val());
        $("#bookEditRack").val($(event.target).siblings(".bookEditRack").val());
        $("#bookEditPurchased").val($(event.target).siblings(".bookEditPurchased").val());
        $("#bookEditPrice").val($(event.target).siblings(".bookEditPrice").val());
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
    redirectToLogin();
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

function authorDetailPageReady() {
    $("#author").addClass("active");
}

function usersListPageReady() {
    redirectToLogin();
    $("#user").addClass("active");
}

function adminDashboardReady() {
    redirectToLogin();
    $("#dashboard").addClass("active");
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
   var windowHeight = (getWindowHeight - 300) +"px";
   $('main').css("min-height",windowHeight);
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

function processAdminErrorMessage(errorData) {
    alert(JSON.parse(errorData));
    console.log(JSON.parse(errorData));
}
function redirectToLogin() {
    var token = sessionStorage.getItem("JSESSIONID");
//    if (!token) {
//        window.location = "/user/login";
//    }
}

$(document).ready(function() {
    setPageHeight();
    checkLoggedInStatus();
    var currentPage = $('#pageTracker').val();

    if (currentPage == 'home') {
        homePageReady();
    } else if (currentPage == 'adminLogin') {
        adminLoginReady();
    } else if (currentPage == 'adminDashboard') {
        adminDashboardReady();
    } else if (currentPage == 'booksList') {
        booksListPageReady();
    } else if (currentPage == 'authorsList') {
        authorsListPageReady();
    } else if (currentPage == 'authorDetail') {
        authorDetailPageReady();
    } else if (currentPage == 'usersList') {
        usersListPageReady();
    }
});
