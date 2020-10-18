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
    <link href="/css/typeahead.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/admin.css" rel="stylesheet">
  </head>

  <body>
    <!-- Navigation -->
    <nav class="navbar navbar-light navbar-expand-lg navbar-custom fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/admin">SHS Library App</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item" id="signup">
            <a class="nav-link" href="/user/signup">Sign Up</a>
            </li>
            <li class="nav-item" id="login">
            <a class="nav-link" href="/user/login">Log In</a>
            </li>
            <li class="nav-item d-none onlyForLoggedIn" id="logout">
            <a class="nav-link" id="logoutLink">Log Out</a>
            </li>
        </ul>
      </div>
    </div>
    </nav>

<section class="admin-page">
  <div class="container-fluid main-container">
    <div class="row main-row">
      <div class="col-lg-2 col-md-2 col-sm-3 col-4 sidebar">
        <ul class="nav-sidebar admin-nav-bar">
          <li class="${menuSelectDashboard!""}"><a href="/admin">Dashboard</a></li>
          <hr class="sidebar-divider">
          <li class="${menuSelectBlogs!""}"><a href="/book/list">Books</a></li>
          <li class="${menuSelectGuides!""}"><a href="/author/list">Authors</a></li>
          <li class="${menuSelectGuides!""}"><a href="/user/list">Users</a></li>
          <hr class="sidebar-divider">
        </ul>
      </div>
      <div class="col-lg-10 col-md-10 col-sm-9 col-8">
