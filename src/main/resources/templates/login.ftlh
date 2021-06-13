<@login_layout title="Login">
<section class="login-page">
    <div class="container-fluid main-container">
    <div class="row main-row">
    <div class="col-12 login-main">
    <div class="login-body">
        <div class="row">
            <div class="col-sm-12 col-md-7 d-flex justify-content-center">
                <div class="login-info text-center">
                    <div class="info-inner">
                        <h1><@spring.message "school.name"/></h1>
                        <h5><i class="bi bi-geo-alt-fill"></i>&nbsp;<@spring.message "school.address"/></h5>
                        <h5><i class="bi bi-telephone-fill"></i>&nbsp;<@spring.message "school.contact"/></h5>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-5">
                <div id="loginDiv" class="margin-none d-flex align-items-center">
                    <div class="form-outer mx-auto">
                        <form id="login-form" method="post" action="/login">
                            <h3 id="loginHead" class="main-title text-center">LOGIN</h3>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                                    </div>
                                    <input type="text" class="form-control" id="loginUsername" name="username" placeholder="Enter username" required autocomplete="off">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="adminLoginPassword">&nbsp;Password</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="bi bi-key-fill"></i></span>
                                    </div>
                                    <input type="password" class="form-control" id="loginPassword" name="password" placeholder="Password" minlength="5" maxlength="50" required autocomplete="off">
                                </div>
                            </div>
                            <div class="form-group row">
                                <button type="submit" id="login-btn" class="btn btn-info btn-block text-uppercase">
                                Log In
                                </button>
                                <div class="col-12 text-center">
                                    <p>Signup <a id="signupLink">here</a></p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div id="signupDiv" class="margin-none d-none align-items-center">
                    <div class="form-outer mx-auto">
                        <form id="signup-form"  method="post" action="/signup">
                            <h3 id="signupHead" class="main-title text-center">SIGN UP</h3>
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group">
                                            <label for="firstname">First Name</label>
                                            <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter First Name" required autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group">
                                            <label for="lastname">Last Name</label>
                                            <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter Last Name" required autocomplete="off">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-12">
                                        <label for="name">User Type</label>
                                        <div class="form-group row form-radio">
                                            <div class="form-check col-xs-6 col-sm-6">
                                                <input class="form-check-input" type="radio" name="type" id="teacher" value="TEACHER" checked>
                                                <label class="form-check-label" for="teacher">
                                                Teacher
                                                </label>
                                            </div>
                                            <div class="form-check col-xs-6  col-sm-6 text-right">
                                                <input class="form-check-input" type="radio" name="type" id="student" value="STUDENT">
                                                <label class="form-check-label" for="student">
                                                Student
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-12">
                                        <div class="form-group hide-element" id="standard-select">
                                            <label for="standard">Standard</label>
                                            <select class="form-control" id="standard" name="standard">
                                                <option selected>0</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                                <option>8</option>
                                                <option>9</option>
                                                <option>10</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-12">
                                        <div class="form-group hide-element" id="division-select">
                                            <label for="division">Division</label>
                                            <select class="form-control" id="division" name="division">
                                                <option>A</option>
                                                <option>B</option>
                                                <option>C</option>
                                                <option>D</option>
                                                <option>E</option>
                                                <option>F</option>
                                                <option>G</option>
                                                <option>H</option>
                                                <option>I</option>
                                                <option>J</option>
                                                <option>K</option>
                                                <option>L</option>
                                                <option>M</option>
                                                <option>N</option>
                                                <option>O</option>
                                                <option>P</option>
                                                <option>Q</option>
                                                <option>R</option>
                                                <option>S</option>
                                                <option>T</option>
                                                <option>U</option>
                                                <option>V</option>
                                                <option>W</option>
                                                <option>X</option>
                                                <option>Y</option>
                                                <option>Z</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                                                </div>
                                                <input type="text" class="form-control" id="username" name="username" placeholder="Username" disabled autocomplete="off">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group">
                                            <input type="date" class="form-control" id="dob" name="dob" placeholder="DOB" required autocomplete="off">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group">
                                            <label for="phone">Phone Number</label>
                                            <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone" required autocomplete="off">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group">
                                            <label for="password">Password</label>
                                            <input type="password" class="form-control" id="password" name="password" placeholder="Password" minlength="5" maxlength="50" required autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group">
                                            <label for="confirmPassword">Confirm Password</label>
                                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" minlength="5" maxlength="50" required autocomplete="off">
                                            <label id="passwordMatchError" class="text-danger hide-element">Passwords does not match!</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <button type="submit" id="signup-btn" class="btn btn-success btn-block text-uppercase">
                                        Sign Up
                                    </button>
                                    <div class="col-12 text-center">
                                        <p>Have an account? <a id="loginLink">Login</a></p>
                                    </div>
                                </div>
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</@login_layout>