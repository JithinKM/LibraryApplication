<@admin_layout title="Users">
<section class="admin-page">
   <div class="container-fluid main-container">
      <div class="row main-row">
         <#include "layout/sidebar.ftlh">
         <!-- Main missing here -->
         <div class="col-lg-10 col-md-10 col-sm-9 col-12 admin-main">
            <div class="container main-content text-center">
               <div class="panel panel-info list-title">
                  <div class="row d-flex justify-content-center">
                     <div class="col-xs-12 col-sm-4 panel-heading">
                        <div class="input-group search-form">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control text-center" id="filter-users" placeholder="Search users">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="bi bi-search"></i></span>
                                </div>
                            </div>
                        </div>
                     </div>
                  </div>
                  <div class="card mb-4">
                      <div class="row card-header">
                         <div class="col-12">
                            <h5 class="font-weight-bold"><i class="bi bi-person"></i>&nbsp;Users</h5>
                         </div>
                      </div>
                      <div class="card-body d-flex justify-content-center book-card">
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
      </div>
   </div>
</section>
</@admin_layout>