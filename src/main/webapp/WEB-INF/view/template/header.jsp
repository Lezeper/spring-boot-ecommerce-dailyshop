<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html ng-app="myApp">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Daily Shop | Home</title>

    <!-- Font awesome -->
    <link href="/css/font-awesome.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="/css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
    <!-- product view slider -->
    <link rel="stylesheet" type="text/css" href="/css/jquery.simpleLens.css">
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="/css/slick.css">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="/css/nouislider.css">
    <!-- Theme color -->
    <link id="switcher" href="/css/theme-color/default-theme.css" rel="stylesheet">
    <!-- Top Slider CSS -->
    <link href="/css/sequence-theme.modern-slide-in.css" rel="stylesheet" media="all">

    <!-- Main style sheet -->
    <link href="/css/style.css" rel="stylesheet">

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>

    <link href="/css/custom.css" rel="stylesheet">

    <!-- jQuery library -->
    <script src="/js/jquery.min.js" ></script>
</head>
<body>
<!-- wpf loader Two -->
<div id="wpf-loader-two">
    <div class="wpf-loader-two-inner">
        <span>Loading</span>
    </div>
</div>
<!-- / wpf loader Two -->
<!-- SCROLL TOP BUTTON -->
<a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
<!-- END SCROLL TOP BUTTON -->


<!-- Start header section -->
<header id="aa-header">
    <!-- start header top  -->
    <div class="aa-header-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="aa-header-top-area">
                        <!-- start header top left -->
                        <div class="aa-header-top-left">
                            <!-- start language -->
                            <div class="aa-language">
                                <div class="dropdown">
                                    <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                        <img src="/img/flag/english.jpg" alt="english flag">ENGLISH
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                        <li><a href="#"><img src="/img/flag/english.jpg" alt="">ENGLISH</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- / language -->
                            <a class="btn dropdown-toggle" href="#" style="margin-top: -1px">Daily Deals</a>
                        </div>
                        <!-- / header top left -->
                        <div class="aa-header-top-right">
                            <ul class="aa-head-top-nav-right">
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <li><a href="#" style="cursor: default">Welcome: ${customerName_}</a></li>
                                    <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
                                        <li><a href="/admin/">Admin</a></li>
                                    </c:if>
                                    <li><a href="/customer/account" >My Account</a> </li>
                                    <li><a href="/logout" >Logout</a></li>
                                </c:if>
                                <c:if test="${pageContext.request.userPrincipal.name == null}">
                                    <li><a href="" data-toggle="modal" data-target="#login-modal" class="btn dropdown-toggle">Login</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- / header top  -->

    <!-- start header bottom  -->
    <div class="aa-header-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="aa-header-bottom-area">
                        <!-- logo  -->
                        <div class="aa-logo">
                            <!-- Text based logo -->
                            <a href="/">
                                <span class="fa fa-shopping-cart"></span>
                                <p>daily<strong>Shop</strong> <span>Your Shopping Partner</span></p>
                            </a>
                        </div>
                        <!-- / logo  -->
                        <!-- cart box -->
                        <div class="aa-cartbox" ng-controller="cartCtrl">
                            <a class="aa-cart-link" href="<spring:url value="/customer/cart" />">
                                <span class="fa fa-shopping-basket"></span>
                                <span class="aa-cart-title">SHOPPING CART</span>
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                	<div ng-init="refreshCart()"></div>
                                    <span class="aa-cart-notify">{{cart.cartItems.length}}</span>
                                </c:if>
                            </a>
                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                                <div class="aa-cartbox-summary">
                                    <ul>
                                        <li ng-repeat="item in cart.cartItems">
                                            <a class="aa-cartbox-img"><img src="/images/{{item.product.productId}}/0.png" alt="img"></a>
                                            <div class="aa-cartbox-info">
                                                <h4><a href="/products/viewProduct/{{item.product.productId}}">{{item.product.productName}}</a></h4>
                                                <p>{{item.quantity}} x $ {{item.product.productPrice}}</p>
                                            </div>
                                            <a class="aa-remove-product" href="#" ng-click="removeFromCart(item.cartItemId,'${_csrf.parameterName}=${_csrf.token}')">
                                                <span class="fa fa-times"></span>
                                            </a>
                                        </li>
                                        <li>
                                            <span class="aa-cartbox-total-title">Total</span>
                                            <span class="aa-cartbox-total-price">$ {{calGrandTotal()}}</span>
                                        </li>
                                    </ul>
                                    <a class="aa-cartbox-checkout aa-primary-btn" href="/checkout">Checkout</a>
                                </div>
                            </c:if>
                        </div>
                        <!-- / cart box -->
                        <!-- search box -->
                        <form ng-submit="search()" ng-controller="searchCtrl">
	                        <div class="aa-search-box">
		                        <input type="text" ng-model="keyword" placeholder="Product Name">
		                        <button type="submit" style="width: 50px; height: 40px" class="fa fa-search"></button>
	                        </div>
                        </form>
                        <!-- / search box -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- / header bottom  -->
</header>
<!-- / header section -->
<!-- menu -->
<section id="menu">
    <div class="container">
        <div class="menu-area">
            <!-- Navbar -->
            <div class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="navbar-collapse collapse">
                    <!-- Left nav -->
                    <ul class="nav navbar-nav">
                        <li><a href="/">Home</a></li>
                        <li><a href="/pd/s?mc=men">Men <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/pd/s?mc=men&sc=trousers">Trousers</a></li>
                                <li><a href="/pd/s?mc=men&sc=t-shirt">T-Shirt</a></li>
                                <li><a href="/pd/s?mc=men&sc=shoes">Shoes</a></li>
                                <!--<li><a href="#">And more.. <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Sandals</a></li>
                                        <li><a href="#">Loafers</a></li>
                                    </ul>
                                </li>-->
                            </ul>
                        </li>
                        <li><a href="<spring:url value="/pd/s?mc=women"/>">Women <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/pd/s?mc=women&sc=shirtdress">Shirtdress</a></li>
                                <li><a href="/pd/s?mc=women&sc=jeans">Jeans</a></li>
                                <li><a href="/pd/s?mc=women&sc=shoes">Shoes</a></li>
                            </ul>
                        </li>
                        <li><a href="/contact">Contact</a></li>
                        <li><a href="#">Pages <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="<spring:url value="/pd/s" />">All Products</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>
    </div>
</section>
<!-- / menu -->