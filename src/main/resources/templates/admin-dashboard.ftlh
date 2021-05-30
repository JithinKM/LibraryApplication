<@admin_layout title="Dashboard">
<h5 class="admin-mobile-warning d-none">Please use a desktop device to view this site</h5>
<section class="admin-page">
   <div class="container-fluid main-container">
      <div class="row main-row">
         <#include "layout/sidebar.ftlh">
         <!-- Main missing here -->
         <div class="col-lg-10 col-md-10 col-sm-9 col-12 admin-main">
            <div class="container main-content text-center">
               <div id="content-wrapper" class="d-flex flex-column">
                  <div id="content">
                     <div class="container-fluid">
                        <div class="row dashboard-content">
                           <div class="col-xl-8 col-lg-7">
                              <div class="card">
                                 <div class="card-header flex-row align-items-center justify-content-between">
                                    <h6 class="font-weight-bold">Book Lending Requests</h6>
                                 </div>
                                 <div class="card-body overflow-auto">
                                    <div class="row">
                                       <#if bookreq??>
                                       <#list bookreq as bookUser>
                                       <div class="col-md-6 col-lg-4">
                                          <div class="card book-approve-card shadow">
                                             <div class="card-body book-approve-card-inner">
                                                <h6 class="card-title">${bookUser.book.bookDetails.name}</h6>
                                                <p class="card-text"><b>${bookUser.user.username}</b></p>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-6 book-approve-detail">
                                                        <p class="card-text"><i class="bi bi-card-list"></i>&nbsp;${bookUser.book.id}</p>
                                                    </div>
                                                    <div class="col-6 book-approve-detail">
                                                        <p class="card-text"><i class="bi bi-bookshelf"></i>&nbsp;${bookUser.book.rack}</p>
                                                    </div>
                                                </div>
                                                <input type="hidden" class="bookApproveId" value="${bookUser.id?string.computer}">
                                                <input type="hidden" class="bookName" value="${bookUser.book.bookDetails.name}">
                                                <input type="hidden" class="userName" value="${bookUser.user.username}">
                                                <input type="hidden" class="bookId" value="${bookUser.book.id}">
                                                <input type="hidden" class="bookCover" value="${bookUser.book.bookDetails.isbn}">
                                                <input type="hidden" class="status" value="${bookUser.status}">
                                                <hr>
                                                <a class="card-link bookApproveLink" data-toggle="modal"
                                                data-target="#bookApproveModal"><#if bookUser.status == "RENEW">Renew<#else>Assign</#if></a>
                                                <a class="card-link bookDeclineLink text-danger" data-toggle="modal" data-target="#bookDeclineModal">Decline</a>
                                             </div>
                                          </div>
                                       </div>
                                       </#list>
                                       </#if>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-xl-4 col-lg-5">
                              <div class="card mb-4">
                                 <div class="card-header flex-row align-items-center justify-content-between">
                                    <h6 class="font-weight-bold">New User Requests</h6>
                                 </div>
                                 <div class="card-body overflow-auto">
                                    <#if userreq??>
                                    <#list userreq as newuser>
                                    <div class="accordion" id="accordion${newuser.username}">
                                       <div class="accordion-item shadow-sm">
                                          <div class="accordion-header" data-toggle="collapse" data-target="#${newuser.username}" aria-expanded="true" aria-controls="${newuser.username}">
                                             <div class="row notification alert-info">
                                                <div class="col-5 notification-body">
                                                   ${newuser.userdetail.fullName}
                                                </div>
                                                <div class="col-3 notification-body">
                                                   <#if newuser.userdetail.student>${newuser.userdetail.standard} - ${newuser.userdetail.division}</#if>
                                                </div>
                                                <div class="col-4 float-right">
                                                   <input type="hidden" class="userId" value="${newuser.username}">
                                                   <a class="text-success user-approve" data-toggle="modal" data-target="#userApproveModal">
                                                   <i class="bi bi-check"></i>
                                                   </a>
                                                   <a class="text-danger user-decline" data-toggle="modal" data-target="#userDeclineModal">
                                                   <i class="bi bi-x"></i>
                                                   </a>
                                                </div>
                                             </div>
                                          </div>
                                          <div id="${newuser.username}" class="accordion-collapse collapse user-accordion" aria-labelledby="headingOne" data-bs-parent="#accordion${newuser.username}">
                                             <div class="accordion-body">
                                                <div class="col-12">
                                                   <div class="row">
                                                      <div class="col-6">
                                                         <h6 class="text-right">Name:</h6>
                                                      </div>
                                                      <div class="col-6 text-left">
                                                         ${newuser.userdetail.fullName}
                                                      </div>
                                                   </div>
                                                   <div class="row">
                                                      <div class="col-6">
                                                         <h6 class="text-right">Role:</h6>
                                                      </div>
                                                      <div class="col-6 text-left">
                                                         ${newuser.type}
                                                      </div>
                                                   </div>
                                                   <#if newuser.type?lower_case == 'student'>
                                                   <div class="row">
                                                      <div class="col-6">
                                                         <h6 class="text-right">Class:</h6>
                                                      </div>
                                                      <div class="col-6 text-left">
                                                         ${newuser.userdetail.standard} - ${newuser.userdetail.division}
                                                      </div>
                                                   </div>
                                                  </#if>
                                                   <div class="row">
                                                      <div class="col-6">
                                                         <h6 class="text-right">Phone:</h6>
                                                      </div>
                                                      <div class="col-6 text-left">
                                                         ${newuser.userdetail.phone}
                                                      </div>
                                                   </div>
                                                   <div class="row">
                                                      <div class="col-6">
                                                         <h6 class="text-right">Parent Name:</h6>
                                                      </div>
                                                      <div class="col-6 text-left">
                                                         ${newuser.userdetail.parentName}
                                                      </div>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    </#list>
                                    </#if>
                                 </div>
                              </div>
                           </div>
                            <div class="col-12 mb-4">
                               <div class="card mb-4">
                                  <div class="card-header">
                                     <h6 class="font-weight-bold">Recently Assigned Books</h6>
                                  </div>
                                  <div class="card-body">
                                     <table class="table table-hover" id="recentBooks">
                                        <thead>
                                           <tr>
                                              <th scope="col">Book Id</th>
                                              <th scope="col">Book Name</th>
                                              <th scope="col">Student</th>
                                              <th scope="col">Class</th>
                                              <th scope="col">Assigned Date</th>
                                              <th scope="col">Due Date</th>
                                           </tr>
                                        </thead>
                                        <tbody>
                                           <tr>
                                              <th scope="row">1</th>
                                              <td>Randamoozham</td>
                                              <td>John</td>
                                              <td>5-B</td>
                                              <td>21-May-2021</td>
                                              <td>4-Jun-2021</td>
                                           </tr>
                                           <tr>
                                              <th scope="row">2</th>
                                              <td>Ikigai</td>
                                              <td>Mark</td>
                                              <td>9-K</td>
                                              <td>15-May-2021</td>
                                              <td>29-May-2021</td>
                                           </tr>
                                           <tr>
                                              <th scope="row">2</th>
                                              <td>Sapiens</td>
                                              <td>Alice</td>
                                              <td>7-C</td>
                                              <td>2-Feb-2021</td>
                                              <td>16-Feb-2021</td>
                                           </tr>
                                        </tbody>
                                     </table>
                                  </div>
                               </div>
                            </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <#include "/modal/book-approve-modal.ftlh">
         <#include "/modal/book-decline-modal.ftlh">
         <#include "/modal/user-approve-modal.ftlh">
         <#include "/modal/user-decline-modal.ftlh">
         <#assign pageTracker = "adminDashboard">
      </div>
   </div>
</section>
</@admin_layout>