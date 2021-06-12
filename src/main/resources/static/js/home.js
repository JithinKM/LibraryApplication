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

    $('.admin-main').removeClass('col-lg-10 col-md-10 col-sm-9');
    $("#search").focus(function() {
      $(".search-box").addClass("border-searching");
    });
    $("#search").blur(function() {
      $(".search-box").removeClass("border-searching");
    });
}

$(document).ready(function() {
    var currentPage = $('#pageTracker').val();
    if ($('#messageModal').length) {
        $('#messageModalBtn').click();
    }

    if (currentPage == 'home') {
        homePageReady();
    }
});
