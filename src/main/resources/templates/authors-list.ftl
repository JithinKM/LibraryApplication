<#assign showMenuBar = true>
<#include "header.ftl">

    <main>
        <div class="container text-center">
            <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Authors</h3>
            </div>
            <div class="panel-body">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#authorAddModal">
                  Add a new author
                </button>
                <div class="row justify-content-center">
                    <div class="col-auto">
                    <table class="table table-responsive table-hover">
                      <thead class="thead-dark">
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">Name</th>
                          <th scope="col">Pen Name</th>
                          <th scope="col">Actions</th>
                        </tr>
                      </thead>
                      <tbody>
                    <#if authors??>
                      <#assign count = 0>
                      <#list authors as author>
                        <#assign count = count + 1>
                        <tr>
                          <td>${count}</td>
                          <td>${author.name}</td>
                          <td>${author.penName}</td>
                          <td>
                              <a class="confirm author-edit" data-toggle="modal" data-target="#authorEditModal">Edit</a> |
                              <a class="reject" href="/author/${author.id}/delete">Delete</a>
                              <input type="hidden" class="authorEditId" value="${author.id}" />
                              <input type="hidden" class="authorEditName" value="${author.name}" />
                              <input type="hidden" class="authorEditPenName" value="${author.penName}" />
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
    </div>

    <!-- Modal -->
    <div class="modal fade" id="authorAddModal" tabindex="-1" role="dialog" aria-labelledby="authorAddModalTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Add Author</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form role="form" id="authorAddForm">
              <div class="form-group">
                <label for="blogPostTitle">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter author name">
              </div>
              <div class="form-group">
                <label for="blogPostTitle">Pen Name</label>
                <input type="text" class="form-control" id="penName" name="penName" placeholder="Enter author pen-name">
              </div>
              <input type="submit" class="btn btn-primary" id="addAuthor" value="Add"/>
            </form>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="authorEditModal" tabindex="-1" role="dialog" aria-labelledby="authorEditModalTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Edit Author</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form role="form" id="authorEditForm">
              <div class="form-group">
                <label for="blogPostTitle">Name</label>
                <input type="text" class="form-control" id="editName" name="editName" placeholder="Enter author name">
              </div>
              <div class="form-group">
                <label for="blogPostTitle">Pen Name</label>
                <input type="text" class="form-control" id="editPenName" name="editPenName" placeholder="Enter author pen-name">
              </div>
                <input type="hidden" class="form-control" id="editId" name="id">
              <input type="submit" class="btn btn-primary" id="editAuthor" value="Save"/>
            </form>
          </div>
        </div>
      </div>
    </div>

<#assign pageTracker = "authorsList">
<#include "footer.ftl">
