function showMobileWarning() {
    if($(window).width() <= 760) {
        $('.admin-mobile-warning').removeClass('d-none');
        $('.admin-page').remove();
    }
}

function homePageReady() {
    $('.book-contents').width($('.bookName').width());
    $('.bookName').click(function(event) {
        $(this).siblings('.book-contents').removeClass('d-none').fadeIn("slow");
    });
    $('.bookName').mouseleave(function(event) {
        $(this).siblings('.book-contents').fadeOut("slow");
    });

    $('.book-now').click(function(event) {
        var bookId = $(this).siblings('.bookId').val();
        var bookName = $(this).siblings('.bookName').val();
        $('#bookId').val(bookId);
        $('#bookName').text(bookName);
    });

    $('#preBook').click(function() {
        var bookId = $(this).siblings('#bookId').val();
        window.location.href = '/book/block/' + bookId;
    });

    $('.page-item').click(function(event) {
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
        filterBooks();
    });

    $('.onlyForLoggedIn').addClass('d-none');
    $('.admin-main').removeClass('col-lg-10 col-md-10 col-sm-9');
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

        var value = $(this).val().toLowerCase();
        $("#book-list .book-entries").filter(function() {
            if($(this).find('.book-filter').text().toLowerCase().indexOf(value) > -1) {
                $(this).removeClass('filter-hide');
            } else {
                $(this).addClass('filter-hide');
            }
        });
    });

    $(".go-icon").click(function(){
      $(".search-form").submit();
    });

}

function profilePageReady() {
    $('.onlyForLoggedIn').addClass('d-none');
    $('.admin-main').removeClass('col-lg-10 col-md-10 col-sm-9');
    $('#chevron-toggle').click(function(event) {
        $(this).find(".bi").toggleClass("d-none");
    });
    $('#user-chevron-toggle').click(function(event) {
        $(this).find(".bi").toggleClass("d-none");
        $('#username-heading').fadeToggle("slow");
    });

    $('.renew-btn').click(function() {
        var bookUserId = $(this).siblings('.bookUserId').val();
        $('#renewBook').attr('href', '/book/renew/' + bookUserId);
    });

    $('.cancel-btn').click(function() {
        var bookUserId = $(this).siblings('.bookUserId').val();
        $('#cancelBook').attr('href', '/book/cancel/' + bookUserId);
    });

    $('.progress-bar').each(function() {
        var allottedDate = $(this).siblings('.allotted-date').val();
        var dueDate = $(this).siblings('.due-date').val();
        var today = new Date();
        today.setHours(0, 0, 0, 0);
        var difference = today.getTime() - new Date(allottedDate).getTime();
        var oneDay = 1000 * 60 * 60 * 24;
        var difference = (today.getTime() - new Date(allottedDate).getTime()) / oneDay;
        var total = (new Date(dueDate).getTime() - new Date(allottedDate).getTime()) / oneDay;
        total = total < 1 ? 1 : total;
        var percentage = (difference / total) * 100;
        $(this).css('width', percentage + '%');

        if(percentage < 33) {
            $(this).addClass('blue');
        } else if(percentage < 66) {
            $(this).addClass('yellow');
        } else {
            $(this).addClass('red');
            $(this).parent().parent().siblings('.renew-outer').removeClass('d-none');
        }
    });

    $('#profileEdit').click(function(event) {
        $(this).addClass('d-none');
        $('#profileSave').removeClass('d-none');
        $('#cancelEdit').removeClass('d-none');
        $('.user-field').addClass('d-none');
        $('.user-input').removeClass('d-none');
    });

    $('#cancelEdit').click(function(event) {
        $(this).addClass('d-none');
        $('#profileSave').addClass('d-none');
        $('#profileEdit').removeClass('d-none');
        $('.user-field').removeClass('d-none');
        $('.user-input').addClass('d-none');
    });

    $('#passwordEditCheck').change(function() {
        if(this.checked) {
            $('.passwordEdit').removeClass('d-none');
            $('#input-oldpassword').attr("disabled", false);
            $('#input-password').attr("disabled", false);
        } else {
            $('.passwordEdit').addClass('d-none');
            $('#input-oldpassword').attr("disabled", true);
            $('#input-password').attr("disabled", true);
        }
    });
}

