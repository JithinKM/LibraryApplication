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

$(document).ready(function() {
    var currentPage = $('#pageTracker').val();
    if ($('#messageModal').length) {
        $('#messageModalBtn').click();
    }

    if (currentPage == 'adminDashboard') {
        adminDashboardReady();
    } else if (currentPage == 'booksList') {
        booksListPageReady();
    } else if (currentPage == 'authorsList') {
        authorsListPageReady();
    } else if (currentPage == 'usersList') {
        usersListPageReady();
    }
});
