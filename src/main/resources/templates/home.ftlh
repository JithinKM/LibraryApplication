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
            <div class="go-icon"><i class="fa fa-arrow-right"></i></div>
        </div>
        <div class="row icon-boxes" id="book-list">
            <#if books??>
            <#list books as bookDetail>
            <div class="col-md-4 col-lg-2 book-entries zoom">
                <div class="icon-box shadow-lg">
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
                            <form role="form" action="/book/prebook" method="POST">
                                <input type="hidden" class="form-control" name="id" value="${bookDetail.id}">
                                <button type="submit" class="btn btn-info btn-sm book-now">BOOK NOW</button>
                            </form>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
            </#list>
            </#if>
            <div class="col-12">
                <nav>
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <li class="page-item active"><a class="page-link">1</a></li>
                        <li class="page-item"><a class="page-link">2</a></li>
                        <li class="page-item"><a class="page-link">3</a></li>
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
    </div>
</main>

<#assign pageTracker = "home">
<#include "footer.ftl">
