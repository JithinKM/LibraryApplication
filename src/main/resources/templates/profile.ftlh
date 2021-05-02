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
                                <h5 class="text-left color-cyan">${user.userdetail.fullName}</h5>
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
                            <div class="mt-3 user-name color-cyan">
                                <h4>${user.username}</h4>
                                <p class="text-secondary mb-1">${user.type}</p>
                                <button class="btn btn-primary" id="profileEdit">Edit Profile</button>
                                <button class="btn btn-danger d-none" id="cancelEdit">Cancel Edit</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 float-right">
                        <form role="form" id="userForm" action="/user/profile" method="POST">
                            <div class="row profile-edit-field">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Full Name</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <div class="user-field" id="field-username">${user.userdetail.fullName}</div>
                                    <input type="text" class="form-control user-input d-none" id="input-username" name="fullName" autocomplete="off" value="${user.userdetail.fullName}">
                                </div>
                            </div>
                            <hr class="user-field">
                            <#if user.userdetail.division??>
                                <div class="row profile-edit-field">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Class & Division</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <div class="user-field" id="field-standard">${user.userdetail.standard} - ${user.userdetail.division}</div>
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="form-group user-input d-none">
                                                    <select class="form-control" id="standard">
                                                        <#if user.userdetail.standard == 5><option selected><#else><option></#if>5</option>
                                                        <#if user.userdetail.standard == 6><option selected><#else><option></#if>6</option>
                                                        <#if user.userdetail.standard == 7><option selected><#else><option></#if>7</option>
                                                        <#if user.userdetail.standard == 8><option selected><#else><option></#if>8</option>
                                                        <#if user.userdetail.standard == 9><option selected><#else><option></#if>9</option>
                                                        <#if user.userdetail.standard == 10><option selected><#else><option></#if>10</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="form-group user-input d-none">
                                                    <select class="form-control" id="division">
                                                        <#if user.userdetail.division == "A"><option selected><#else><option></#if>A</option>
                                                        <#if user.userdetail.division == "B"><option selected><#else><option></#if>B</option>
                                                        <#if user.userdetail.division == "C"><option selected><#else><option></#if>C</option>
                                                        <#if user.userdetail.division == "D"><option selected><#else><option></#if>D</option>
                                                        <#if user.userdetail.division == "E"><option selected><#else><option></#if>E</option>
                                                        <#if user.userdetail.division == "F"><option selected><#else><option></#if>F</option>
                                                        <#if user.userdetail.division == "G"><option selected><#else><option></#if>G</option>
                                                        <#if user.userdetail.division == "H"><option selected><#else><option></#if>H</option>
                                                        <#if user.userdetail.division == "I"><option selected><#else><option></#if>I</option>
                                                        <#if user.userdetail.division == "J"><option selected><#else><option></#if>J</option>
                                                        <#if user.userdetail.division == "K"><option selected><#else><option></#if>K</option>
                                                        <#if user.userdetail.division == "L"><option selected><#else><option></#if>L</option>
                                                        <#if user.userdetail.division == "M"><option selected><#else><option></#if>M</option>
                                                        <#if user.userdetail.division == "N"><option selected><#else><option></#if>N</option>
                                                        <#if user.userdetail.division == "O"><option selected><#else><option></#if>O</option>
                                                        <#if user.userdetail.division == "P"><option selected><#else><option></#if>P</option>
                                                        <#if user.userdetail.division == "Q"><option selected><#else><option></#if>Q</option>
                                                        <#if user.userdetail.division == "R"><option selected><#else><option></#if>R</option>
                                                        <#if user.userdetail.division == "S"><option selected><#else><option></#if>S</option>
                                                        <#if user.userdetail.division == "T"><option selected><#else><option></#if>T</option>
                                                        <#if user.userdetail.division == "U"><option selected><#else><option></#if>U</option>
                                                        <#if user.userdetail.division == "V"><option selected><#else><option></#if>V</option>
                                                        <#if user.userdetail.division == "W"><option selected><#else><option></#if>W</option>
                                                        <#if user.userdetail.division == "X"><option selected><#else><option></#if>X</option>
                                                        <#if user.userdetail.division == "Y"><option selected><#else><option></#if>Y</option>
                                                        <#if user.userdetail.division == "Z"><option selected><#else><option></#if>Z</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </#if>
                            <hr class="user-field">
                            <div class="row profile-edit-field">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Email</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <div class="user-field" id="field-email">${user.email}</div>
                                    <input type="text" class="form-control user-input d-none" id="input-email" name="email" autocomplete="off" value="${user.email}">
                                </div>
                            </div>
                            <hr class="user-field">
                            <div class="row profile-edit-field">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Parent Name</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <div class="user-field" id="field-parent-name">${user.userdetail.parentName}</div>
                                    <input type="text" class="form-control user-input d-none" id="input-parent-name" name="parentName" autocomplete="off" value="${user.userdetail.parentName}">
                                </div>
                            </div>
                            <hr class="user-field">
                            <div class="row profile-edit-field">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Phone</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <div class="user-field" id="field-phone">${user.userdetail.phone}</div>
                                    <input type="text" class="form-control user-input d-none" id="input-phone" name="parentPhone" autocomplete="off" value="${user.userdetail.phone}">
                                </div>
                            </div>
                            <hr class="user-field">
                            <div class="row profile-edit-field">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Address</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <div class="user-field" id="field-address">${user.userdetail.address}</div>
                                    <textarea type="text" class="form-control user-input d-none" id="input-address" name="address" autocomplete="off" rows="3">${user.userdetail.address}</textarea>
                                </div>
                            </div>
                            <input type="submit" class="btn btn-success d-none float-right" id="profileSave" value="Save Changes" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="current-books">
            <h5 class="color-cyan">Currently Owned Books</h5>
            <div class="col-12">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-4 current-book-outer zoom">
                        <div class="row">
                            <div class="col-6 col-md-4 book-img-outer">
                                <img class="user-book-img shadow-lg" src="../img/book-cover1.png">
                            </div>
                            <div class="col-6 col-md-8 prebooked-book-outer shadow-lg">
                                <div class="current-book">
                                    <h6 class="book-name">Abcdefgh</h6>
                                    <hr class="user-field">
                                    <h6>Approval Pending</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#list user.books as book>
                    <div class="col-12 col-md-4 current-book-outer zoom">
                        <div class="row">
                            <div class="col-6 col-md-4 book-img-outer">
                                <img class="user-book-img shadow-lg" src="../img/book-cover.png">
                            </div>
                            <div class="col-6 col-md-8 user-book-outer shadow-lg">
                                <div class="current-book">
                                    <h6 class="book-name">${book.bookDetails.name}</h6>
                                    <hr class="user-field">
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
                        <h5 class="d-flex align-items-center color-cyan">Book History</h5>
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
