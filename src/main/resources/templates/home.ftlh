<#assign showMenuBar = true>
<#include "header.ftl">

<main>
    <div class="container text-center">
        <h2>Search for books or authors</h2>
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
    </div>
</main>

<#assign pageTracker = "home">
<#include "footer.ftl">