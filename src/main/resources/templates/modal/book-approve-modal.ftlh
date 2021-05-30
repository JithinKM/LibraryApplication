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
             <form role="form" id="bookApprovalForm" method="GET">
                <div class="row">
                   <div class="col-5">
                       <div class="book-cover-div shadow"></div>
                   </div>
                   <div class="col-2 form-middle text-center">
                        <i class="bi bi-box-arrow-right"></i>
                   </div>
                   <div class="col-5">
                       <div class="profile-pic-div shadow"></div>
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
                   <div class="col-2">

                   </div>
                   <div class="col-5">
                      <div class="form-group">
                         <input type="text" class="form-control" id="userName" name="username" disabled value="">
                      </div>
                   </div>
                </div>
                <div class="form-group">
                   <textarea type="text" class="form-control" placeholder="comment" id="assignComment" name="comment" autocomplete="off" rows="2"></textarea>
                </div>
                <input type="hidden" id="bookUserId" name="bookUserId">
                <input type="submit" class="btn btn-sm btn-primary btn-block" id="assignBook" value="Approve"/>
             </form>
          </div>
       </div>
    </div>
 </div>
