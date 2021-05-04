<#assign showMenuBar = true>
<#include "header.ftl">
<div class="col-lg-10 col-md-10 col-sm-9 col-12 admin-main">
    <div class="container main-content text-center">
        <div class="panel panel-info list-title">
            <div class="row">
                <div class="col-xs-12 col-sm-4 panel-heading">
                    <h3 class="panel-title float-left">Authors</h3>
                </div>
                <div class="col-xs-12 col-sm-4 panel-heading">
                    <div class="input-group search-form">
                        <input type="text" class="form-control" id="filter-authors" placeholder="Search authors...">
                        </span>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-4 panel-heading">
                    <!-- Button trigger modal
                    <a class="panel-btn float-right" data-toggle="modal" data-target="#authorAddModal">
                    Add a new author
                    </a> -->
                </div>
            </div>
            <div class="panel-body">
                <div class="justify-content-center">
                    <div class="table-responsive">
                        <table class="table table-hover" id="authorsList">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Pen Name</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <#if authors??>
                                <#list authors as author>
                                <tr>
                                    <td>${author.id}</td>
                                    <td class="author-filter">${author.name}</td>
                                    <td class="author-filter">${author.penName}</td>
                                    <td>
                                        <a class="confirm author-edit" data-toggle="modal" data-target="#authorEditModal">Edit</a> |
                                        <a class="reject" href="/author/${author.id}/delete">Delete</a>
                                        <input type="hidden" class="authorEditId" value="${author.id}" />
                                        <input type="hidden" class="authorEditName" value="${author.name}" />
                                        <input type="hidden" class="authorEditPenName" value="${author.penName}" />
                                    </td>
                                </tr>
                                </#list>
                                </#if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="authorEditModal" tabindex="-1" role="dialog" aria-labelledby="authorEditModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Author</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" id="authorEditForm" action="/author" method="POST">
                    <div class="form-group">
                        <label for="blogPostTitle">Name</label>
                        <input type="text" class="form-control typeahead" id="editName" name="name" placeholder="Enter author name" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="blogPostTitle">Pen Name</label>
                        <input type="text" class="form-control" id="editPenName" name="penName" placeholder="Enter author pen-name" autocomplete="off">
                    </div>
                    <input type="hidden" class="form-control" id="editId" name="id">
                    <input type="submit" class="btn btn-primary float-right" id="editAuthor" value="Save"/>
                </form>
            </div>
        </div>
    </div>
</div>

<#assign pageTracker = "authorsList">
<#include "footer.ftl">
