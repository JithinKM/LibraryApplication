<@admin_layout title="Dashboard">
<section class="admin-page">
    <div class="container-fluid main-container">
        <div class="row main-row">
            <#include "layout/sidebar.ftlh">
            <!-- Main missing here -->
            <div class="col-lg-10 col-md-10 col-sm-9 col-12 admin-main">
                <div class="container main-content text-center">
                    <div id="content-wrapper" class="d-flex flex-column">
                        <div id="content">
                            <div class="dashboard-content">
                                <div class="row main-row">
                                    <div class="col-lg-4">
                                        <div class="col-12 assign-return-div mb-4">
                                            <div class="card mb-4">
                                                <div class="card-header">
                                                    <h6 class="font-weight-bold"><i class="bi bi-box-arrow-right"></i>&nbsp;Assign Book</h6>
                                                </div>
                                                <div class="card-body d-flex justify-content-center">
                                                    <form role="form" action="/admin/book/assign" method="GET">
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" name="bookId" placeholder="Enter book id" autocomplete="off" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" name="userId" placeholder="Enter username" autocomplete="off" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <button class="btn btn-primary btn-block" type="submit" id="assignBook">Assign</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8 mb-4">
                                        <div class="card mb-4">
                                            <div class="card-header">
                                                <h6 class="font-weight-bold"><i class="bi bi-calendar3"></i>&nbsp;Book Overdue</h6>
                                            </div>
                                            <div class="card-body overflow-auto overdue-body">
                                                <#if overduebooks?has_content>
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Book Id</th>
                                                            <th scope="col">User Id</th>
                                                            <th scope="col">Phone</th>
                                                            <th scope="col">Due Date</th>
                                                            <th scope="col">Due Days</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <#list overduebooks as bookUser>
                                                        <tr>
                                                            <th scope="row">${bookUser.book.id}</th>
                                                            <td>${bookUser.user.username}</td>
                                                            <td><#if bookUser.user.userdetail.phone?has_content>${bookUser.user.userdetail.phone}<#else>-</#if></td>
                                                            <td><#if bookUser.dueDate?has_content>${bookUser.dueDate?date}</#if>
                                                            <td>${bookUser.overDueDays}</td>
                                                        </tr>
                                                        </#list>
                                                    </tbody>
                                                </table>
                                                <#else>
                                                <div class="col-12">
                                                    <div class="no-content-img">
                                                        <i class="bi bi-journal-x"></i>
                                                        <h6><@spring.message "dashboard.noBookRequests"/></h6>
                                                    </div>
                                                </div>
                                                </#if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row main-row">
                                    <div class="col-lg-4">
                                        <div class="col-12 assign-return-div mb-4">
                                            <div class="card mb-4">
                                                <div class="card-header">
                                                    <h6 class="font-weight-bold"><i class="bi bi-arrow-counterclockwise"></i>&nbsp;Return Book</h6>
                                                </div>
                                                <div class="card-body d-flex justify-content-center">
                                                    <form role="form" action="/admin/dashboard" method="GET">
                                                        <div class="btn-group mb-3">
                                                            <input type="text" class="form-control" name="bookId" placeholder="Enter book id" aria-label="Book Id" autocomplete="off" required>
                                                            <button class="btn btn-primary" type="submit" id="returnSearch"><i class="bi bi-search"></i></button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="row">
                                            <div class="col-lg-6 mb-4">
                                                <div class="card mb-4">
                                                    <div class="card-header">
                                                        <h6 class="font-weight-bold"><i class="bi bi-search"></i>&nbsp;Search Book</h6>
                                                    </div>
                                                    <div class="card-body d-flex justify-content-center">
                                                        <form role="form" action="/admin/dashboard" method="GET">
                                                            <div class="btn-group mb-3">
                                                                <input type="text" class="form-control" name="searchBookId" placeholder="Enter book id" aria-label="Book Id" autocomplete="off" required>
                                                                <button class="btn btn-primary" type="submit" id="bookSearch"><i class="bi bi-search"></i></button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 mb-4">
                                                <div class="card mb-4">
                                                    <div class="card-header">
                                                        <h6 class="font-weight-bold"><i class="bi bi-search"></i>&nbsp;Search User</h6>
                                                    </div>
                                                    <div class="card-body d-flex justify-content-center">
                                                        <form role="form" action="/admin/dashboard" method="GET">
                                                            <div class="btn-group mb-3">
                                                                <input type="text" class="form-control" name="searchUsername" placeholder="Enter username" aria-label="Book Id" autocomplete="off" required>
                                                                <button class="btn btn-primary" type="submit" id="userSearch"><i class="bi bi-search"></i></button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row main-row">
                                    <div class="col-xl-8 col-lg-7">
                                        <div class="card">
                                            <div class="card-header flex-row align-items-center justify-content-between">
                                                <h6 class="font-weight-bold"><i class="bi bi-ui-checks-grid"></i>&nbsp;Pending Book Requests</h6>
                                            </div>
                                            <div class="card-body overflow-auto fixed-height-body">
                                                <div class="row">
                                                    <#if bookreq?has_content>
                                                    <#list bookreq as bookUser>
                                                    <div class="col-md-6 col-lg-4">
                                                        <div class="card book-approve-card shadow">
                                                            <div class="card-body book-approve-card-inner">
                                                                <h6 class="card-title">${bookUser.book.bookDetails.name}</h6>
                                                                <p class="card-text"><b>${bookUser.user.username}</b></p>
                                                                <hr>
                                                                <div class="row">
                                                                    <div class="col-6 book-approve-detail">
                                                                        <p class="card-text"><i class="bi bi-card-list"></i>&nbsp;${bookUser.book.id}</p>
                                                                    </div>
                                                                    <div class="col-6 book-approve-detail">
                                                                        <p class="card-text"><i class="bi bi-bookshelf"></i>&nbsp;${bookUser.book.rack}</p>
                                                                    </div>
                                                                </div>
                                                                <input type="hidden" class="bookApproveId" value="${bookUser.id?string.computer}">
                                                                <input type="hidden" class="bookName" value="${bookUser.book.bookDetails.name}">
                                                                <input type="hidden" class="avatarId" value="${(bookUser.user.userdetail.avatarId)!0}">
                                                                <input type="hidden" class="userName" value="${bookUser.user.username}">
                                                                <input type="hidden" class="bookId" value="${bookUser.book.id}">
                                                                <#if bookUser.book.bookDetails.isbn?has_content>
                                                                <input type="hidden" class="bookCover" value="${bookUser.book.bookDetails.isbn}">
                                                                </#if>
                                                                <input type="hidden" class="status" value="${bookUser.status}">
                                                                <hr>
                                                                <a class="card-link bookApproveLink" data-toggle="modal"
                                                                    data-target="#bookApproveModal"><#if bookUser.status == "RENEWREQUESTED">Renew<#else>Assign</#if></a>
                                                                <a class="card-link bookDeclineLink text-danger" data-toggle="modal" data-target="#bookDeclineModal">Decline</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </#list>
                                                    <#else>
                                                    <div class="col-12">
                                                        <div class="no-content-img">
                                                            <i class="bi bi-journal-x"></i>
                                                            <h6><@spring.message "dashboard.noBookRequests"/></h6>
                                                        </div>
                                                    </div>
                                                    </#if>
                                                </div>
                                            </div>
                                            <div class="card-footer" id="recentBooks">
                                                <h6 class="font-weight-bold" data-toggle="collapse" data-target="#recentBooksCollapse" aria-expanded="true" aria-controls="recentBooksCollapse">History</h6>
                                                <div id="recentBooksCollapse" class="accordion-collapse collapse" data-parent="#recentBooks">
                                                    <div class="table-responsive">
                                                        <table class="table" id="recentBooksTable">
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">Book Id</th>
                                                                    <th scope="col">Book Name</th>
                                                                    <th scope="col">User</th>
                                                                    <th scope="col">Renewal</th>
                                                                    <th scope="col">Due/Return Date</th>
                                                                    <th scope="col">Status</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <#if bookhistory??>
                                                                <#list bookhistory as bookUser>
                                                                <tr>
                                                                    <th scope="row">${bookUser.book.id}</th>
                                                                    <td>${bookUser.book.bookDetails.name}</td>
                                                                    <td>${bookUser.user.username}</td>
                                                                    <td>${bookUser.renewalCount}</td>
                                                                    <td>
                                                                        <#if bookUser.dueDate?has_content>
                                                                        ${bookUser.dueDate?date}
                                                                        <#elseif bookUser.returnedDate?has_content>
                                                                        ${bookUser.returnedDate?date}
                                                                        <#else>
                                                                        -
                                                                        </#if>
                                                                    </td>
                                                                    <td>${bookUser.status}</td>
                                                                </tr>
                                                                </#list>
                                                                </#if>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-5">
                                        <div class="card mb-4">
                                            <div class="card-header flex-row align-items-center justify-content-between">
                                                <h6 class="font-weight-bold"><i class="bi bi-ui-checks"></i>&nbsp;Pending User Requests</h6>
                                            </div>
                                            <div class="card-body overflow-auto fixed-height-body">
                                                <#if userreq?has_content>
                                                <#list userreq as newuser>
                                                <div class="accordion" id="accordion${newuser.username}">
                                                    <div class="accordion-item shadow-sm">
                                                        <div class="accordion-header" data-toggle="collapse" data-target="#${newuser.username}" aria-expanded="true" aria-controls="${newuser.username}">
                                                            <div class="row notification">
                                                                <div class="col-1 notification-body">
                                                                    <img src="../img/avatars/${(newuser.userdetail.avatarId)!0}.png" class="rounded-circle" width="25" height="25">
                                                                </div>
                                                                <div class="col-5 notification-body font-weight-bold">
                                                                    ${newuser.userdetail.fullName}
                                                                </div>
                                                                <div class="col-2 notification-body">
                                                                    <#if newuser.userdetail.student>${newuser.userdetail.standard} - ${newuser.userdetail.division}</#if>
                                                                </div>
                                                                <div class="col-4 float-right">
                                                                    <input type="hidden" class="userId" value="${newuser.username}">
                                                                    <a class="text-success user-approve" data-toggle="modal" data-target="#userApproveModal">
                                                                    <i class="bi bi-check"></i>
                                                                    </a>
                                                                    <a class="text-danger user-decline" data-toggle="modal" data-target="#userDeclineModal">
                                                                    <i class="bi bi-x"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="${newuser.username}" class="accordion-collapse collapse user-accordion" aria-labelledby="headingOne" data-bs-parent="#accordion${newuser.username}">
                                                            <div class="accordion-body">
                                                                <div class="col-12">
                                                                    <div class="row">
                                                                        <div class="col-6">
                                                                            <h6 class="text-right">Username:</h6>
                                                                        </div>
                                                                        <div class="col-6 text-left">
                                                                            ${newuser.username}
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-6">
                                                                            <h6 class="text-right">Role:</h6>
                                                                        </div>
                                                                        <div class="col-6 text-left">
                                                                            ${newuser.type}
                                                                        </div>
                                                                    </div>
                                                                    <#if newuser.type?lower_case == 'student'>
                                                                    <div class="row">
                                                                        <div class="col-6">
                                                                            <h6 class="text-right">Class:</h6>
                                                                        </div>
                                                                        <div class="col-6 text-left">
                                                                            ${newuser.userdetail.standard} - ${newuser.userdetail.division}
                                                                        </div>
                                                                    </div>
                                                                    </#if>
                                                                    <div class="row">
                                                                        <div class="col-6">
                                                                            <h6 class="text-right">Phone:</h6>
                                                                        </div>
                                                                        <div class="col-6 text-left">
                                                                            ${newuser.userdetail.phone}
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-6">
                                                                            <h6 class="text-right">Parent Name:</h6>
                                                                        </div>
                                                                        <div class="col-6 text-left">
                                                                            ${newuser.userdetail.parentName}
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                </#list>
                                                <#else>
                                                <div class="col-12">
                                                    <div class="no-content-img">
                                                        <i class="bi bi-journal-x"></i>
                                                        <h6><@spring.message "dashboard.noBookRequests"/></h6>
                                                    </div>
                                                </div>
                                                </#if>
                                            </div>
                                            <div class="card-footer" id="recentUsers">
                                                <h6 class="font-weight-bold" data-toggle="collapse" data-target="#recentUsersCollapse" aria-expanded="true" aria-controls="recentUsersCollapse">History</h6>
                                                <div id="recentUsersCollapse" class="accordion-collapse collapse" data-parent="#recentUsers">
                                                    <div class="table-responsive">
                                                        <table class="table" id="recentUsersTable">
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">Action</th>
                                                                    <th scope="col">Username</th>
                                                                    <th scope="col">Comment</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <#if userhistory??>
                                                                <#list userhistory as user>
                                                                <tr>
                                                                    <th scope="row">
                                                                        <#if user.status == "ACTIVE">
                                                                        <i class="bi bi-check"></i>
                                                                        <#else>
                                                                        <i class="bi bi-x"></i>
                                                                        </#if>
                                                                    </th>
                                                                    <td>${user.username}</td>
                                                                    <td>${(user.comment) ! "-"}</td>
                                                                </tr>
                                                                </#list>
                                                                </#if>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <#include "/modal/book-approve-modal.ftlh">
            <#include "/modal/book-decline-modal.ftlh">
            <#include "/modal/user-approve-modal.ftlh">
            <#include "/modal/user-decline-modal.ftlh">
            <#include "/modal/allotted-book-modal.ftlh">
            <#assign pageTracker = "adminDashboard">
        </div>
    </div>
</section>
</@admin_layout>
