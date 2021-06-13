<@admin_layout title="Books">
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
                        <form role="form" action="/book" method="GET">
                            <div class="btn-group mb-3">
                                <input type="text" class="form-control text-center" name="keyword" placeholder="Search books or authors" minlength="3" autocomplete="off" required>
                                <button class="btn btn-secondary" type="submit" id="bookSearch"><i class="bi bi-search"></i></button>
                            </div>
                        </form>
                     </div>
                  </div>
                  <div class="card mb-4">
                      <div class="row card-header">
                         <div class="col-4">
                         </div>
                         <div class="col-4">
                            <h5 class="font-weight-bold"><i class="bi bi-book"></i>&nbsp;Books</h5>
                         </div>
                         <div class="col-4">
                            <a class="pull-right" data-toggle="modal" data-target="#bookAddModal">Add a new book</a>
                         </div>
                      </div>
                      <div class="card-body d-flex justify-content-center book-card">
                        <div class="table-responsive">
                           <table class="table" id="bookList">
                              <thead>
                                 <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Publication</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Language</th>
                                    <th scope="col">Available</th>
                                 </tr>
                              </thead>
                              <tbody id="bookListBody">
                                 <#if books??>
                                 <#list books as bookDetail>
                                 <tr class="accordion-toggle table-accordion" data-toggle="collapse" data-target="#table-accordion${bookDetail?index}" aria-controls="#table-accordion${bookDetail?index}">
                                    <td class="book-filter">${bookDetail.name}</td>
                                    <td class="book-filter">${bookDetail.author.name}</td>
                                    <td>${bookDetail.publication}</td>
                                    <td>${bookDetail.category}</td>
                                    <td>${bookDetail.language}</td>
                                    <td>${bookDetail.count}</td>
                                 </tr>
                                 <#if bookDetail.books?has_content>
                                 <tr class="table-collapse table-collapse-header">
                                    <td colspan="7" class="books-inner-table">
                                       <div class="book-accordion-inner collapse" id="table-accordion${bookDetail?index}"  data-parent="#bookList">
                                          <table class="table table-sm table-dark">
                                             <thead>
                                                <tr>
                                                   <th>#</th>
                                                   <th>Id</th>
                                                   <th>Contributed By</th>
                                                   <th>Price</th>
                                                   <th>Status</th>
                                                   <th>Rack</th>
                                                   <th>Purchased Date</th>
                                                   <th>Actions</th>
                                                </tr>
                                             </thead>
                                             <tbody>
                                                <#list bookDetail.books as book>
                                                <tr>
                                                   <td>${book?index + 1}</td>
                                                   <td>${book.id}</td>
                                                   <td>${book.contributedBy}</td>
                                                   <td>${book.price}</td>
                                                   <td>${book.status}</td>
                                                   <td>${book.rack}</td>
                                                   <td>${book.purchasedDate?date}</td>
                                                   <td>
                                                      <a class="confirm book-edit" data-toggle="modal" data-target="#bookEditModal">Edit</a>
                                                      <#if book.status != 'NOTAVAILABLE'> | <a class="reject" href="/book/delete/${book.id}">Delete</a></#if>
                                                      <input type="hidden" class="bookEditId" value="${book.id}" />
                                                      <input type="hidden" class="bookDetailEditId" value="${bookDetail.id?string.computer}" />
                                                      <input type="hidden" class="bookEditName" value="${bookDetail.name}" />
                                                      <input type="hidden" class="bookEditAuthorId" value="${bookDetail.author.id?string.computer}" />
                                                      <input type="hidden" class="bookEditAuthor" value="${bookDetail.author.name}" />
                                                      <input type="hidden" class="bookEditAuthorPenName" value="${bookDetail.author.penName}" />
                                                      <input type="hidden" class="bookEditCategory" value="${bookDetail.category}" />
                                                      <input type="hidden" class="bookEditLanguage" value="${bookDetail.language}" />
                                                      <input type="hidden" class="bookEditPublication" value="${bookDetail.publication}" />
                                                      <input type="hidden" class="bookEditRack" value="${book.rack}" />
                                                      <input type="hidden" class="bookEditContributed" value="${book.contributedBy}" />
                                                      <input type="hidden" class="bookEditPurchased" value="${book.purchasedDate?date?string.short}" />
                                                      <input type="hidden" class="bookEditPrice" value="${book.price?string.computer}" />
                                                   </td>
                                                </tr>
                                                </#list>
                                             </tbody>
                                          </table>
                                       </div>
                                    </td>
                                 </tr>
                                  </#if>
                                 </#list>
                                 </#if>
                              </tbody>
                           </table>
                        </div>
                     </div>
                     <div class="col-12">
                        <nav>
                           <ul class="pagination justify-content-center" id="books-pagination">
                           </ul>
                        </nav>
                     </div>
                  </div>
               </div>
            </div>
            </main>
         </div>
      </div>
      <!-- Modal -->
      <#include "/modal/add-book-modal.ftlh">
      <#include "/modal/edit-book-modal.ftlh">
      <#assign pageTracker = "booksList">
   </div>
   </div>
</section>
</@admin_layout>