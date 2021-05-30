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
             <form role="form" id="userDeclineForm" method="GET">
                 <label for="comment">Comment</label>
                 <textarea type="text" class="form-control" id="userDeclineComment" name="comment" autocomplete="off" rows="2" required></textarea>
                 <input type="submit" class="btn btn-sm btn-primary float-right text-white" id="declineUser" value="Yes">
             </form>
          </div>
       </div>
    </div>
 </div>
