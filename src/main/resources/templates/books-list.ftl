<#assign showMenuBar = true>
<#include "header.ftl">

    <main>
        <div class="container text-center">
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
                          <th scope="col">Rack</th>
                          <th scope="col">Purchased on</th>
                          <th scope="col">Price</th>
                        </tr>
                      </thead>
                      <tbody>
                      <#if books??>
                          <#assign count = 0>
                          <#list books as book>
                            <#assign count = count + 1>
                            <tr>
                              <td>${count}</td>
                              <td>${book.name}</td>
                              <td>${book.author.name}</td>
                              <td>${book.publication}</td>
                              <td>${book.category}</td>
                              <td>${book.language}</td>
                              <td>${book.rack}</td>
                              <td>${book.purchased}</td>
                              <td>${book.price}</td>
                              <td>
                                  <a class="confirm book-edit" data-toggle="modal" data-target="#bookEditModal">Edit</a> |
                                  <a class="reject" href="/book/${book.id}/delete">Delete</a>
                                  <input type="hidden" class="bookEditId" value="${book.id}" />
                                  <input type="hidden" class="bookEditName" value="${book.name}" />
                                  <input type="hidden" class="bookEditPenName" value="${book.penName}" />
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

<#assign pageTracker = "booksList">
<#include "footer.ftl">
