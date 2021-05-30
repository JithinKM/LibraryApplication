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
             <form role="form" id="bookDeclineForm" method="GET">
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
                   <textarea type="text" class="form-control" id="assignComment" name="comment" autocomplete="off" rows="2" required></textarea>
                </div>
                <input type="hidden" id="bookUserIdDecline" name="bookUserId">
                <input type="submit" class="btn btn-sm btn-primary btn-block" id="assignBook" value="Decline"/>
             </form>
          </div>
       </div>
    </div>
 </div>