$.validator.methods.localDate = function( value, element ) {
    return this.optional( element ) || /[0-9]{2}\/[0-9]{2}\/[0-9]{4}/.test( value );
}

function prepareBookAddForm() {

    $("#purchased").datepicker({
        changeMonth: true,
        changeYear: true
    });
}

function prepareBookEditForm() {
    $( "#bookEditPurchased" ).datepicker({
        changeMonth: true,
        changeYear: true
    });
}

function booksListPageReady() {
    $("#book").addClass("active");
    showMobileWarning();

    $("#filer-books").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#bookList tr.table-accordion").filter(function() {
            if($(this).find('.book-filter').text().toLowerCase().indexOf(value) > -1) {
                $(this).removeClass('filter-hide');
            } else {
                $(this).addClass('filter-hide');
            }
        });
    });

    prepareBookAddForm();
    prepareBookEditForm();

    $.get( "/author/all", function(authors) {
        var authorSuggestions = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            local: authors
        });

        $('#authorName,#authorNameEdit').typeahead({
          hint: true,
          highlight: true,
          minLength: 1
        },
        {
          name: 'authors',
          display: 'name',
          source: authorSuggestions.ttAdapter()
        });
    });

    $('#authorName').on('typeahead:selected', function(evt, item) {
        $('#authorId').val(item.id);
        $('#authorPenName').val(item.penName);
    });

    $('#authorNameEdit').on('typeahead:selected', function(evt, item) {
        $('#authorIdEdit').val(item.id);
        $('#authorPenNameEdit').val(item.penName);
    });

    $.get( "/book/all", function(books) {
        var bookSuggestions = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            local: books
        });

        $('#name,#nameEdit').typeahead({
          hint: true,
          highlight: true,
          minLength: 1
        },
        {
          name: 'books',
          display: 'name',
          source: bookSuggestions.ttAdapter()
        });
    });

    $('#name').on('typeahead:selected', function(evt, item) {
        $('#bookDetailId').val(item.id);
        $('#category').val(item.category);
        $('#language').val(item.language);
        $('#publication').val(item.publication);
    });

    $('#nameEdit').on('typeahead:selected', function(evt, item) {
        $('#bookDetailIdEdit').val(item.id);
        $('#categoryEdit').val(item.category);
        $('#languageEdit').val(item.language);
        $('#publicationEdit').val(item.publication);
    });

    $(".book-edit").click(function(event) {
        $("#bookIdEdit").val($(event.target).siblings(".bookEditId").val());
        $("#bookDetailIdEdit").val($(event.target).siblings(".bookDetailEditId").val());
        $("#nameEdit").val($(event.target).siblings(".bookEditName").val());
        $("#authorNameEdit").val($(event.target).siblings(".bookEditAuthor").val());
        $("#authorIdEdit").val($(event.target).siblings(".bookEditAuthorId").val());
        $("#authorPenNameEdit").val($(event.target).siblings(".bookEditAuthorPenName").val());
        $("#categoryEdit").val($(event.target).siblings(".bookEditCategory").val());
        $("#languageEdit").val($(event.target).siblings(".bookEditLanguage").val());
        $("#publicationEdit").val($(event.target).siblings(".bookEditPublication").val());
        $("#rackEdit").val($(event.target).siblings(".bookEditRack").val());
        $("#contributedByEdit").val($(event.target).siblings(".bookEditContributed").val());
        $("#purchasedDateEdit").val($(event.target).siblings(".bookEditPurchased").val());
        $("#priceEdit").val($(event.target).siblings(".bookEditPrice").val());
    });
}

function authorsListPageReady() {
    $("#author").addClass("active");
    showMobileWarning();

    $("#filter-authors").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#authorsList tr").filter(function() {
            if($(this).find('.author-filter').text().toLowerCase().indexOf(value) > -1) {
                $(this).removeClass('filter-hide');
            } else {
                $(this).addClass('filter-hide');
            }
        });
    });

    $(".author-edit").click(function(event) {
        $("#editName").val($(event.target).siblings(".authorEditName").val());
        $("#editPenName").val($(event.target).siblings(".authorEditPenName").val());
        $("#editId").val($(event.target).siblings(".authorEditId").val());
    });

    $.get( "/author/all", function(data) {
        var authors = data;
        var authorSuggestions = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            local: authors
        });

        $('.typeahead').typeahead({
          hint: true,
          highlight: true,
          minLength: 1
        },
        {
          name: 'authors',
          display: 'name',
          source: authorSuggestions.ttAdapter()
        });
    });

    $('.typeahead').on('typeahead:selected', function(evt, item) {
        $('#editId').val(item.id);
        $('#editPenName').val(item.penName);
    });
}

