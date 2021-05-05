<#assign showMenuBar = false>
<#include "header.ftl">
<main class="home-container justify-content-center">
    <div class="book-container text-center">
        <div class="search-box">
            <form action="" class="search-form">
                <input type="text" placeholder="Search for books or authors" id="search" autocomplete="off">
            </form>
            <svg class="search-border" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" viewBox="0 0 671 111" style="enable-background:new 0 0 671 111;"
                xml:space="preserve">
                <path class="border" d="M335.5,108.5h-280c-29.3,0-53-23.7-53-53v0c0-29.3,23.7-53,53-53h280"/>
                <path class="border" d="M335.5,108.5h280c29.3,0,53-23.7,53-53v0c0-29.3-23.7-53-53-53h-280"/>
            </svg>
        </div>
        <div class="row icon-boxes" id="book-list">
            <#if books??>
            <#list books as bookDetail>
            <div class="col-md-4 col-lg-2 book-entries zoom">
                <div class="icon-box book-shadow">
                    <div class="book-details book-details${(bookDetail?index) % 3}">
                        <div class="book-details-inner">
                            <h5 class="title text-center book-filer"><a>${bookDetail.name}</a></h5>
                            <div class="col-12 book-contents">
                                <div class="row text-center">
                                    <div class="col-12">
                                        <p class="book-filer"><i class="bi bi-pencil-square"></i>${bookDetail.author.name}</p>
                                    </div>
                                </div>
                                <div class="row text-center">
                                    <div class="col-12">
                                        <p><i class="bi bi-spellcheck"></i>${bookDetail.language}</p>
                                    </div>
                                </div>
                                <div class="row text-center">
                                    <div class="col-12">
                                        <p><i class="bi bi-journals"></i>${bookDetail.category}</p>
                                    </div>
                                </div>
                                <div class="row text-center">
                                    <div class="col-12">
                                        <p><i class="bi bi-stack"></i>${bookDetail.count} <#if bookDetail.count == 1>copy <#else> copies </#if>available</p>
                                    </div>
                                </div>
                            </div>
                            <#if bookDetail.count == 0>
                            <button type="button" class="btn btn-secondary btn-sm book-now" disabled>BOOK NOW</button>
                            <#else>
                                <input type="hidden" class="bookId" value="${bookDetail.id}">
                                <input type="hidden" class="bookName" value="${bookDetail.name}">
                                <button type="submit" class="btn btn-info btn-sm book-now" data-toggle="modal" data-target="#prebookModal">BOOK NOW</button>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
            </#list>
            </#if>
        </div>
        <div class="col-12">
            <nav>
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                    <li class="page-item page-item-number active"><a class="page-link">1</a></li>
                    <li class="page-item">
                        <a class="page-link" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</main>

<div class="modal fade" id="prebookModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close prebook-close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h5 class="text-center">Do you want to book <span id="bookName" class="text-bold"></span>?</h5>
                <form role="form" id="prebookForm" action="/book/block" method="POST">
                    <div class="form-group">
                        <input type="hidden" id="bookId" name="id">
                    </div>
                    <input type="submit" class="btn btn-sm btn-primary float-right" id="preBook" value="Yes"/>
                </form>
            </div>
        </div>
    </div>
</div>

<script id="bookListTemplate" type="text/x-jsrender">
    <div class="col-md-4 col-lg-2 book-entries zoom">
        <div class="icon-box book-shadow">
            <div class="book-details book-details{{:id % 3}}">
                <div class="book-details-inner">
                    <h5 class="title text-center book-filer"><a>{{:name}}</a></h5>
                    <div class="col-12 book-contents">
                        <div class="row text-center">
                            <div class="col-12">
                                <p class="book-filer"><i class="bi bi-pencil-square"></i>{{:author.name}}</p>
                            </div>
                        </div>
                        <div class="row text-center">
                            <div class="col-12">
                                <p><i class="bi bi-spellcheck"></i>{{:language}}</p>
                            </div>
                        </div>
                        <div class="row text-center">
                            <div class="col-12">
                                <p><i class="bi bi-journals"></i>{{:category}}</p>
                            </div>
                        </div>
                        <div class="row text-center">
                            <div class="col-12">
                                <p><i class="bi bi-stack"></i>{{:count}} {^{if count == 1}}copy {{else}} copies {{/if}}available</p>
                            </div>
                        </div>
                    </div>
                    {^{if count == 0}}
                    <button type="button" class="btn btn-secondary btn-sm book-now" disabled>BOOK NOW</button>
                    {{else}}
                        <input type="hidden" class="bookId" value="{{:id}}">
                        <input type="hidden" class="bookName" value="{{:name}}">
                        <button type="submit" class="btn btn-info btn-sm book-now" data-toggle="modal" data-target="#prebookModal">BOOK NOW</button>
                    {{/if}}
                </div>
            </div>
        </div>
    </div>
</script>

<#assign pageTracker = "home">
<input type="hidden" id="pageCount" value="${pageCount}" />
<#include "footer.ftl">
