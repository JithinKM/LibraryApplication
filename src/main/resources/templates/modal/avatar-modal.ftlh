<div class="modal fade modal-blur" id="avatarModal" tabindex="-1" role="dialog" aria-hidden="true">
 <div class="modal-dialog modal-dialog-centered modal-md" role="document">
    <div class="modal-content">
       <div class="modal-header text-center">
          <h5 class="modal-title w-100"><@spring.message "modal.avatar.title"/></h5>
          <button type="button" class="close prebook-close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
          </button>
       </div>
       <div class="modal-body">
          <div class="col-12 avatar-outer">
            <div class="row">
            <#list 0..8 as i>
                <div class="col-4 avatar-img">
                    <div class="img-overlay">
                        <img class="rounded-circle w-100" src="../img/avatars/${i}.png" width="100">
                        <div class="col-12 mx-auto d-flex align-items-center change-avatar">
                            <a class="mx-auto avatar-select" data-toggle="modal" data-target="#avatarModal"><i class="bi bi-check"></i></a>
                        </div>
                    </div>
                </div>
            </#list>
            </div>
          </div>
          <a class="btn btn-sm btn-primary btn-block" id="applyAvatar">Apply</a>
       </div>
    </div>
 </div>
</div>
