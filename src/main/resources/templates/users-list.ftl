<#assign showMenuBar = true>
<#include "header.ftl">

    <main>
        <div class="container text-center">
            <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Users</h3>
            </div>
            <div class="panel-body">
                <div class="justify-content-center">
                    <div class="table-responsive">
                    <table class="table table-hover">
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

<#assign pageTracker = "usersList">
<#include "footer.ftl">
