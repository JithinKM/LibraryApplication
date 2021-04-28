<#assign showMenuBar = true>
<#include "header.ftl">
<div class="container main-content text-center">
    <div class="panel panel-info list-title">
        <div class="row">
            <div class="col-xs-12 col-sm-4 panel-heading">
                <h3 class="panel-title float-left">Books</h3>
            </div>
            <div class="col-xs-12 col-sm-4 panel-heading">
                <div class="input-group search-form">
                    <input type="text" class="form-control" id="filer-books" placeholder="Search books or authors...">
                </div>
            </div>
            <div class="col-xs-12 col-sm-4 panel-heading">
                <!-- Button trigger modal -->
                <a class="panel-btn float-right" data-toggle="modal" data-target="#bookAddModal">
                Add a new book
                </a>
            </div>
        </div>
        <div class="panel-body">
            <div class="justify-content-center">
                <div class="table-responsive">
                    <table class="table table-hover" id="bookList">
                        <thead>
                            <tr>
                                <th scope="col">Name</th>
                                <th scope="col">Author</th>
                                <th scope="col">Publication</th>
                                <th scope="col">Category</th>
                                <th scope="col">Language</th>
                                <th scope="col">Available</th>
                                <th scope="col">Count</th>
                            </tr>
                        </thead>
                        <tbody>
                            <#if books??>
                            <#list books as bookDetail>
                            <tr class="accordion-toggle table-accordion" data-toggle="collapse" data-target=".${bookDetail.name?replace(" ", "")}">
                            <td>${bookDetail.name}</td>
                            <td>${bookDetail.author.name}</td>
                            <td>${bookDetail.publication}</td>
                            <td>${bookDetail.category}</td>
                            <td>${bookDetail.language}</td>
                            <td>${bookDetail.available?c}</td>
                            <td>1</td>
                            </tr>
                            <tr class="table-collapse table-collapse-header collapse ${bookDetail.name?replace(" ", "")}">
                            <td>Id</td>
                            <td>Contributed By</td>
                            <td>Price</td>
                            <td>Status</td>
                            <td>Rack</td>
                            <td>Purchased Date</td>
                            <td>Actions</td>
                            </tr>
                            <#list bookDetail.books as book>
                            <tr class="table-collapse collapse ${bookDetail.name?replace(" ", "")}">
                            <td>${book.id}</td>
                            <td>${book.contributedBy}</td>
                            <td>${book.price}</td>
                            <td>${book.status}</td>
                            <td>${book.rack}</td>
                            <td>${book.purchasedDate}</td>
                            <td>
                                <a class="confirm book-edit" data-toggle="modal" data-target="#bookEditModal">Edit</a> |
                                <a class="reject" href="/book/${book.id}/delete">Delete</a>
                                <input type="hidden" class="bookEditId" value="${book.id}" />
                                <input type="hidden" class="bookDetailEditId" value="${bookDetail.id?string.computer}" />
                                <input type="hidden" class="bookEditName" value="${bookDetail.name}" />
                                <input type="hidden" class="bookEditAuthorId" value="${bookDetail.author.id?string.computer}" />
                                <input type="hidden" class="bookEditAuthor" value="${bookDetail.author.name}" />
                                <input type="hidden" class="bookEditAuthorPenName" value="${bookDetail.author.penName}" />
                                <input type="hidden" class="bookEditCategory" value="${bookDetail.category}" />
                                <input type="hidden" class="bookEditLanguage" value="${bookDetail.language}" />
                                <input type="hidden" class="bookEditPublication" value="${bookDetail.publication}" />
                                <input type="hidden" class="bookEditRack" value="${book.rack}" />
                                <input type="hidden" class="bookEditContributed" value="${book.contributedBy}" />
                                <input type="hidden" class="bookEditPurchased" value="${book.purchasedDate?date?string.short}" />
                                <input type="hidden" class="bookEditPrice" value="${book.price?string.computer}" />
                            </td>
                            </tr>
                            </#list>
                            </#list>
                            </#if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</main>
