<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/template/header.jsp"%>

<!-- product category -->
<section id="aa-product-category">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
                <div class="aa-product-catg-head" style="text-align: center">
                    <h3>Address Management</h3>
                </div>
                <div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">#1</h3>
                            <input type="radio" name="isDefault" value="isDefault"> isDefault</input>
                        </div>
                        <div class="panel-body">
                            <div style="width: 49%; float: left">
                                <h4>Shipping Address</h4>
                                <label for="fullNameShipping">Full Name: </label><p id="fullNameShipping">${shippingAddress.fullName}</p>
                                <label for="phoneNumberShipping">Phone: </label><p id="phoneNumberShipping">${shippingAddress.phoneNumber}</p>
                                <label for="addressShipping">Address: </label><p id="addressShipping">${shippingAddress.address}</p>
                                <label for="cityShipping">City: </label><p id="cityShipping">${shippingAddress.city}</p>
                                <label for="stateShipping">State: </label><p id="stateShipping">${shippingAddress.state}</p>
                                <label for="countryShipping">Country: </label><p id="countryShipping">${shippingAddress.country}</p>
                                <label for="zipCodeShipping">ZipCode: </label><p id="zipCodeShipping">${shippingAddress.zipCode}</p>
                            </div>
                            <div style="width: 49%; float: right">
                                <h4>Billing Address</h4>
                                <label for="fullNamebilling">Full Name: </label><p id="fullNamebilling">${billingAddress.fullName}</p>
                                <label for="phoneNumberbilling">Phone: </label><p id="phoneNumberbilling">${billingAddress.phoneNumber}</p>
                                <label for="addressbilling">Address: </label><p id="addressbilling">${billingAddress.address}</p>
                                <label for="citybilling">City: </label><p id="citybilling">${billingAddress.city}</p>
                                <label for="statebilling">State: </label><p id="statebilling">${billingAddress.state}</p>
                                <label for="countrybilling">Country: </label><p id="countrybilling">${billingAddress.country}</p>
                                <label for="zipCodebilling">ZipCode: </label><p id="zipCodebilling">${billingAddress.zipCode}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="/WEB-INF/view/template/accountSider.jsp"%>
        </div>
    </div>
</section>
<!-- / product category -->

<%@include file="/WEB-INF/view/template/footer.jsp"%>