function usersListPageReady() {
    $("#user").addClass("active");
    showMobileWarning();

    $("#filter-users").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#usersList tr").filter(function() {
            if($(this).find('.user-filter').text().toLowerCase().indexOf(value) > -1) {
                $(this).removeClass('filter-hide');
            } else {
                $(this).addClass('filter-hide');
            }
        });
    });
}

function checkBookId() {
    var actualBookId = $("#actualBookId").val();
    var bookId = $("#bookId").val();
    if (actualBookId != bookId) {
        $("#bookIdError").removeClass("hide-element");
        $("#approveBook").attr("disabled", true);
    } else {
        $("#bookIdError").addClass("hide-element");
        $("#approveBook").attr("disabled", false);
    }
}

function adminDashboardReady() {
    $("#dashboard").addClass("active");
    showMobileWarning();

    if ($('#allottedBookModalBtn').length) {
        $('#allottedBookModalBtn').click();
    }

    $('.bookApproveLink').click(function() {
        var bookApproveId = $(this).siblings('.bookApproveId').val();
        $('#bookUserId').val(bookApproveId);
        $('#bookName').text($(this).siblings('.bookName').val());
        $('#userName').val($(this).siblings('.userName').val());
        $('#actualBookId').val($(this).siblings('.bookId').val());

        var status = $(this).siblings('.status').val();
        var approveUrl = "/approve/bookuser/" + bookApproveId;
        if (status.includes("RENEW")) {
            approveUrl = "/renew" + approveUrl;
            $("#bookId").attr('disabled', true);
        }
        $("#bookApprovalForm").attr('action', '/admin' + approveUrl);

        var imgSrc = "";
        if ($(this).siblings('.bookCover').val() != undefined) {
            imgSrc = "http://covers.openlibrary.org/b/isbn/" + $(this).siblings('.bookCover').val() + "-M.jpg";
        } else {
            imgSrc = "../img/book-cover.png";
        }
        $('.book-cover-div').css("background-image", 'url(' + imgSrc+ ')');
    });
    $("#bookId").change(checkBookId);

    $('.bookDeclineLink').click(function() {
        var bookApproveId = $(this).siblings('.bookApproveId').val();
        $('#bookUserIdDecline').val(bookApproveId);
        $('#bookNameDecline').text($(this).siblings('.bookName').val());
        $('#userNameDecline').val($(this).siblings('.userName').val());
        $('#bookIdDecline').val($(this).siblings('.bookId').val());

        var status = $(this).siblings('.status').val();
        var declineUrl = "/decline/bookuser/" + bookApproveId;
        if (status.includes("RENEW")) {
            declineUrl = "/renew" + declineUrl;
        }
        $("#bookDeclineForm").attr('action', '/admin' + declineUrl);
    });

    $('.user-approve').click(function() {
        var userId = $(this).siblings('.userId').val();
        $('#userApprovalForm').attr('action', '/admin/approve/user/'+ userId);
    });

    $('.user-decline').click(function() {
        var userId = $(this).siblings('.userId').val();
        $('#userDeclineForm').attr('action', '/admin/decline/user/'+ userId);
    });
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

$(document).ready(function() {
    var currentPage = $('#pageTracker').val();
    if ($('#messageModal').length) {
        $('#messageModalBtn').click();
    }

    if (currentPage == 'home') {
        homePageReady();
    } else if (currentPage == 'profile') {
        profilePageReady();
    } else if (currentPage == 'adminDashboard') {
        adminDashboardReady();
    } else if (currentPage == 'booksList') {
        booksListPageReady();
    } else if (currentPage == 'authorsList') {
        authorsListPageReady();
    } else if (currentPage == 'usersList') {
        usersListPageReady();
    }
});
