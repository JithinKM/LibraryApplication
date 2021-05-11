            <input type="hidden" id="pageTracker" value="${pageTracker!""}" />
            <input type="hidden" id="loggedIn" value="" />
            <div class="col-12 bd-footer">
                <p>&copy; Sanskrit High School Vattoli, All rights reserved.<br>
                    Designed and built with love by - <img class="footer-logo" src="/img/logo.png"></img> - 2006 Batch.
                </p>
            </div>
        </div>
    </div>
</section>

<#if message??>
<button class="btn d-none" id="messageModalBtn" data-toggle="modal" data-target="#messageModal"></button>
<div class="modal fade text-danger" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content bg-${message.type} text-white">
            <div class="modal-header">
                <h5 class="modal-title">${message.title}</h5>
                <button type="button" class="close prebook-close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>${message.detail}</p>
            </div>
        </div>
    </div>
</div>
</#if>

<script src="/js/jquery.min.js"></script>
<script src="/js/jquery-ui.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.validate.js"></script>
<script src="/js/typeahead.bundle.js"></script>
<script src="/js/jsviews.min.js"></script>

<script src="/js/admin.js"></script>

</body>
</html>
