<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/img/favicon.ico">

    <title>SHS Library App</title>

    <!-- Bootstrap core CSS -->
    <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/fontawesome.min.css" rel="stylesheet">
    <link href="/css/typeahead.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/admin.css" rel="stylesheet">
  </head>

  <body class="image-back">
    <!-- Navigation -->
    <nav class="navbar navbar-light navbar-expand-lg navbar-custom fixed-top">
      <a class="navbar-brand" href="/admin">Library Management</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item" id="signup">
            <a class="nav-link" href="/signup">Sign Up</a>
            </li>
            <li class="nav-item" id="login">
            <a class="nav-link" href="/login">Log In</a>
            </li>
            <li class="nav-item d-none onlyForLoggedIn" id="logout">
            <a class="nav-link" id="logoutLink">Log Out</a>
            </li>
        </ul>
      </div>
    </nav>

<section class="admin-page">
  <div class="container-fluid main-container">
    <div class="row main-row">
       
       
      <div class="col-12 admin-main">


          <div class="admin-body">
              <h3 class="main-title text-right" style="padding: 80px 10px 0px 10px;">LOGIN</h3>
              <div class="row margin-none" style="float: right; padding: 0px 10px 10px 10px;">
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
                            <p id="signup-link">Create your Library account <a href="/signup">here</a></p>
                        </div>
                    </div>
                  </form>
                </div>
              </div>
          </div>


         

      </div>
    </section>

    <input type="hidden" id="pageTracker" value="${pageTracker!""}" />
    <input type="hidden" id="loggedIn" value="" />

    <footer class="bd-footer">
        <div class="container-fluid p-2 p-md-2">
            <p>&copy; Sanskrit High School Vattoli, All rights reserved.<br>
            Designed and built with love by - <img class="footer-logo" src="/img/logo.png"></img> - 2006 Batch.</p>
        </div>
    </footer>

    <!--core JavaScript
    ================================================== -->
    <script src="/js/jquery.min.js"></script>
    <script src="/js/jquery-ui.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.validate.js"></script>
    <script src="/js/typeahead.bundle.js"></script>
    <!--Custom JavaScript
    ================================================== -->
    <script src="/js/admin.js"></script>
  </body>
</html>
