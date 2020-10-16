<#assign showMenuBar = true>
<#include "header.ftl">

    <main>
        <div class="container text-center">
            <div class="panel panel-info list-title">
            <div class="row">
                <div class="col-xs-12 col-sm-4 panel-heading">
                    <h3 class="panel-title float-left">Users</h3>
                </div>
                <div class="col-xs-12 col-sm-4 panel-heading">
                    <div class="input-group search-form">
                      <input type="text" class="form-control" placeholder="Search users...">
                      <span class="input-group-btn">
                        <button class="btn btn-primary" type="button">Go!</button>
                      </span>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-4 panel-heading">
                    <!-- Button trigger modal -->
                    <a class="panel-btn float-right" data-toggle="modal" data-target="#userAddModal">
                        Add a new user
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
                          <th scope="col">Username</th>
                          <th scope="col">Phone</th>
                          <th scope="col">Standard</th>
                          <th scope="col">Role</th>
                          <th scope="col">Active</th>
                        </tr>
                      </thead>
                      <tbody>
                      <#if users??>
                          <#assign count = 0>
                          <#list users as user>
                            <#assign count = count + 1>
                            <tr>
                              <td>${count}</td>
                              <td>${user.name}</td>
                              <td>${user.username}</td>
                              <td>${user.phone}</td>
                              <td>${user.standard}</td>
                              <td>${user.role}</td>
                              <td>${user.active}</td>
                              <td>
                                  <a class="confirm user-edit" data-toggle="modal" data-target="#userEditModal">Edit</a> |
                                  <a class="reject" href="/user/${user.id}/delete">Delete</a>
                                  <input type="hidden" class="userEditId" value="${user.id}" />
                                  <input type="hidden" class="userEditName" value="${user.name}" />
                                  <input type="hidden" class="userEditPenName" value="${user.penName}" />
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

<#assign pageTracker = "usersList">
<#include "footer.ftl">
