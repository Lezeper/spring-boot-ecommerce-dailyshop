<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/template/header.jsp"%>

<!-- product category -->
<section id="aa-product-category">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
                <div class="aa-product-catg-head" style="text-align: center">
                    <h3>Overviews</h3>
                </div>
                <div ng-controller="overViewsCtrl">
                    <h3>Basic Info</h3>
                    <label for="name">Name: </label><p id="name">${customer.customerName}</p>
                    <label for="email">Email: </label>
                    <div id="email">${customer.email}
                    <c:if test="${unAuth ne null}">
                    	<span style="color: red">(Not Confirm)</span><p></p><p></p>
                    	<span style="color: red">Didn't Receive yet? -> </span></span><button class="btn btn-primary" ng-click="reSendActiveCode()" ng-disabled="reSendDisabled">ReSend</button>
                    </c:if>
                    </div>
                </div>
                <hr>
                <div>
                    <div style="width: 49%; float: left">
                        <h3>Default Shipping Address</h3>
                        <c:if test="${shippingAddress eq null}">
                            <p>No ShippingAddress Found</p>
                        </c:if>
                        <c:if test="${shippingAddress ne null}">
                        <label for="fullName">Full Name: </label><p id="fullName">${shippingAddress.fullName}</p>
                        <label for="phoneNumber">Phone: </label><p id="phoneNumber">${shippingAddress.phoneNumber}</p>
                        <label for="address">Address: </label><p id="address">${shippingAddress.address}</p>
                        <label for="city">City: </label><p id="city">${shippingAddress.city}</p>
                        <label for="state">State: </label><p id="state">${shippingAddress.state}</p>
                        <label for="country">Country: </label><p id="country">${shippingAddress.country}</p>
                        <label for="zipCode">ZipCode: </label><p id="zipCode">${shippingAddress.zipCode}</p>
                        </c:if>
                    </div>
                    <div style="width: 49%; float: right">
                        <h3>Default Billing Address</h3>
                        <c:if test="${billingAddress eq null}">
                            <p>No BillingAddress Found</p>
                        </c:if>
                        <c:if test="${billingAddress ne null}">
                        <label for="fullNamebilling">Full Name: </label><p id="fullNamebilling">${billingAddress.fullName}</p>
                        <label for="phoneNumberbilling">Phone: </label><p id="phoneNumberbilling">${billingAddress.phoneNumber}</p>
                        <label for="addressbilling">Address: </label><p id="addressbilling">${billingAddress.address}</p>
                        <label for="citybilling">City: </label><p id="citybilling">${billingAddress.city}</p>
                        <label for="statebilling">State: </label><p id="statebilling">${billingAddress.state}</p>
                        <label for="countrybilling">Country: </label><p id="countrybilling">${billingAddress.country}</p>
                        <label for="zipCodebilling">ZipCode: </label><p id="zipCodebilling">${billingAddress.zipCode}</p>
                        </c:if>
                    </div>
                </div>
                <hr style="clear: both">
                <div>
                    <h3>Orders Summary</h3>
                    <c:if test="${customerOrders.size() eq 0}">
                        <h3 style="text-align: center">NO Orders</h3>
                    </c:if>
                    <c:if test="${customerOrders.size() ne 0}"><br>
                    <c:forEach items="${customerOrders}" var="customerOrder">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="padding-top: 0">
                            <table class="table" style="margin-bottom: 0">
                                <tr>
                                    <th>ORDER PLACED</th>
                                    <th>TOTAL</th>
                                    <th>SHIP TO</th>
                                    <th>ORDER #</th>
                                </tr>
                                <tr>
                                    <td>${customerOrder.orderDate}</td>
                                    <td>$${customerOrder.orderTotalPrice}</td>
                                    <td>${customerOrder.customerOrderShippingAddress.fullName}</td>
                                    <td># ${customerOrder.customerOrderId}</td>
                                </tr>
                            </table>
                        </div>
                        <div class="panel-body">
                            <div style="width: 80%; float: left">
                                <c:forEach var="orderItem" items="${customerOrder.getCustomerOrderItems()}">
                                    <div class="row">
                                        <div class="col-md-5 col-sm-5 col-xs-12">
                                            <img style="width: 150px; height: 150px" src="<c:url value="/images/${orderItem.productId}/0.png" />" class="simpleLens-big-image">
                                        </div>
                                        <div class="col-md-7 col-sm-7 col-xs-12">
                                            <div class="aa-product-view-content">
                                                <h3>${orderItem.productName}</h3>
                                                <div class="aa-price-block">
                                                    <span class="aa-product-view-price">Quantity: ${orderItem.productQuantity}</span><br>
                                                    <span class="aa-product-view-price">Total: {{converDouble(${orderItem.productQuantity * orderItem.productPrice})}}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <br>
                            <div style="float: right">
                                <button class="btn btn-default">View Order</button><br><br>
                                <button class="btn btn-default"><a href="/customer/account/order?d=${customerOrder.customerOrderId}">Delete Order</a></button>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    </c:if>
                    <br>
                </div>
            </div>
            <%@include file="/WEB-INF/view/template/accountSider.jsp"%>
        </div>
    </div>
</section>
<!-- / product category -->

<%@include file="/WEB-INF/view/template/footer.jsp"%>