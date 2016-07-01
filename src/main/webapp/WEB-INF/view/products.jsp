<%@include file="/WEB-INF/view/template/header.jsp"%>

<section id="aa-catg-head-banner">
    <img src="<spring:url value="/img/fashion/fashion-header-bg-8.jpg" />" alt="fashion img">
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
                                <select onchange="sortBy(this)">
                                    <option selected>Default</option>
                                    <option value="<my:replaceParam name='st' value='0' />">Price Ascending</option>
                                    <option value="<my:replaceParam name='st' value='1' />">Price Descending</option>
                                </select>
                            </form>
                            <form action="" class="aa-show-form">
                                <label for="numberShows">Show</label>
                                <select id="numberShows" onchange="rePagination(${products.size()})">
                                    <option>3</option>
                                    <option selected>6</option>
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
                            <c:set var="counter" value="0" scope="page" />
                            <c:forEach items="${products}" var="product">
                                <c:set var="counter" value="${counter + 1}" scope="page"/>
                                <li id="product-li-number-${counter}">
                                    <figure>
                                        <a class="aa-product-img" href="/pd/p?id=${product.productId}">
                                            <img style="width: 250px; height: 300px" src="/images/${product.productId}/0.png"></a>
                                        <a class="aa-add-card-btn" style="cursor: hand" ng-click="addToCart('${product.productId}','${_csrf.parameterName}=${_csrf.token}')">
                                            <span class="fa fa-shopping-cart"></span>Add To Cart
                                        </a>
                                        <figcaption>
                                            <h4 class="aa-product-title"><a href="/pd/p?id=${product.productId}">${product.productName}</a></h4>
                                            <span class="aa-product-price">$${product.productPrice}</span><span class="aa-product-price"><del>$999</del></span>
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
                    <input type="hidden" id="current-page-number" value="1">
                    <script>
                        $(document).ready(function (){
                            var page = 1;
                            var productNumbers = ${products.size()};
                            var selectedShows = parseInt($("#numberShows").find(":selected").text(), 10);
                            var pageTotal = Math.ceil(productNumbers/selectedShows);

                            for ( var j = 1; j <= (page-1)*selectedShows; j++){
                                $("#product-li-number-"+j).hide();
                            }
                            for ( var k = page*selectedShows+1; k <= productNumbers; k++){
                                $("#product-li-number-"+k).hide();
                            }

                            for (var i = 1; i <= pageTotal; i++){
                                if (i == 1){
                                    var append_content = "<li><a id='page-number-"+ i +"' style='cursor: hand; " +
                                            "background-color:#ff6666; color:white ' onclick='pagination("+ i +","+
                                            pageTotal+",${products.size()})'>"+ i + "</a></li>";
                                }else{
                                    var append_content = "<li><a id='page-number-"+ i +"' style='cursor: hand' onclick='pagination("+
                                            i+","+pageTotal+",${products.size()})'>"+ i + "</a></li>";
                                }
                                $("#pagination-ul").append(append_content);
                            }
                            <c:if test="${products.size() gt 6}">
                            var next = "<li id='next-page-li'><a style='cursor: hand' onclick='pagination(0,"+
                                    pageTotal+",${products.size()})' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
                            $("#pagination-ul").append(next);
                            </c:if>
                        });
                    </script>
                    <div class="aa-product-catg-pagination">
                        <nav>
                            <ul class="pagination" id="pagination-ul">

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
                        <c:forEach items="${subCategoryList}" var="subCategory">
                            <li><a href="/pd/s?sc=${subCategory}">${subCategory}</a></li>
                        </c:forEach>
                        </ul>
                    </div>

                    <!-- single sidebar -->
                    <div class="aa-sidebar-widget">
                        <h3>Tags</h3>
                        <div class="tag-cloud">
                            <c:forEach items="${tagList}" var="tag">
                                <a href="<my:replaceParam name='t' value='${tag}' />">${tag}</a>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- single sidebar -->
                    <div class="aa-sidebar-widget">
                        <h3>Shop By Price</h3>

                        <!-- price range -->
                        <div class="aa-sidebar-price-range">
                            <input type="radio" name="priceRage" max="20" onclick="PriceRangeRadio(this,'<my:replaceParam name='lp' value='0' />');">$0 - $20<br>
                            <input type="radio" name="priceRage" max="40" onclick="PriceRangeRadio(this,'<my:replaceParam name='lp' value='20' />');">$20 - $40<br>
                            <input type="radio" name="priceRage" max="60" onclick="PriceRangeRadio(this,'<my:replaceParam name='lp' value='40' />');">$40 - $60<br>
                            <input type="radio" name="priceRage" max="80" onclick="PriceRangeRadio(this,'<my:replaceParam name='lp' value='60' />');">$60 - $80<br>
                            <div>
                                <span style="cursor: hand;" onclick="customPriceRage()">Custom Price Range</span>
                                <div id="custom-price-range-div" hidden>
                                    <br>
                                    <input id="skip-value-lower" class="aa-filter-btn" style="background-color: white;
                            color: black; text-align: center; cursor: default" type="number" min="1" placeholder="min"/>
                                    <input id="skip-value-upper" class="aa-filter-btn" style="background-color: white;
                            color: black; text-align: center; cursor: default" type="number" min="1" placeholder="max"/>
                                    <button class="aa-filter-btn" type="button" onclick="customPriceRageGo('<my:replaceParam name='lp' value='' />')">Go</button>
                                </div>

                            </div>
                        </div>

                    </div>
                    <!-- single sidebar -->
                    <div class="aa-sidebar-widget">
                        <h3>Recently Views</h3>
                        <span style="color: red">*Unfinished function</span>
                        <div class="aa-recently-views">
                            <ul>
                                <li>
                                    <a href="#" class="aa-cartbox-img"><img alt="img" src="#"></a>
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