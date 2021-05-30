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
             <form role="form" id="userApprovalForm" method="GET">
                 <label for="comment">Comment</label>
                 <textarea type="text" class="form-control" id="userApproveComment" name="comment" autocomplete="off" rows="2"></textarea>
                 <input type="submit" class="btn btn-sm btn-primary float-right text-white" id="approveUser" value="Yes">
             </form>
          </div>
       </div>
    </div>
 </div>
