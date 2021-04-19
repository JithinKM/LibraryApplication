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
                    <input type="text" class="form-control" placeholder="Search books...">
                    <span class="input-group-btn">
                    <button class="btn btn-primary" type="button">Go!</button>
                    </span>
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
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Author</th>
                                <th scope="col">Publication</th>
                                <th scope="col">Category</th>
                                <th scope="col">Language</th>
                                <th scope="col">Added on</th>
                                <th scope="col">Available</th>
                                <th scope="col">Count</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <#if books??>
                            <#list books as book>
                            <tr>
                                <td>${book.id}</td>
                                <td>${book.name}</td>
                                <td>${book.author.name}</td>
                                <td>${book.publication}</td>
                                <td>${book.category}</td>
                                <td>${book.language}</td>
                                <td>${book.createdTimestamp?date?string.short}</td>
                                <td>${book.available?string('Yes','No')}</td>
                                <td>${book.count}</td>
                                <td>
                                    <a class="confirm book-edit" data-toggle="modal" data-target="#bookEditModal">Edit</a> |
                                    <a class="reject" href="/book/${book.id}/delete">Delete</a>
                                </td>
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
</main>
</div>
</div>

<!-- Modal -->
<div class="modal fade" id="bookAddModal" tabindex="-1" role="dialog" aria-labelledby="bookAddModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Book</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" id="bookAddForm">
                    <div class="row">
                        <div class="col-6">
                            <h4>Author Details</h4>
                            <div class="form-group">
                                <label>Author Name</label>
                                <input type="text" class="form-control" id="authorName" name="authorName" placeholder="Enter author name">
                            </div>
                            <div class="form-group">
                                <label>Author Pen Name</label>
                                <input type="text" class="form-control" id="authorPenName" name="authorPenName" placeholder="Enter author pen name">
                            </div>
                            <h4>Book Common Details</h4>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter book name">
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <input type="text" class="form-control" id="category" name="category" placeholder="Enter book category">
                            </div>
                            <div class="form-group">
                                <label>Language</label>
                                <input type="text" class="form-control" id="language" name="language" placeholder="Enter book language">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Publication</label>
                                <input type="text" class="form-control" id="publication" name="publication" placeholder="Enter publication">
                            </div>
                            <div class="form-group">
                                <label>Book id's</label>
                                <input type="text" class="form-control" id="bookId" name="bookId" placeholder="Enter book id's separated by commas">
                            </div>
                            <div class="form-group">
                                <label>Rack</label>
                                <input type="text" class="form-control" id="rack" name="rack" placeholder="Enter rack">
                            </div>
                            <div class="form-group">
                                <label>Purchased Date</label>
                                <input type="text" class="form-control" id="purchased" name="purchased" placeholder="Enter purchased date">
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="text" class="form-control" id="price" name="price" placeholder="Enter price">
                            </div>
                            <input type="submit" class="btn btn-primary" id="addBook" value="Add"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="bookEditModal" tabindex="-1" role="dialog" aria-labelledby="bookEditModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Book</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" id="bookEditForm">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Book id's</label>
                                <input type="text" class="form-control" id="bookEditId" name="bookId" placeholder="Enter book id">
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" id="bookEditName" name="name" placeholder="Enter book name">
                            </div>
                            <div class="form-group">
                                <label>Author</label>
                                <input type="text" class="typeahead form-control" id="bookEditAuthor" name="author" placeholder="Enter author">
                                <input type="hidden" id="bookEditAuthor" name="author" value="">
                                <input type="hidden" id="bookEditAuthorId" name="author" value="">
                                <input type="hidden" id="bookEditAuthorPenName" name="author" value="">
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <input type="text" class="form-control" id="bookEditCategory" name="category" placeholder="Enter book category">
                            </div>
                            <div class="form-group">
                                <label>Language</label>
                                <input type="text" class="form-control" id="bookEditLanguage" name="language" placeholder="Enter book language">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Publication</label>
                                <input type="text" class="form-control" id="bookEditPublication" name="publication" placeholder="Enter publication">
                            </div>
                            <div class="form-group">
                                <label>Rack</label>
                                <input type="text" class="form-control" id="bookEditRack" name="rack" placeholder="Enter rack">
                            </div>
                            <div class="form-group">
                                <label>Purchased Date</label>
                                <input type="text" class="form-control" id="bookEditPurchased" name="purchased" placeholder="Enter purchased date">
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="text" class="form-control" id="bookEditPrice" name="price" placeholder="Enter price">
                            </div>
                            <input type="submit" class="btn btn-primary" id="editBook" value="Save"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<#assign pageTracker = "booksList">
<#include "footer.ftl">