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
                <input type="submit" class="btn btn-sm btn-primary float-right" id="assignBook" value="Approve"/>
             </form>
          </div>
       </div>
    </div>
 </div>
