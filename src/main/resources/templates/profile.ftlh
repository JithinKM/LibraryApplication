<@user_layout title="Homepage">
<section class="admin-page">
   <div class="container-fluid main-container">
      <div class="row main-row">
<main class="home-container justify-content-center">
    <div class="text-center profile-container">
        <div class="user-details-outer" id="user-details-accordion">
        <div class="user-details shadow-sm">
            <div class="col-12">
                <div class="row">
                    <div class="col-10">
                        <div class="row" id="username-heading">
                            <img src="../img/avatars/${random}.png" alt="Admin" class="rounded-circle profile-img-sm" width="110" height="110">
                            <div class="col-12">
                                <h5 class="text-left color-cyan username-sm">${user.userdetail.fullName}</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="float-right" id="user-chevron-toggle" data-toggle="collapse" data-target="#user-details-inner" aria-controls="user-details-inner">
                            <i class="bi bi-caret-down-fill"></i>
                            <i class="bi bi-caret-up-fill d-none"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div id="user-details-inner" class="col-12 collapse" data-parent="#user-details-accordion">
                <div class="row">
                    <div class="col-md-5">
                        <div class="align-items-center text-center">
                            <div class="img-overlay">
                                <img src="../img/avatars/${random}.png" alt="profilePic" class="rounded-circle" width="150">
                                <div class="col-12 mx-auto d-flex align-items-center change-image">
                                    <a class="mx-auto" data-toggle="modal" data-target="#avatarModal"><i class="bi bi-camera-fill"></i></a>
                                </div>
                            </div>
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
                                    <h6 class="mb-0 mt-2">Full Name</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <div class="user-field mt-2" id="field-username">${user.userdetail.fullName}</div>
                                    <div class="row">
	                                    <div class="col-6" style="padding-right:5px">
	                                    	<input type="text" class="form-control user-input d-none" id="input-firstname" name="firstname" disabled value="${user.userdetail.firstname}">
	                                    </div>
	                                    <div class="col-6" style="padding-left:5px">
	                                    	<input type="text" class="form-control user-input d-none" id="input-lastname" name="lastname" disabled value="${user.userdetail.lastname}">
	                                    </div>
                                    </div>
                                </div>
                            </div>
                            <#if user.type?lower_case == 'student'>
                            	<hr class="user-field mt-2">
                                <div class="row profile-edit-field">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0 mt-2">Class & Division</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <div class="user-field mt-2" id="field-standard">${user.userdetail.standard} - ${user.userdetail.division}</div>
                                        <div class="row">
                                            <div class="col-6" style="padding-right:5px">
                                                <div class="form-group user-input d-none">
                                                    <select class="form-control" id="standard" name="standard">
                                                        <#if user.userdetail.standard == 5><option selected><#else><option></#if>5</option>
                                                        <#if user.userdetail.standard == 6><option selected><#else><option></#if>6</option>
                                                        <#if user.userdetail.standard == 7><option selected><#else><option></#if>7</option>
                                                        <#if user.userdetail.standard == 8><option selected><#else><option></#if>8</option>
                                                        <#if user.userdetail.standard == 9><option selected><#else><option></#if>9</option>
                                                        <#if user.userdetail.standard == 10><option selected><#else><option></#if>10</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-6" style="padding-left:5px">
                                                <div class="form-group user-input d-none">
                                                    <select class="form-control" id="division" name="division">
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
                            <hr class="user-field mt-2">
                            <div class="row profile-edit-field">
                                <div class="col-sm-3">
                                    <h6 class="mb-0 mt-2">Email</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <div class="user-field mt-2" id="field-email">${user.email}</div>
                                    <input type="text" class="form-control user-input d-none" id="input-email" name="email" autocomplete="off" value="${user.email}">
                                </div>
                            </div>
                            <hr class="user-field mt-2">
                            <div class="row profile-edit-field">
                                <div class="col-sm-3">
                                    <h6 class="mb-0 mt-2">Phone</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <div class="user-field mt-2" id="field-phone">${user.userdetail.phone}</div>
                                    <input type="text" class="form-control user-input d-none" id="input-phone" name="phone" autocomplete="off" value="${user.userdetail.phone}">
                                </div>
                            </div>
                            
                            <#if user.type?lower_case == 'student'>
                            	<hr class="user-field mt-2">
	                            <div class="row profile-edit-field">
	                                <div class="col-sm-3">
	                                    <h6 class="mb-0 mt-2">Parent Name</h6>
	                                </div>
	                                <div class="col-sm-9 text-secondary">
	                                    <div class="user-field mt-2" id="field-parent-name">${user.userdetail.parentName}</div>
	                                    <input type="text" class="form-control user-input d-none" id="input-parent-name" name="parentName" autocomplete="off" value="${user.userdetail.parentName}">
	                                </div>
	                            </div>
	                            <hr class="user-field mt-2">
	                            <div class="row profile-edit-field">
	                                <div class="col-sm-3">
	                                    <h6 class="mb-0 mt-2">Parent Phone</h6>
	                                </div>
	                                <div class="col-sm-9 text-secondary">
	                                    <div class="user-field mt-2" id="field-phone">${user.userdetail.parentPhone}</div>
	                                    <input type="text" class="form-control user-input d-none" id="input-parent-phone" name="parentPhone" autocomplete="off" value="${user.userdetail.parentPhone}">
	                                </div>
	                            </div>
	                        </#if>
                            <hr class="user-field mt-2">
                            <div class="row profile-edit-field">
                                <div class="col-sm-3">
                                    <h6 class="mb-0 mt-2">Address</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <div class="user-field mt-2" id="field-address">${user.userdetail.address}</div>
                                    <textarea type="text" class="form-control user-input d-none" id="input-address" name="address" autocomplete="off" rows="3">${user.userdetail.address}</textarea>
                                </div>
                            </div>
                            <hr class="user-field mt-2">
                            <div class="form-check user-input d-none">
                                <input type="checkbox" class="form-check-input" id="passwordEditCheck">
                                <label class="form-check-label" for="passwordEditCheck">I want to change my password</label>
                            </div>
                            <div class="row profile-edit-field passwordEdit d-none">
                                <div class="col-sm-3">
                                    <h6 class="mb-0 mt-2">Current Password</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" class="form-control user-input" id="input-oldpassword" name="oldpassword" autocomplete="off" disabled>
                                </div>
                            </div>
                            <div class="row profile-edit-field passwordEdit d-none">
                                <div class="col-sm-3">
                                    <h6 class="mb-0 mt-2">New Password</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" class="form-control user-input d-none" id="input-password" name="password" autocomplete="off" disabled>
                                </div>
                            </div>
                            <input type="submit" class="btn btn-success d-none float-right" id="profileSave" value="Save Changes" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <div class="current-books">
        	<#if currentBooks?has_content>
            	<h5 class="color-cyan">Currently Owned Books</h5>
            <#else>
            	<h5 class="color-cyan">No Books Owned Currently</h5>
            </#if>
            <div class="col-12">
                <div class="row justify-content-center">
                    <#list currentBooks as currentbook>
                    <div class="col-sm-12 col-md-6 col-lg-4 current-book-outer zoom">
                        <div class="row">
                            <div class="col-6 book-img-outer">
                                <img class="user-book-img shadow-lg" 
                                <#if currentbook.book.bookDetails.isbn?has_content>
                                	src="http://covers.openlibrary.org/b/isbn/${currentbook.book.bookDetails.isbn}-M.jpg"
                                <#else>
                                	src="../img/book-cover.png"
                                </#if>
                                >
                            </div>
                            <div class="col-6 ${currentbook.status?lower_case}-book-outer shadow-lg">
                                <div class="current-book text-left">
                                    <h6 class="title text-center bookName">${currentbook.book.bookDetails.name}</h6>
                                    <h7>Book Id: ${currentbook.book.id}</h7>
                                    <h7>Rack: ${currentbook.book.rack}</h7>
                                    <#if currentbook.status == "REQUESTED">
                                    	<div class="row main-row">
                                    	    <div class="col-9">
                                                <h7>Status: ${currentbook.statusText}</h7>
                                            </div>
                                            <div class="col-3 cancel-outer">
                                                <input type="hidden" class="bookUserId" value="${currentbook.id?string.computer}">
                                                <a class="btn cancel-btn" title="Cancel this book" data-toggle="modal" data-target="#cancelModal"><i class="bi bi-trash-fill"></i></a>
                                            </div>
                                        </div>
                                    <#else>
                                        <h7>Status: ${currentbook.statusText}</h7>
                                    </#if>
                                    <#if currentbook.dueDate?? && currentbook.status == "ALLOTED">
                                    	<h7>Due on: ${currentbook.dueDate?date}</h7>
                                    	<div class="row main-row">
                                    	    <div class="col-9">
                                                <div class="progress" style="height: 4px;">
                                                    <input type="hidden" class="allotted-date" value="${currentbook.allotedDate?date}">
                                                    <input type="hidden" class="due-date" value="${currentbook.dueDate?date}">
                                                    <div class="progress-bar"></div>
                                                </div>
                                            </div>
                                    	    <div class="col-3 renew-outer d-none">
                                                <input type="hidden" class="bookUserId" value="${currentbook.id?string.computer}">
                                                <a class="btn renew-btn" title="Renew this book" data-toggle="modal" data-target="#renewModal"><i class="bi bi-arrow-repeat"></i></a>
                                            </div>
	                                    </div>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    </div>
                    </#list>
                </div>
            </div>
        </div>
        <div class="user-books-outer">
        <div class="user-books shadow-sm">
            <div class="col-12">
                <div class="row">
                    <div class="col-10">
                        <h5 class="d-flex align-items-center color-cyan">Book History</h5>
                    </div>
                    <div class="col-2">
                        <div class="float-right" id="chevron-toggle" data-toggle="collapse" data-target="#userBookList" aria-controls="userBookList">
                            <i class="bi bi-caret-down-fill"></i>
                            <i class="bi bi-caret-up-fill d-none"></i>
                        </div>
                    </div>
                </div>
                <div class="table-responsive collapse" id="userBookList">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">BookId</th>
                                <th scope="col">Name</th>
                                <th scope="col">Alloted Date</th>
                                <th scope="col">Return Date</th>
                                <th scope="col">Status</th>
                                <th scope="col">Comment</th>
                            </tr>
                        </thead>
                        <tbody>
                            <#if bookHistory?has_content>
                            <#list bookHistory as bookuser>
                            <tr>
                                <td>${bookuser.book.id}</td>
                                <td>${bookuser.book.bookDetails.name}</td>
                                <td>${(bookuser.allotedDate)!"-"}</td>
                                <td>${(bookuser.returnedDate)!"-"}</td>
                                <td>${bookuser.status}</td>
                                <td>${(bookuser.comments)!"-"}</td>
                            </tr>
                            </#list>
                            <#else>
                            	<tr><td colspan="6">No Books Borrowed Till Now.</td></tr>
                            </#if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        </div>
    </div>
</main>

<#include "/modal/book-renew-modal.ftlh">
<#include "/modal/book-cancel-modal.ftlh">
<#include "/modal/avatar-modal.ftlh">
<#assign pageTracker = "profile">
   </div>
   </div>
</section>
</@user_layout>
