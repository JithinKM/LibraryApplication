<#assign showMenuBar = false>
<#include "header.ftl">
<main>
    <div class="container text-center">
        <h4>Search for books or authors</h4>
        <div class="search-box">
            <form action="" class="search-form">
                <input type="text" placeholder="Search here..." id="search" autocomplete="off">
            </form>
            <svg class="search-border" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" viewBox="0 0 671 111" style="enable-background:new 0 0 671 111;"
                xml:space="preserve">
                <path class="border" d="M335.5,108.5h-280c-29.3,0-53-23.7-53-53v0c0-29.3,23.7-53,53-53h280"/>
                <path class="border" d="M335.5,108.5h280c29.3,0,53-23.7,53-53v0c0-29.3-23.7-53-53-53h-280"/>
            </svg>
            <div class="go-icon"><i class="fa fa-arrow-right"></i></div>
        </div>
        <div class="main-title">
            <h4>Available Books</h4>
        </div>
        <div class="row icon-boxes" id="book-list">
            <#if books??>
            <#list books as bookDetail>
            <div class="col-md-6 col-lg-4 book-entries">
                <div class="icon-box shadow rounded">
                    <div class="book-details">
                        <div class="book-details-inner">
                            <h5 class="title text-center book-filer"><a href="">${bookDetail.name}</a></h5>
                            <div class="row">
                                <div class="col-6">
                                    <p class="text-left">Author: </p>
                                </div>
                                <div class="col-6">
                                    <p class="text-right book-filer">${bookDetail.author.name}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <p class="text-left">Language: </p>
                                </div>
                                <div class="col-6">
                                    <p class="text-right">${bookDetail.language}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <p class="text-left">Category: </p>
                                </div>
                                <div class="col-6">
                                    <p class="text-right">${bookDetail.category}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <p class="text-left">Available copies: </p>
                                </div>
                                <div class="col-6">
                                    <p class="text-right">${bookDetail.count}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </#list>
            </#if>
        </div>
    </div>
</main>

<#assign pageTracker = "home">
<#include "footer.ftl">
