<#assign showMenuBar = false>
<#include "header.ftl">

          <div class="admin-body">
              <h3 class="main-title text-center">SIGN UP</h3>
              <div class="row">
                <div class="form-outer mx-auto">
                  <form role="form" id="signup-form">
                    <div class="form-group">
                      <label for="email">Email</label>
                      <input type="email" class="form-control" id="username" name="username" placeholder="Enter email" required tabindex="1">
                    </div>
                    <div class="form-group">
                      <label for="name">Name</label>
                      <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name" required tabindex="1">
                    </div>
                    <div class="form-group">
                      <label for="name">Class</label>
                      <input type="text" class="form-control" id="class" name="class" placeholder="Enter Class" required tabindex="1">
                    </div>
                    <label for="name">User Type</label>
                    <div class="form-group row form-radio">
                        <div class="form-check col-xs-6 col-sm-6">
                          <input class="form-check-input" type="radio" name="userType" id="teacher" value="teacher" checked>
                          <label class="form-check-label" for="teacher">
                            Teacher
                          </label>
                        </div>
                        <div class="form-check col-xs-6  col-sm-6 text-right">
                          <input class="form-check-input" type="radio" name="userType" id="student" value="student">
                          <label class="form-check-label" for="student">
                            Student
                          </label>
                        </div>
                    </div>
                    <div class="form-group">
                      <label for="adminLoginPassword">Password</label>
                      <input type="password" class="form-control" id="password" name="password" placeholder="Password" minlength="5" maxlength="50" required tabindex="2">
                    </div>
                    <div class="form-group row">
                        <button type="submit" id="signup-btn" class="btn btn-info col-md-4 yellow-main-btn text-uppercase" tabindex="3">
                        Sign Up
                        </button>
                        <div class="col-md-7 text-right">
                            <p id="login-link">Have an account? Login <a href="/user/login">here</a></p>
                        </div>
                    </div>
                  </form>
              </div>
          </div>

<#assign pageTracker = "adminSignup">
<#include "footer.ftl">
