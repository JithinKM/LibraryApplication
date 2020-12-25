<#assign showMenuBar = false>
<#include "header.ftl">

        <main>
          <div class="admin-body">
              <h3 class="main-title text-center">LOGIN</h3>
              <div class="row margin-none">
                <div class="form-outer mx-auto">
                  <form role="form" id="login-form">
                    <div class="form-group">
                      <label for="email">Email</label>
                      <input type="email" class="form-control" id="username" name="username" placeholder="Enter email" required tabindex="1">
                    </div>
                    <div class="form-group">
                      <label for="adminLoginPassword">Password</label>
                      <input type="password" class="form-control" id="password" name="password" placeholder="Password" minlength="5" maxlength="50" required tabindex="2">
                    </div>
                    <div class="form-group row">
                        <button type="submit" id="login-btn" class="btn btn-info col-md-4 yellow-main-btn text-uppercase" tabindex="3">
                        Log In
                        </button>
                        <div class="col-md-7 text-right">
                            <p id="signup-link">Create your account <a href="/user/signup">here</a></p>
                        </div>
                    </div>
                  </form>
                </div>
              </div>
          </div>
        </main>

<#assign pageTracker = "adminLogin">
<#include "footer.ftl">
