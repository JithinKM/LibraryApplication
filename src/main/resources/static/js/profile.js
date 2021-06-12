function profilePageReady() {
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

$(document).ready(function() {
    var currentPage = $('#pageTracker').val();
    if ($('#messageModal').length) {
        $('#messageModalBtn').click();
    }

    if (currentPage == 'profile') {
        profilePageReady();
    }
});
