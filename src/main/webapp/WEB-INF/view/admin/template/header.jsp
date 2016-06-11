<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<html ng-app="myApp">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/css/dashboard.css" rel="stylesheet">
    <!-- Data Table -->
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project name</a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <a href="/">Website</a>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <c:url var="logoutUrl" value="/logout"/>
                <form action="${logoutUrl}" method="post" class="navbar-form navbar-right">
                    <p style="color: white; display: inline">Welcome: ${pageContext.request.userPrincipal.name} |</p>
                    <button type="submit" class="btn btn-default" value="Logout">Logout</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </c:if>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="<spring:url value="/admin/" />">Overview <span class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="<spring:url value="/admin/homePageSettings" />">HomePage</a></li>
            </ul>
            <ul class="nav nav-sidebar">
            	<li><a href="/admin/hs/m">HomeSlider</a></li>
                <li><a href="/admin/pd/m">Products</a></li>
                <li><a href="/admin/cu/m"> Users</a></li>
                <li><a href="/admin/ca/m"> Category</a></li>
            </ul>
        </div>

        <script>
            $(document).ready(function(){
                var searchCondition = '${searchCondition}';

                $('.table').DataTable({
                    "lengthMenu": [15, 10, 8, 5, 3, 1],
                    "oSearch": {"sSearch": searchCondition}
                });
            });
        </script>
    </div>
</div>