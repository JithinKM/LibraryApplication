<@admin_layout title="Authors">
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
                        <form role="form" action="/author" method="GET">
                            <div class="btn-group mb-3">
                                <input type="text" class="form-control text-center" name="keyword" placeholder="Search authors" minlength="3" autocomplete="off" required>
                                <button class="btn btn-secondary" type="submit" id="authorSearch"><i class="bi bi-search"></i></button>
                            </div>
                        </form>
                     </div>
                  </div>
                  <div class="card mb-4">
                      <div class="row card-header">
                         <div class="col-12">
                            <h5 class="font-weight-bold"><i class="bi bi-pen"></i>&nbsp;Authors</h5>
                         </div>
                      </div>
                      <div class="card-body d-flex justify-content-center book-card">
                        <div class="table-responsive">
                           <table class="table table-hover" id="authorsList">
                              <thead>
                                 <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Pen Name</th>
                                    <th scope="col">Actions</th>
                                 </tr>
                              </thead>
                              <tbody id="authorsListBody">
                                 <#if authors??>
                                 <#list authors as author>
                                 <tr>
                                    <td>${author?index + 1}</td>
                                    <td class="author-filter">${author.name}</td>
                                    <td class="author-filter">${author.penName}</td>
                                    <td>
                                       <a class="confirm author-edit" data-toggle="modal" data-target="#authorEditModal">Edit</a> |
                                       <a class="reject" href="/author/id/${author.id?string.computer}">Delete</a>
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
                     <div class="col-12">
                        <nav>
                           <ul class="pagination justify-content-center" id="authors-pagination">
                           </ul>
                        </nav>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <#include "/modal/author-edit-modal.ftlh">
         <#assign pageTracker = "authorsList">
      </div>
   </div>
</section>
</@admin_layout>