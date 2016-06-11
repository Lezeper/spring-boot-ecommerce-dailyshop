<%@include file="/WEB-INF/view/template/header.jsp"%>

<section id="aa-catg-head-banner">
    <img src="<spring:url value="/resources/img/fashion/fashion-header-bg-8.jpg" />" alt="fashion img">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>${category}</h2>
            </div>
        </div>
    </div>
</section>

<!-- product category -->
<section id="aa-product-category" ng-app="cartApp"  ng-controller="cartCtrl">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
                <div class="aa-product-catg-content">
                    <div class="aa-product-catg-head">
                        <div class="aa-product-catg-head-left">
                            <form action="" class="aa-sort-form">
                                <label for="">Sort by</label>
                                <select name="">
                                    <option value="1" selected="Default">Default</option>
                                    <option value="2">Name</option>
                                    <option value="3">Price</option>
                                    <option value="4">Date</option>
                                </select>
                            </form>
                            <form action="" class="aa-show-form">
                                <label for="">Show</label>
                                <select id="numberShows">
                                    <option>6</option>
                                    <option>9</option>
                                    <option>12</option>
                                </select>
                            </form>
                        </div>
                        <div class="aa-product-catg-head-right">
                            <a id="grid-catg" href="#"><span class="fa fa-th"></span></a>
                            <a id="list-catg" href="#"><span class="fa fa-list"></span></a>
                        </div>
                    </div>
                    <div class="aa-product-catg-body">
                        <ul class="aa-product-catg">
                            <!-- start single product item -->
                            <c:forEach items="${products}" var="product">
                                <li>
                                    <figure>
                                        <a class="aa-product-img" href="<c:url value="/products/viewProduct/${product.productId}" />">
                                            <img style="width: 250px; height: 300px" src="<c:url value="/resources/images/${product.productId}/0.png" />" alt="polo shirt img"></a>
                                        <a class="aa-add-card-btn" href="<spring:url value="/customer/cart"/>" ng-click="addToCart('${product.productId}')">
                                            <span class="fa fa-shopping-cart"></span>Add To Cart
                                        </a>
                                        <figcaption>
                                            <h4 class="aa-product-title"><a href="#">${product.productName}</a></h4>
                                            <span class="aa-product-price">$${product.productPrice}</span><span class="aa-product-price"><del>$9999</del></span>
                                            <span class="aa-product-descrip">${product.productSummary}</span>
                                        </figcaption>
                                    </figure>
                                    <!-- product badge -->
                                    <span class="aa-badge aa-sale" href="#">SALE!</span>
                                    <!--<span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                    <span class="aa-badge aa-hot" href="#">HOT!</span>-->
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="aa-product-catg-pagination">
                        <nav>
                            <ul class="pagination">
                                <c:if test="${page gt 1}">
                                    <li>
                                        <a href="<my:replaceParam name='p' value='${page-1}' />" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:set var="count" value="1" scope="page" />
                                <c:forEach begin="1" end="${pageTotal}" varStatus="loop">
                                    <c:if test="${count eq page}">
                                        <li>
                                            <a style="background-color: #ff6666; color: white;"
                                               href="<my:replaceParam name='p' value='${count}' />">${count}
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${count ne page}">
                                        <li>
                                            <a href="<my:replaceParam name='p' value='${count}' />">${count}</a>
                                        </li>
                                    </c:if>
                                    <c:set var="count" value="${count + 1}" scope="page"/>
                                </c:forEach>

                                <c:if test="${page lt pageTotal}">
                                    <li>
                                        <a href="<my:replaceParam name='p' value='${page+1}' />" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-4 col-md-pull-9">
                <aside class="aa-sidebar">
                    <!-- single sidebar -->
                    <div class="aa-sidebar-widget">
                        <h3>Category</h3>
                        <ul class="aa-catg-nav">
                            <li><a href="<my:replaceParam name='c' value='activewear' />">Activewear</a></li>
                            <li><a href="<my:replaceParam name='c' value='jeans' />">Jeans</a></li>
                            <li><a href="<my:replaceParam name='c' value='shirtdress' />">Shirtdress</a></li>
                            <li><a href="<my:replaceParam name='c' value='coats' />">Coats</a></li>
                            <li><a href="<my:replaceParam name='c' value='shorts' />">Shorts</a></li>
                        </ul>
                    </div>
                    <!-- single sidebar -->
                    <div class="aa-sidebar-widget">
                        <h3>Tags</h3>
                        <div class="tag-cloud">
                            <a href="<my:replaceParam name='t' value='trousers' />">Trousers</a>
                            <a href="<my:replaceParam name='t' value='jeans' />">Jeans</a>
                            <a href="<my:replaceParam name='t' value='shirtdress' />">Shirtdress</a>
                            <a href="<my:replaceParam name='t' value='t-shirt' />">T-Shirt</a>
                        </div>
                    </div>
                    <!-- single sidebar -->
                    <div class="aa-sidebar-widget">
                        <h3>Shop By Price</h3>
                        <!-- price range -->
                        <div class="aa-sidebar-price-range">
                            <div>
                                <div id="price-slider" class="noUi-target noUi-ltr noUi-horizontal noUi-background">
                                </div>
                                <br>
                                <input id="skip-value-lower" class="aa-filter-btn" style="background-color: white;
                                color: black; text-align: center; cursor: default" value="30" type="button"/>
                                <input id="skip-value-upper" class="aa-filter-btn" style="background-color: white;
                                color: black; text-align: center; cursor: default" value="100" type="button" />
                                <a href="#"><button class="aa-filter-btn" type="submit">Filter</button></a>
                            </div>
                        </div>

                    </div>
                    <!-- single sidebar -->
                    <div class="aa-sidebar-widget">
                        <h3>Recently Views</h3>
                        <div class="aa-recently-views">
                            <ul>
                                <li>
                                    <a href="#" class="aa-cartbox-img"><img alt="img" src="img/woman-small-2.jpg"></a>
                                    <div class="aa-cartbox-info">
                                        <h4><a href="#">Product Name</a></h4>
                                        <p>1 x $250</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </div>
</section>
<!-- / product category -->

<%@include file="/WEB-INF/view/template/footer.jsp"%>