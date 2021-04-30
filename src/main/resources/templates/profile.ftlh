<#assign showMenuBar = false>
<#include "header.ftl">
<main class="home-container">
    <div class="container text-center profile-container">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="../img/profile.png" alt="Admin" class="rounded-circle" width="150">
                            <div class="mt-3 user-name">
                                <h4>${user.username}</h4>
                                <p class="text-secondary mb-1">Student</p>
                                <p class="text-muted font-size-sm class-division">5 B</p>
                                <button class="btn btn-primary" id="profileEdit">Edit Profile</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Full Name</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                John Doe
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Email</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                ${user.email}
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Parent Name</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                Abcd
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Parent Phone</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                +91 9876543210
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Address</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                Bay Area, San Francisco, CA
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="d-flex align-items-center">Book History</h5>
                        <div class="table-responsive">
                            <table class="table table-hover" id="bookList">
                                <thead>
                                    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Category</th>
                                        <th scope="col">Language</th>
                                        <th scope="col">Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <#if user.books??>
                                    <#list user.books as book>
                                    <tr>
                                        <td>${book.id}</td>
                                        <td>{bookDetail.name}</td>
                                        <td>{bookDetail.author.name}</td>
                                        <td>{bookDetail.category}</td>
                                        <td>{bookDetail.language}</td>
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
        </div>
    </div>
</main>

<#assign pageTracker = "profile">
<#include "footer.ftl">
