<@user_layout title="Homepage">
<section class="admin-page">
   <div class="container-fluid main-container">
      <div class="row main-row">
         <main class="home-container justify-content-center">
           <div class="search-box">
              <form action="/home" class="search-form">
                 <input type="text" class="text-center" placeholder="Search: Book or Author" id="search" name="keyword"
                 autocomplete="off" value="${(keyword)!""}" minlength="3" required>
              </form>
              <svg class="search-border" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" viewBox="0 0 671 111" style="enable-background:new 0 0 671 111;"
                 xml:space="preserve">
                 <path class="border" d="M335.5,108.5h-280c-29.3,0-53-23.7-53-53v0c0-29.3,23.7-53,53-53h280"/>
                 <path class="border" d="M335.5,108.5h280c29.3,0,53-23.7,53-53v0c0-29.3-23.7-53-53-53h-280"/>
              </svg>
           </div>
           <#if keyword?has_content>
           <h6 class="w-100 text-center home-info"><@spring.message "homepage.searchBooks.message"/></h6>
           <#else>
           <h6 class="w-100 text-center home-info"><@spring.message "homepage.randomBooks.message"/></h6>
           </#if>
           <h6 class="w-100 text-center home-info-arrow bounce-3"><a href="#books" class="scrollto"><i class="bi bi-arrow-down-short"></i></a></h6>
           <svg class="hero-waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28 " preserveAspectRatio="none">
             <defs>
               <path id="wave-path" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z">
             </defs>
             <g class="wave1">
               <use xlink:href="#wave-path" x="50" y="3" fill="rgba(255,255,255, .1)">
             </g>
             <g class="wave2">
               <use xlink:href="#wave-path" x="50" y="0" fill="rgba(255,255,255, .2)">
             </g>
             <g class="wave3">
               <use xlink:href="#wave-path" x="50" y="9" fill="#fff">
             </g>
           </svg>
            <div id="books" class="book-container text-center">
               <div class="row icon-boxes" id="book-list">
                  <#if books??>
                  <#list books as bookDetail>
                  <div class="col-md-4 col-lg-2 book-entries zoom">
                     <div class="icon-box book-shadow">
                        <div class="book-details bg-cover"
                        <#if bookDetail.isbn?has_content>
                        style="background-image:url(http://covers.openlibrary.org/b/isbn/${bookDetail.isbn}-M.jpg);"
                        <#else>
                        style="background-image:url(../img/book-cover.png);"
                        </#if>
                        >
                        <div class="book-details-inner d-flex flex-column">
                           <h6 class="title text-center book-filter bookName"><a>${bookDetail.name}</a></h6>
                           <div class="col-12 book-contents position-absolute shadow arrow-top d-none">
                              <div class="row text-left">
                                 <div class="col-12">
                                    <p class="book-filter"><i class="bi bi-pencil-square"></i>${bookDetail.author.name}</p>
                                 </div>
                              </div>
                              <div class="row text-left">
                                 <div class="col-12">
                                    <p><i class="bi bi-spellcheck"></i>${bookDetail.language}</p>
                                 </div>
                              </div>
                              <div class="row text-left">
                                 <div class="col-12">
                                    <p><i class="bi bi-journals"></i>${bookDetail.category}</p>
                                 </div>
                              </div>
                              <div class="row text-left">
                                 <div class="col-12">
                                    <p><i class="bi bi-stack"></i>${bookDetail.count} <#if bookDetail.count == 1>copy <#else> copies </#if>available</p>
                                 </div>
                              </div>
                           </div>
                           <div class="mt-auto">
                               <div class="btn-group" role="group">
                                  <#if bookDetail.count gt 1>
                                  <button type="button" class="btn btn-sm btn-success disabled count-btn">${bookDetail
                                  .count}</button>
                                  <#elseif bookDetail.count == 1>
                                  <button type="button" class="btn btn-sm btn-warning disabled count-btn">${bookDetail.count}</button>
                                  <#else>
                                  <button type="button" class="btn btn-sm btn-secondary disabled count-btn">${bookDetail.count}</button>
                                  </#if>
                                  <#if bookDetail.count == 0>
                                  <button type="button" class="btn btn-secondary btn-sm book-now" disabled>BOOK NOW</button>
                                  <#else>
                                  <input type="hidden" class="bookId" value="${bookDetail.id?string.computer}">
                                  <input type="hidden" class="bookName" value="${bookDetail.name}">
                                  <button type="submit" class="btn btn-primary btn-sm book-now" data-toggle="modal" data-target="#prebookModal">BOOK NOW</button>
                                  </#if>
                               </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               </#list>
               </#if>
            </div>
            <div class="col-12">
            </div>
      </div>
      </main>
      <#include "/modal/prebook-modal.ftlh">
      <#assign pageTracker = "home">
   </div>
   </div>
</section>
</@user_layout>
