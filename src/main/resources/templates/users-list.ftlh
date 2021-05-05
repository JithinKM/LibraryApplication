<#assign showMenuBar = true>
<#include "header.ftl">
<div class="col-lg-10 col-md-10 col-sm-9 col-12 admin-main">
    <div class="container main-content text-center">
        <div class="panel panel-info list-title">
            <div class="row">
                <div class="col-xs-12 col-sm-4 panel-heading">
                    <h3 class="panel-title float-left">Users</h3>
                </div>
                <div class="col-xs-12 col-sm-4 panel-heading">
                    <div class="input-group search-form">
                        <input type="text" class="form-control" id="filter-users" placeholder="Search users...">
                        </span>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <div class="justify-content-center">
                    <div class="table-responsive">
                        <table class="table table-hover" id="usersList">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Std-Div</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Role</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <#if users??>
                                <#list users as user>
                                <tr>
                                    <td>${user?index + 1}</td>
                                    <td>${user.username}</td>
                                    <td class="user-filter">${user.userdetail.firstname}&nbsp;${user.userdetail.lastname}</td>
                                    <td><#if user.userdetail.division != " ">${user.userdetail.standard}-${user.userdetail.division}</#if></td>
                                    <td>${(user.email)!}</td>
                                    <td>${(user.userdetail.phone)!}</td>
                                    <td>${(user.roleValues)!"[]"}</td>
                                    <td>${user.status}</td>
                                    <td>
                                        <a class="confirm user-edit" data-toggle="modal" data-target="#userEditModal">Edit</a> |
                                        <a class="reject" href="/user/ccc/delete">Disable</a>
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

<#assign pageTracker = "usersList">
<#include "footer.ftl">
