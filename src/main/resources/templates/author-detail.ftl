<#assign showMenuBar = true>
<#include "header.ftl">

<div class="container main-content justify-content-center">
    <#if author??>
    <div class="container text-center">
        <div class="row justify-content-center">
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <div class="caption">
                        <h3>${author.name}</h3>
                        <p>Pen name: ${author.penName}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="justify-content-center">
            <#if author.books??>
            <div class="panel panel-info list-title">
                <div class="panel-heading">
                    <h5 class="panel-title float-left">Books by ${author.name}</h5>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Author</th>
                                <th scope="col">Publication</th>
                                <th scope="col">Category</th>
                                <th scope="col">Language</th>
                                <th scope="col">Rack</th>
                                <th scope="col">Purchased on</th>
                                <th scope="col">Price</th>
                                <th scope="col">Available</th>
                            </tr>
                        </thead>
                        <tbody>
                            <#list author.books as book>
                            <tr>
                                <td>${book.id}</td>
                                <td>${book.name}</td>
                                <td>${author.name}</td>
                                <td>${book.publication}</td>
                                <td>${book.category}</td>
                                <td>${book.language}</td>
                                <td>${book.rack}</td>
                                <td>${book.purchased?date?string.short}</td>
                                <td>${book.price}</td>
                                <td>${book.available?string('Yes', 'No')}</td>
                            </tr>
                            </#list>
                        </tbody>
                    </table>
                </div>
            </div>
            </#if>
        </div>
        </#if>
    </div>
</div>
</main>
</div>
</div>

<#assign pageTracker = "authorDetail">
<#include "footer.ftl">
