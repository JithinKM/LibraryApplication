<#macro admin_layout title="">
<!DOCTYPE html>
<html>
<head>
	<title><@spring.message "app.title"/><#if title?has_content> - ${title}</#if></title>
	
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/img/favicon.ico">
	
	<!-- CSS Libraries -->
	<link rel="stylesheet" href=<@spring.url '/css/bootstrap.min.css'/> type="text/css">
	<link rel="stylesheet" href=<@spring.url '/css/typeahead.css' /> type="text/css">
	<link rel="stylesheet" href=<@spring.url '/css/jquery-ui.css' /> type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css">
	
	<!-- Custom Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" type="text/css">
	
	<!-- Custom CSS -->
	<link rel="stylesheet" href="<@spring.url '/css/admin.css' />" type="text/css">
</head>

<body>

    <#include "nav.ftlh">
	<#nested>
	<#include "user_footer.ftlh">
	<#include "../modal/message_modal.ftlh">

    <!-- JavaScript Libraries -->
    <script src="<@spring.url '/js/jquery.min.js' />"></script>
    <script src="<@spring.url '/js/jquery-ui.js'/>"></script>
    <script src="<@spring.url '/js/bootstrap.min.js'/>"></script>
    <script src="<@spring.url '/js/jquery.validate.js' />"></script>
    <script src="<@spring.url '/js/typeahead.bundle.js'/>"></script>

    <!-- Custom JavaScript -->
    <script src="<@spring.url '/js/admin.js'/>"></script>
</body>
</html>
</#macro>