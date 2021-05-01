<@base_layout title="Login">
<section class="admin-page">
    <div class="container-fluid main-container">
    <div class="row main-row">
    <div class="col-12 admin-main">
    <div class="admin-body">
        <h3 id="loginHead" class="main-title text-right" style="padding: 80px 10px 0px 10px;">LOGIN</h3>
        <div id="loginDiv" class="row margin-none" style="float: right; padding: 0px 10px 10px 10px;" >
            <div class="form-outer mx-auto">
                <form id="login-form" method="post" action="/login">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="loginUsername" name="username" placeholder="Enter username" required autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="adminLoginPassword">Password</label>
                        <input type="password" class="form-control" id="loginPassword" name="password" placeholder="Password" minlength="5" maxlength="50" required autocomplete="off">
                    </div>
                    <div class="form-group row">
                        <button type="submit" id="login-btn" class="btn btn-info col-md-4 yellow-main-btn text-uppercase">
                        Log In
                        </button>
                        <div class="col-md-7 text-right">
                            <p>Create your Library account <a id="signupLink">here</a></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <h3 id="signupHead" class="main-title text-right" style="padding: 20px 10px 0px 10px;display:none">SIGN UP</h3>
        <div id="signupDiv" class="row margin-none" style="float: right; padding: 0px 10px 10px 10px;display:none">
            <div class="form-outer mx-auto">
                <form id="signup-form"  method="post" action="/signup">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-lg-6 col-md-12">
                                <div class="form-group">
                                    <label for="firstName">First Name</label>
                                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter First Name" required autocomplete="off">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-12">
                                <div class="form-group">
                                    <label for="lastName">Last Name</label>
                                    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter Last Name" required autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-12">
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
                            </div>
                            <div class="col-lg-3 col-md-12">
                                <div class="form-group">
                                    <label for="standard">Standard</label>
                                    <select class="form-control" id="standard">
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
                                <div class="form-group">
                                    <label for="division">Division</label>
                                    <select class="form-control" id="division">
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
                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label for="userId">User ID</label>
                                    <input type="text" class="form-control" id="userId" name="userId" disabled autocomplete="off">
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
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <button type="submit" id="signup-btn" class="btn btn-success col-md-4 yellow-main-btn text-uppercase">
                                Sign Up
                            </button>
                            <div class="col-md-6 text-right">
                                <p>Have an account? <a id="loginLink">Login</a></p>
                            </div>
                        </div>
                </form>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    $("#loginLink").click(function() {
    $('#signupDiv').css({'display': 'none'});
    $('#signupHead').css({'display': 'none'});
    $('#loginDiv').css({'display': 'flex'});
    $('#loginHead').css({'display': 'block'});
    });

    $("#signupLink").click(function() {
    $('#loginDiv').css({'display': 'none'});
    $('#loginHead').css({'display': 'none'});
    $('#signupDiv').css({'display': 'flex'});
    $('#signupHead').css({'display': 'block'});
    });

</script>
</@base_layout>