<#if searchedId??>
<button class="btn d-none" id="allottedBookModalBtn" data-toggle="modal" data-target="#allottedBookModal"></button>
<div class="modal fade" id="allottedBookModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <#if allottedBook??>
                <h4 class="modal-title book-modal-title">Allotted Book Details</h4>
                <#else>
                <h4 class="modal-title book-modal-title">Not Found</h4>
                </#if>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <#if allottedBook??>
                <p>${allottedBook.book.id}</p>
                <p>${allottedBook.status}</p>
                <#else>
                <h5><@spring.message "modal.bookUser.notFound"/>: ${searchedId}</h5>
                </#if>
            </div>
        </div>
    </div>
</div>
</#if>

