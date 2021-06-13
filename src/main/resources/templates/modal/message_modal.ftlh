<#if message??>
<button class="btn d-none" id="messageModalBtn" data-toggle="modal" data-target="#messageModal"></button>
<div class="modal fade text-danger" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content bg-${message.style} text-white">
            <div class="modal-header text-center">
                <h5 class="modal-title w-100">
                <#if message.style == "success"><i class="bi bi-hand-thumbs-up"></i><#else><i class="bi bi-x-octagon-fill"></i></#if>
                ${message.title}</h5>
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