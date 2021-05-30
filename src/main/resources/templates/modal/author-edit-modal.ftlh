 <div class="modal fade" id="authorEditModal" tabindex="-1" role="dialog" aria-labelledby="authorEditModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
       <div class="modal-content">
          <div class="modal-header">
             <h5 class="modal-title">Edit Author</h5>
             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
             </button>
          </div>
          <div class="modal-body">
             <form role="form" id="authorEditForm" action="/author" method="POST">
                <div class="form-group">
                   <label for="blogPostTitle">Name</label>
                   <input type="text" class="form-control typeahead" id="editName" name="name" placeholder="Enter author name" autocomplete="off">
                </div>
                <div class="form-group">
                   <label for="blogPostTitle">Pen Name</label>
                   <input type="text" class="form-control" id="editPenName" name="penName" placeholder="Enter author pen-name" autocomplete="off">
                </div>
                <input type="hidden" class="form-control" id="editId" name="id">
                <input type="submit" class="btn btn-primary btn-block" id="editAuthor" value="Save"/>
             </form>
          </div>
       </div>
    </div>
 </div>