<#assign showMenuBar = false>
<#include "header.ftl">
<main class="home-container justify-content-center">
    <div class="container text-center profile-container">
        <div class="row user-details shadow-sm">
            <div class="col-12">
                <div class="row">
                    <div class="col-10">
                        <div class="row" id="username-heading">
                            <div class="col-1">
                                <img src="../img/profile.png" alt="Admin" class="rounded-circle" width="30">
                            </div>
                            <div class="col-11">
                                <h5 class="text-left">${user.userdetail.fullName}</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="float-right" id="user-chevron-toggle" data-toggle="collapse" data-target="#user-details-inner" aria-controls="user-details-inner">
                            <i class="bi bi-chevron-down"></i>
                            <i class="bi bi-chevron-up d-none"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div id="user-details-inner" class="col-12 collapse">
                <div class="row">
                    <div class="col-md-5">
                        <div class="align-items-center text-center">
                            <img src="../img/profile.png" alt="profilePic" class="rounded-circle" width="150">
                            <div class="mt-3 user-name">
                                <h4>${user.username}</h4>
                                <p class="text-secondary mb-1">${user.type}</p>
                                <button class="btn btn-primary" id="profileEdit">Edit Profile</button>
                                <button class="btn btn-success d-none" id="profileSave">Save Changes</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 float-right">
                        <div class="">
                            <div class="">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Full Name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <div class="user-field" id="field-username">${user.userdetail.fullName}</div>
                                        <input type="text" class="form-control user-input d-none" id="input-username" name="user.userdetail.fullName" autocomplete="off">
                                    </div>
                                </div>
                                <hr>
                                <#if user.userdetail.division??>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Class & Division</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <div class="user-field" id="field-standard">${user.userdetail.standard} - ${user.userdetail.division}</div>
                                            <input type="text" class="form-control user-input d-none" id="input-standard" name="user.userdetail.standard" autocomplete="off">
                                        </div>
                                    </div>
                                </#if>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <div class="user-field" id="field-email">${user.email}</div>
                                        <input type="text" class="form-control user-input d-none" id="input-email" name="user.email" autocomplete="off">
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Parent Name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <div class="user-field" id="field-parent-name">${user.userdetail.parentName}</div>
                                        <input type="text" class="form-control user-input d-none" id="input-parent-name" name="user.userdetail.parentName" autocomplete="off">
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Phone</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <div class="user-field" id="field-phone">${user.userdetail.phone}</div>
                                        <input type="text" class="form-control user-input d-none" id="input-phone" name="user.userdetail.phone" autocomplete="off">
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Address</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <div class="user-field" id="field-address">${user.userdetail.address}</div>
                                        <textarea type="text" class="form-control user-input d-none" id="input-address" name="user.userdetail.address" autocomplete="off" rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="current-books">
            <h5>Currently Owned Books</h5>
            <div class="col-12">
                <div class="row justify-content-center">
                    <#list user.books as book>
                    <div class="col-4 current-book-outer">
                        <div class="row">
                            <div class="col-6 book-img-outer">
                                <img class="user-book-img shadow-sm" src="../img/book-cover.png">
                            </div>
                            <div class="col-6 user-book-outer shadow-sm">
                                <div class="current-book">
                                    <h6 class="book-name">${book.bookDetails.name}</h6>
                                    <hr>
                                    <h6>Due Date</h6>
                                    <div class="progress">
                                        <div class="progress-bar" style="width: 70%"></div>
                                    </div>
                                    <span class="progress-description">
                                        ${book.updatedTimestamp?date}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    </#list>
                </div>
            </div>
        </div>
        <div class="row user-books shadow-sm">
            <div class="col-12">
                <div class="row">
                    <div class="col-10">
                        <h5 class="d-flex align-items-center">Book History</h5>
                    </div>
                    <div class="col-2">
                        <div class="float-right" id="chevron-toggle" data-toggle="collapse" data-target="#userBookList" aria-controls="userBookList">
                            <i class="bi bi-chevron-down"></i>
                            <i class="bi bi-chevron-up d-none"></i>
                        </div>
                    </div>
                </div>
                <div class="table-responsive collapse" id="userBookList">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Lent Date</th>
                                <th scope="col">Due Date</th>
                                <th scope="col">Status</th>
                                <th scope="col">Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <#if user.books??>
                            <#list user.books as book>
                            <tr>
                                <td>${book.id}</td>
                                <td>${book.bookDetails.name}</td>
                                <td>${book.updatedTimestamp?date}</td>
                                <td>${book.updatedTimestamp?date}</td>
                                <td>${book.status}</td>
                                <td>${book.price}</td>
                            </tr>
                            </#list>
                            </#if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<#assign pageTracker = "profile">
<#include "footer.ftl">
