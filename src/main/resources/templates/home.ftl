<#assign showMenuBar = true>
<#include "header.ftl">

    <main>
        <div class="container text-center">
            <h2>Search for books, authors or even users by their name</h2>
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
            <hr>
            <div class="table-title">
                <h4>Here are some of the users joined recently.</h4>
                <h4>You can verify the details and activate their membership.</h4>
            </div>
            <div class="table-title">
                <h5><span class="label label-info">Teachers</span></h5>
            </div>
            <div class="row justify-content-center">
                <div class="col-auto">
                <table class="table table-responsive table-hover">
                  <thead class="thead-dark">
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">Name</th>
                      <th scope="col">Email</th>
                      <th scope="col">Class</th>
                      <th scope="col">Owned Books</th>
                      <th scope="col">Status</th>
                      <th scope="col">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">1</th>
                      <td>Mark</td>
                      <td>mark@gmail.com</td>
                      <td>IX</td>
                      <td>2</td>
                      <td>Inactive</td>
                      <td>
                          <a class="confirm" href="/user/confirm/id">Confirm</a> |
                          <a class="reject" href="/user/reject/id">Reject</a>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>Mark</td>
                      <td>mark@gmail.com</td>
                      <td>IX</td>
                      <td>2</td>
                      <td>Inactive</td>
                      <td>
                          <a class="confirm" href="/user/confirm/id">Confirm</a> |
                          <a class="reject" href="/user/reject/id">Reject</a>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td>Mark</td>
                      <td>mark@gmail.com</td>
                      <td>IX</td>
                      <td>2</td>
                      <td>Inactive</td>
                      <td>
                          <a class="confirm" href="/user/confirm/id">Confirm</a> |
                          <a class="reject" href="/user/reject/id">Reject</a>
                      </td>
                    </tr>
                  </tbody>
                </table>
                </div>
            </div>
            <div class="table-title">
                <h5><span class="label label-success">Students</span></h5>
            </div>
            <div class="row justify-content-center">
                <div class="col-auto">
                <table class="table table-responsive table-hover">
                  <thead class="thead-dark">
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">Name</th>
                      <th scope="col">Email</th>
                      <th scope="col">Class</th>
                      <th scope="col">Owned Books</th>
                      <th scope="col">Status</th>
                      <th scope="col">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">1</th>
                      <td>Mark</td>
                      <td>mark@gmail.com</td>
                      <td>IX</td>
                      <td>2</td>
                      <td>Inactive</td>
                      <td>
                          <a class="confirm" href="/user/confirm/id">Confirm</a> |
                          <a class="reject" href="/user/reject/id">Reject</a>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>Mark</td>
                      <td>mark@gmail.com</td>
                      <td>IX</td>
                      <td>2</td>
                      <td>Inactive</td>
                      <td>
                          <a class="confirm" href="/user/confirm/id">Confirm</a> |
                          <a class="reject" href="/user/reject/id">Reject</a>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td>Mark</td>
                      <td>mark@gmail.com</td>
                      <td>IX</td>
                      <td>2</td>
                      <td>Inactive</td>
                      <td>
                          <a class="confirm" href="/user/confirm/id">Confirm</a> |
                          <a class="reject" href="/user/reject/id">Reject</a>
                      </td>
                    </tr>
                  </tbody>
                </table>
                </div>
            </div>
            <hr>
        </div>
    </main>

<#assign pageTracker = "adminHome">
<#include "footer.ftl">
