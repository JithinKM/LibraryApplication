<#assign showMenuBar = true>
<#include "header.ftl">

    <main>
        <div class="container text-center">
          <div class="form-section small-form">
            <h4 class="sub-header">Add Author</h4>
            <form role="form" id="authorAddForm">
              <div class="form-group">
                <label for="blogPostTitle">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter author name">
              </div>
              <div class="form-group">
                <label for="blogPostTitle">Pen Name</label>
                <input type="text" class="form-control" id="penName" name="penName" placeholder="Enter author pen-name">
              </div>
              <input type="submit" class="btn btn-primary   " id="addAuthor" value="Submit"/>
            </form>
          </div>
        </div>
    </main>

<#assign pageTracker = "authorsAdd">
<#include "footer.ftl">
