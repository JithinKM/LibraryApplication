<#if searchedId??>
<button class="btn d-none" id="allottedBookModalBtn" data-toggle="modal" data-target="#allottedBookModal"></button>
<div class="modal fade" id="allottedBookModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <#if allottedBook??>
                <h4 class="modal-title book-modal-title w-100">Allotted Book Details</h4>
                <#else>
                <h4 class="modal-title book-modal-title w-100">Not Found</h4>
                </#if>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <#if allottedBook??>
                    <table class="table table-borderless">
                      <thead>
                        <tr>
                          <th scope="col">Book Id</th>
                          <th scope="col">Username</th>
                          <th scope="col">Allotted Date</th>
                          <th scope="col">Due/Return Date</th>
                          <th scope="col">Status</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th>${allottedBook.book.id}</th>
                          <th>${allottedBook.user.username}</th>
                          <td>${(allottedBook.allotedDate?date) ! "-"}</td>
                          <td>${(allottedBook.dueDate?date) ! "-"}</td>
                          <td>${allottedBook.status}</td>
                        </tr>
                      </tbody>
                    </table>
                <#else>
                    <h5><@spring.message "modal.bookUser.notFound"/>: ${searchedId}</h5>
                </#if>
                <a class="btn btn-sm btn-primary float-right" href="/book/return/${allottedBook.id?string.computer}">Return</a>
            </div>
        </div>
    </div>
</div>
</#if>

