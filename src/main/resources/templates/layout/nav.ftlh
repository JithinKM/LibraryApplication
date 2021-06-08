<!-- Navigation Bar-->
<#assign random = .now?long % 10>
<nav class="navbar navbar-light navbar-expand-lg navbar-custom fixed-top">
  <a class="navbar-brand" href="/home"><@spring.message "app.title"/></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarResponsive">
    <ul class="navbar-nav ml-auto">
        <li class="nav-item" id="profile">
            <#assign userName = Session.SPRING_SECURITY_CONTEXT.authentication.principal.getFullName()>
            <a class="nav-link" href="/user/profile">
                <img src="../img/avatars/${random}.png" alt="profilePic" class="rounded-circle" width="25"/>
                ${userName}
            </a>
        </li>
        <li class="nav-item">
        <a class="nav-link" href="/logout">Logout</a>
        </li>
    </ul>
  </div>
</nav>