<#assign showMenuBar = true>
<#include "header.ftl">

    <main>
        <div class="container text-center">
            <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Books</h3>
            </div>
            <div class="panel-body">
                <a href="/book/add">Add a new book</a>
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

<#assign pageTracker = "booksList">
<#include "footer.ftl">
