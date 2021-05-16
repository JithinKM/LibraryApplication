<@admin_layout title="Dashboard">
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
                        <div class="d-sm-flex align-items-center justify-content-between panel-heading">
                           <h3 class="panel-title float-left">Dashboard</h3>
                        </div>
                        <div class="row dashboard-content">
                           <div class="col-xl-8 col-lg-7">
                              <div class="card">
                                 <div class="card-header d-flex flex-row align-items-center justify-content-between">
                                    <h5 class="font-weight-bold main-title">Book Lending Requests</h5>
                                 </div>
                                 <div class="card-body overflow-auto">
                                    <div class="row">
                                       <#if bookreq??>
                                       <#list bookreq as bookUser>
                                       <div class="col-6">
                                          <div class="card bg-light">
                                             <div class="card-header">
                                                <h6 class="card-title">${bookUser.book.bookDetails.name}</h6>
                                                <div class="row">
                                                   <div class="col-6">
                                                      <p class="card-title">Book Id: ${bookUser.book.id}</p>
                                                   </div>
                                                   <div class="col-6">
                                                      <p class="card-title">Rack: ${bookUser.book.rack}</p>
                                                   </div>
                                                </div>
                                             </div>
                                             <div class="card-body">
                                                <input type="hidden" class="bookApproveId" value="${bookUser.id}">
                                                <input type="hidden" class="bookName" value="${bookUser.book.bookDetails.name}">
                                                <input type="hidden" class="userName" value="${bookUser.user.username}">
                                                <input type="hidden" class="bookId" value="${bookUser.book.id}">
                                                <input type="hidden" class="bookCover" value="${bookUser.book.bookDetails.isbn}">
                                                <p class="card-text">${bookUser.user.username} has requested this book.</p>
                                                <a class="card-link bookApproveLink" data-toggle="modal" data-target="#bookApproveModal">Approve</a>
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
                                 <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h5 class="font-weight-bold main-title">New User Requests</h5>
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
                                                   <a class="text-success" data-toggle="modal" data-target="#userApproveModal">
                                                   <i class="bi bi-check"></i>
                                                   </a>
                                                   <a class="text-danger" data-toggle="modal" data-target="#userDeclineModal">
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
                                                         <h6 class="text-right">Parent Name:</h6>
                                                      </div>
                                                      <div class="col-6 text-left">
                                                         ${newuser.userdetail.parentName}
                                                      </div>
                                                   </div>
                                                   <div class="row">
                                                      <div class="col-6">
                                                         <h6 class="text-right">Phone:</h6>
                                                      </div>
                                                      <div class="col-6 text-left">
                                                         ${newuser.userdetail.phone}
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
                        </div>
                        <div class="col-12 mb-4">
                           <div class="card mb-4">
                              <div class="card-header py-3">
                                 <h5 class="font-weight-bold main-title">Recently Assigned Books</h5>
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
         <div class="modal fade" id="bookApproveModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="modal-body">
                     <h5 class="text-center"><span id="bookName" class="text-bold"></span></h5>
                     <form role="form" id="bookApprovalForm" action="/book/request/approve" method="POST">
                        <div class="row">
                           <div class="col-5">
                              <img id="bookCover" class="book-cover-img" alt="Book cover">
                           </div>
                           <div class="col-1 form-middle">
                           </div>
                           <div class="col-6">
                              <img src="../img/profile.png" id="userPic" class="user-profile-img" alt="User Img">
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-5">
                              <div class="form-group">
                                 <input type="text" class="form-control" id="bookId" name="bookId" placeholder="Book Id" autocomplete="off" required>
                                 <input type="hidden" id="actualBookId">
                                 <label id="bookIdError" class="text-danger hide-element">Please enter the correct book id!</label>
                              </div>
                           </div>
                           <div class="col-1 form-middle">
                              <i class="bi bi-arrow-right-circle-fill"></i>
                           </div>
                           <div class="col-6">
                              <div class="form-group">
                                 <input type="text" class="form-control" id="userName" name="username" disabled value="">
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <label for="comment">Comment</label>
                           <textarea type="text" class="form-control" id="assignComment" name="comment" autocomplete="off" rows="2"></textarea>
                        </div>
                        <input type="hidden" id="bookUserId" name="bookUserId">
                        <input type="submit" class="btn btn-sm btn-primary float-right" id="assignBook" value="Assign"/>
                     </form>
                  </div>
               </div>
            </div>
         </div>
         <div class="modal fade" id="bookDeclineModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="modal-body">
                     <h5 class="text-center"><span id="bookNameDecline" class="text-bold"></span></h5>
                     <form role="form" id="bookDeclineForm" action="/book/request/decline" method="POST">
                        <div class="row">
                           <div class="col-5">
                              <div class="form-group">
                                 <input type="text" class="form-control" id="bookIdDecline" disabled>
                              </div>
                           </div>
                           <div class="col-1 form-middle">
                              <i class="bi bi-arrow-right-circle-fill"></i>
                           </div>
                           <div class="col-6">
                              <div class="form-group">
                                 <input type="text" class="form-control" id="userNameDecline" name="username" disabled>
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <label for="comment">Comment</label>
                           <textarea type="text" class="form-control" id="assignComment" name="comment" autocomplete="off" rows="2"></textarea>
                        </div>
                        <input type="hidden" id="bookUserIdDecline" name="bookUserId">
                        <input type="submit" class="btn btn-sm btn-primary float-right" id="assignBook" value="Decline"/>
                     </form>
                  </div>
               </div>
            </div>
         </div>
         <div class="modal fade" id="userApproveModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="modal-body">
                     <h5 class="text-center">Do you want to approve this user?</h5>
                     <a class="btn btn-sm btn-primary float-right text-white" id="approveUser">Yes</a>
                  </div>
               </div>
            </div>
         </div>
         <div class="modal fade" id="userDeclineModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="modal-body">
                     <h5 class="text-center">Do you want to decline this request?</h5>
                     <a class="btn btn-sm btn-primary float-right text-white" id="declineUser">Yes</a>
                  </div>
               </div>
            </div>
         </div>
         <#assign pageTracker = "adminDashboard">
      </div>
   </div>
</section>
</@admin_layout>