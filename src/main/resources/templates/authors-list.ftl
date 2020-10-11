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
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                  Add a new author
                </button>
                <div class="row justify-content-center">
                    <div class="col-auto">
                    <table class="table table-responsive table-hover">
                      <thead class="thead-dark">
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">Name</th>
                          <th scope="col">Email</th>
                          <th scope="col">Class</th>
                          <th scope="col">Owned Books</th>
                          <th scope="col">Status</th>
                          <th scope="col">Actions</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row">1</th>
                          <td>Mark</td>
                          <td>mark@gmail.com</td>
                          <td>IX</td>
                          <td>2</td>
                          <td>Inactive</td>
                          <td>
                              <a class="confirm" href="/user/confirm/id">Confirm</a> |
                              <a class="reject" href="/user/reject/id">Reject</a>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">2</th>
                          <td>Mark</td>
                          <td>mark@gmail.com</td>
                          <td>IX</td>
                          <td>2</td>
                          <td>Inactive</td>
                          <td>
                              <a class="confirm" href="/user/confirm/id">Confirm</a> |
                              <a class="reject" href="/user/reject/id">Reject</a>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">3</th>
                          <td>Mark</td>
                          <td>mark@gmail.com</td>
                          <td>IX</td>
                          <td>2</td>
                          <td>Inactive</td>
                          <td>
                              <a class="confirm" href="/user/confirm/id">Confirm</a> |
                              <a class="reject" href="/user/reject/id">Reject</a>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <h4 class="sub-header">Add Author</h4>
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

<#assign pageTracker = "authorsList">
<#include "footer.ftl">