</div>
</div>
<!-- Modal -->
<div class="modal fade" id="bookAddModal" tabindex="-1" role="dialog" aria-labelledby="bookAddModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">ADD BOOK</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" id="bookAddForm" action="/book" method="POST">
                    <h5 class="form-subtitle">Author</h5>
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" class="form-control" id="authorName" name="bookDetails.author.name" placeholder="Enter author name" autocomplete="off">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Pen Name</label>
                                    <input type="text" class="form-control" id="authorPenName" name="bookDetails.author.penName" placeholder="Enter author pen name" autocomplete="off">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <h5 class="form-subtitle">Book</h5>
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" class="form-control" id="name" name="bookDetails.name" placeholder="Enter book name" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <input type="text" class="form-control" id="category" name="bookDetails.category" placeholder="Enter book category" autocomplete="off">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Language</label>
                                    <input type="text" class="form-control" id="language" name="bookDetails.language" placeholder="Enter book language" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label>Publication</label>
                                    <input type="text" class="form-control" id="publication" name="bookDetails.publication" placeholder="Enter publication" autocomplete="off">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <h5 class="form-subtitle">Details</h5>
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Book id's</label>
                                    <input type="text" class="form-control" id="bookId" name="bookIds" placeholder="Enter book id's separated by commas" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label>Rack</label>
                                    <input type="text" class="form-control" id="rack" name="rack" placeholder="Enter rack" autocomplete="off">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Contributed By</label>
                                    <input type="text" class="form-control" id="contributed" name="contributedBy" placeholder="Enter contributed by" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label>Purchased Date</label>
                                    <input type="text" class="form-control" id="purchased" name="purchasedDate" placeholder="Enter purchased date" autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Price</label>
                                    <input type="text" class="form-control" id="price" name="price" placeholder="Enter price" autocomplete="off">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <input type="submit" class="btn btn-primary btn-block" id="addBook" value="Add"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>

<div class="modal fade" id="bookEditModal" tabindex="-1" role="dialog" aria-labelledby="bookAddModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">EDIT BOOK</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" id="bookEditForm" action="/book" method="POST">
                    <h5 class="form-subtitle">Author</h5>
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" class="form-control" id="authorNameEdit" name="bookDetails.author.name" placeholder="Enter author name" autocomplete="off">
                                </div>
                            </div>
                            <input type="hidden" id="authorIdEdit" name="bookDetails.author.id" value="">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Pen Name</label>
                                    <input type="text" class="form-control" id="authorPenNameEdit" name="bookDetails.author.penName" placeholder="Enter author pen name" autocomplete="off">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <h5 class="form-subtitle">Book</h5>
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" class="form-control" id="nameEdit" name="bookDetails.name" placeholder="Enter book name" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <input type="text" class="form-control" id="categoryEdit" name="bookDetails.category" placeholder="Enter book category" autocomplete="off">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Language</label>
                                    <input type="text" class="form-control" id="languageEdit" name="bookDetails.language" placeholder="Enter book language" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label>Publication</label>
                                    <input type="text" class="form-control" id="publicationEdit" name="bookDetails.publication" placeholder="Enter publication" autocomplete="off">
                                    <input type="hidden" id="bookDetailIdEdit" name="bookDetails.id">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <h5 class="form-subtitle">Details</h5>
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Book id</label>
                                    <input type="text" class="form-control" id="bookIdEdit" name="bookId" placeholder="Enter book id" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label>Rack</label>
                                    <input type="text" class="form-control" id="rackEdit" name="rack" placeholder="Enter rack" autocomplete="off">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Contributed By</label>
                                    <input type="text" class="form-control" id="contributedByEdit" name="contributedBy" placeholder="Enter contributed by" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label>Purchased Date</label>
                                    <input type="text" class="form-control" id="purchasedDateEdit" name="purchasedDate" placeholder="Enter purchased date" autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Price</label>
                                    <input type="text" class="form-control" id="priceEdit" name="price" placeholder="Enter price" autocomplete="off">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <input type="submit" class="btn btn-primary btn-block" id="editBook" value="Edit"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>

<#assign pageTracker = "booksList">
<#include "footer.ftl">
