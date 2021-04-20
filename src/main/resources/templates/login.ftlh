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
			            <button type="submit" id="signup-btn" class="btn btn-success col-md-4 yellow-main-btn text-uppercase" tabindex="3">
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
