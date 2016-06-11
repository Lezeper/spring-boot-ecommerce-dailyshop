<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/template/header.jsp"%>

<!-- product category -->
<section id="aa-product-details">
    <div class="container">

        <c:set var="role" scope="page" value="${param.role}" />
        <c:set var="url" scope="page" value="/pd" />
        <c:if test="${role='admin'}">
            <c:set var="url" scope="page" value="/admin" />
        </c:if>

        <div class="row">
            <div class="col-md-12">
                <div class="aa-product-details-area">
                    <div class="aa-product-details-content">
                        <div class="row">
                            <!-- Modal view slider -->
                            <div class="col-md-5 col-sm-5 col-xs-12">
                                <div class="aa-product-view-slider">
                                    <div id="demo-1" class="simpleLens-gallery-container">
                                        <div class="simpleLens-container">
                                            <div class="simpleLens-big-image-container">
                                                <a data-lens-image="/images/${product.productId}/0.png" class="simpleLens-lens-image">
                                                    <img src="/images/${product.productId}/0.png" class="simpleLens-big-image" >
                                                </a>
                                            </div>
                                        </div><!--  
                                        <div class="simpleLens-thumbnails-container">
	                                        <a data-big-image="/images/0/0.png"
	                                           data-lens-image="/images/0/0.png"
	                                           class="simpleLens-thumbnail-wrapper" href="#">
	                                            <img style="width: 50px;height: 50px" src="/images/0/0.png" />
	                                        </a>
                                        
                                            <a data-big-image="/images/26/0.png"
                                               data-lens-image="/images/26/0.png"
                                               class="simpleLens-thumbnail-wrapper" href="#">
                                                <img style="width: 50px;height: 50px" src="/images/26/0.png" />
                                            </a>
                                        </div>-->
                                    </div>
                                </div>
                            </div>
                            <!-- Modal view content -->
                            <div class="col-md-7 col-sm-7 col-xs-12">
                                <div class="aa-product-view-content">
                                    <h3>${product.productName}</h3>
                                    <div class="aa-price-block">
                                        <span class="aa-product-view-price">$${product.productPrice}</span>
                                        <p class="aa-product-avilability">Avilability: <span id="stock">${product.unitInStock}</span></p>
                                    </div>
                                    <p>${product.productSummary}</p>
                                    <div class="aa-prod-quantity">
                                        <input type="number" style="width: 50px;cursor: default" id="quantity"
                                               min="1" max="${product.unitInStock}" value="1">
                                        <p class="aa-prod-category">
                                            Category:
                                            <a href="/pd/s?mc=${product.productCategory.mainCategoryName}?sc=${product.productCategory.subCategoryName}" >
                                            ${product.productCategory.mainCategoryName} - ${product.productCategory.subCategoryName}
                                        </a>
                                        </p>
                                    </div>
                                    <div>
                                        <p>Views: ${product.productViews}</p>
                                        <p>Date First Available: ${product.productDate}</p>
                                    </div>
                                    <div class="aa-prod-view-bottom" ng-controller="cartCtrl">
                                        <a class="aa-add-to-cart-btn" style="cursor: hand"
                                           ng-click="addToCart('${product.productId}','${_csrf.parameterName}=${_csrf.token}')">Add To Cart</a>
                                        <!--  
                                        <a class="aa-add-to-cart-btn" href="#">Wishlist</a>
                                        <a class="aa-add-to-cart-btn" href="#">Compare</a>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="aa-product-details-bottom">
                        <ul class="nav nav-tabs" id="myTab2">
                            <li><a href="#description" data-toggle="tab">Description</a></li>
                            <li><a href="#review" data-toggle="tab">Reviews</a></li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="description">
                                ${product.productDescription}
                            </div>
                            <div class="tab-pane fade " id="review">
                                <div class="aa-product-review-area">
                                    <h4>${productCommentList.size()} Reviews</h4>
                                    <ul class="aa-review-nav">
                                        <c:forEach items="${productCommentList}" var="productComment">
                                        <li>
                                            <div class="media">
                                                <div class="media-body">
                                                    <h4 class="media-heading">
                                                        <strong>${productComment.customer.customerName}</strong> - <span>${productComment.commentDate}</span>
                                                    </h4>
                                                    <div class="aa-product-rating">
                                                        <c:forEach begin="1" end="${productComment.commentStarts}">
                                                            <span class="fa fa-star"></span>
                                                        </c:forEach>
                                                        <c:forEach begin="1" end="${5-productComment.commentStarts}">
                                                            <span class="fa fa-star-o"></span>
                                                        </c:forEach>
                                                    </div>
                                                    <p>${productComment.commentCotents}</p>
                                                </div>
                                            </div>
                                        </li>
                                        </c:forEach>
                                    </ul>
                                    <div class="aa-product-related-item">
                                        <h3 onclick="add_review('${pageContext.request.userPrincipal.name}')" style="cursor: hand;" onmouseover="this.style.color='red'"
                                        onmouseout="this.style.color='black'">Add a review</h3>
                                    </div>

                                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <div id="add-review-div" hidden>
                                        <!-- review form -->
                                        <form:form action="/pd/p?id=${product.productId}" method="post" commandName="productComment">
                                            <div class="aa-your-rating">
                                                <p>Your Rating</p>
                                                <span style="cursor: hand; color: red" starts="1" id="starts-number-1" onclick="productCommentOnClick(this)"
                                                      class="fa fa-star-o">
                                                </span>
                                                <span style="cursor: hand; color: red" starts="2" id="starts-number-2" onclick="productCommentOnClick(this)"
                                                      class="fa fa-star-o">
                                                </span>
                                                <span style="cursor: hand; color: red" starts="3" id="starts-number-3" onclick="productCommentOnClick(this)"
                                                      class="fa fa-star-o">
                                                </span>
                                                <span style="cursor: hand; color: red" starts="4" id="starts-number-4" onclick="productCommentOnClick(this)"
                                                      class="fa fa-star-o">
                                                </span>
                                                <span style="cursor: hand; color: red" starts="5" id="starts-number-5" onclick="productCommentOnClick(this)"
                                                      class="fa fa-star-o">
                                                </span>
                                                <form:hidden path="commentStarts" id="commentStarts-hidden" value="0"/>
                                                <form:hidden path="customer" />
                                            </div><br>
                                            <div class="form-group">
                                                <label for="message">Your Review</label>
                                                <form:textarea path="commentCotents" rows="3" id="message" class="form-control" />
                                            </div>

                                            <button type="submit" class="btn btn-default aa-review-submit">Submit</button>
                                        </form:form>
                                    </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Related product -->
                    <div class="aa-product-related-item">
                        <h3>Related Products</h3>
                        <ul class="aa-product-catg aa-related-item-slider">
                            <!-- start single product item -->
                            <c:forEach var="product" items="${productRelated}">
                                <li>
                                    <figure>
                                        <a class="aa-product-img" href="/pd/p?id=${product.productId}">
                                            <img style="width: 250px; height: 300px" src="/images/${product.productId}/0.png" ></a>
                                        <a class="aa-add-card-btn" style="cursor: hand" ng-click="addToCart('${product.productId}','${_csrf.parameterName}=${_csrf.token}')">
                                            <span class="fa fa-shopping-cart"></span>Add To Cart
                                        </a>
                                        <figcaption>
                                            <h4 class="aa-product-title"><a href="/pd/p?id=${product.productId}">${product.productName}</a></h4>
                                            <span class="aa-product-price">$${product.productPrice}</span><span class="aa-product-price"><del>$999</del></span>
                                        </figcaption>
                                    </figure>
                                    <!-- product badge -->
                                    <span class="aa-badge aa-sale" href="#">SALE!</span>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / product category -->
<%@include file="/WEB-INF/view/template/footer.jsp"%>