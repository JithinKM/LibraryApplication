 <div class="modal fade" id="bookDeclineModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
       <div class="modal-content">
          <div class="modal-header text-center">
             <h4 class="modal-title w-100"><span id="bookNameDecline" class="text-bold"></span></h4>
             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
             </button>
          </div>
          <div class="modal-body">
             <form role="form" id="bookDeclineForm" method="GET">
                <div class="row">
                   <div class="col-5">
                      <div class="form-group">
                         <input type="text" class="form-control" id="bookIdDecline" disabled>
                      </div>
                   </div>
                   <div class="col-2 form-middle text-center">
                        <i class="bi bi-box-arrow-right"></i>
                   </div>
                   <div class="col-5">
                      <div class="form-group">
                         <input type="text" class="form-control" id="userNameDecline" name="username" disabled>
                      </div>
                   </div>
                </div>
                <div class="form-group">
                   <textarea type="text" class="form-control" placeholder="comment" name="comment" autocomplete="off" rows="2" required></textarea>
                </div>
                <input type="hidden" id="bookUserIdDecline" name="bookUserId">
                <input type="submit" class="btn btn-sm btn-primary btn-block" value="Decline"/>
             </form>
          </div>
       </div>
    </div>
 </div>
