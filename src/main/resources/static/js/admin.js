function getTableData(table) {
    var data = [];
    var target = $('tr').not('thead tr');
    target.each(function (rowIndex, r) {
        var cols = [];
        $(this).find('th,td').each(function (colIndex, c) {
            cols.push(c.textContent);
        });
        data.push(cols);
    });
    return data;
}

function preparePagination() {
    var template = $.templates("#bookListTemplate");
    var pageCount = $('#pageCount').val();
    var minimumPages = (pageCount < 10) ? pageCount : 10;
    for (i = 2; i <= minimumPages; i++) {
        $('.page-item-number:last').after('<li class="page-item page-item-number"><a class="page-link">' + i + '</a></li>');
    }

    $('.page-item-number').click(function(event) {
        $("#book-list").html("");
        var pageUrl = '/book/pages?page=' + (parseInt($(this).find('.page-link').text()) - 1) + '&size=12';
        $.get(pageUrl, function(books) {
            books.forEach(function(book) {
                var html = template.render(book);
                $("#book-list").append(html);
            });
        });
    });
}

function homePageReady() {
    redirectToLogin();
    preparePagination();
    filterBooks();

    $('.book-now').click(function(event) {
        var bookId = $(this).siblings('.bookId').val();
        var bookName = $(this).siblings('.bookName').val();
        $('#bookId').val(bookId);
        $('#bookName').text(bookName);
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
            if($(this).find('.book-filer').text().toLowerCase().indexOf(value) > -1) {
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

function filterBooks() {
    // How many books to display at a time
    var n = 60;

    var total = $('.book-entries').length;
    var active = $('.page-item.active').find('.page-link').text();
    var end = (active * n);
    var start = end - n;

    $('.icon-boxes .book-entries').each(function(index) {
        if (index >= start && index < end) {
            $(this).removeClass('hide-element');
        } else {
            $(this).addClass('hide-element');
        }
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
    redirectToLogin();
    $("#book").addClass("active");

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
    redirectToLogin();
    $("#author").addClass("active");

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
    })
}

function authorDetailPageReady() {
    $("#author").addClass("active");
}

function usersListPageReady() {
    redirectToLogin();
    $("#user").addClass("active");

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
    var currentPage = $('#pageTracker').val();

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
    } else if (currentPage == 'authorDetail') {
        authorDetailPageReady();
    } else if (currentPage == 'usersList') {
        usersListPageReady();
    }

//    checkLoggedInStatus();
});
