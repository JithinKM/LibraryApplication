<#if message??>
<button class="btn" id="messageModalBtn" data-toggle="modal" data-target="#messageModal"></button>
<div class="modal fade text-danger" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content bg-${message.style} text-white">
            <div class="modal-header">
                <h5 class="modal-title">${message.title}</h5>
                <button type="button" class="close prebook-close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>${message.details}</p>
            </div>
        </div>
    </div>
</div>
</#if>