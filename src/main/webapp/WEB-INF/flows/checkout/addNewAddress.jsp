<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/template/header.jsp" %>

<div class="container">
    <div class="col-md-6 col-md-offset-3">
        <div class="page-header">
            <h1>Add Shipping Address</h1>
        </div>

        <form:form commandName="shippingAddress">
            <div class="form-group">
                <label for="name">*Full Name</label><br><form:errors path="fullName" cssStyle="color: red" />
                <form:input path="fullName" id="name" class="form-Control"  />
            </div>
            <div class="form-group">
                <label for="phone">*Phone</label><br><form:errors path="phoneNumber" cssStyle="color: red" />
                <form:input path="phoneNumber" id="phone" class="form-Control" />
            </div>
            <div class="form-group">
                <label for="address">*Shipping Address</label><br><form:errors path="address" cssStyle="color: red" />
                <form:input path="address" id="address" class="form-Control" />
            </div>
            <div class="form-group">
                <label for="shippingCity">*City</label><br><form:errors path="city" cssStyle="color: red" />
                <form:input path="city" id="shippingCity" class="form-Control" />
            </div>
            <div class="form-group">
                <label for="shippingState">*State</label><br><form:errors path="state" cssStyle="color: red" />
                <form:input path="state" id="shippingState" class="form-Control" />
            </div>
            <div class="form-group">
                <label for="shippingCountry">*Country</label><br><form:errors path="country" cssStyle="color: red" />
                <form:input path="country" id="shippingCountry" class="form-Control" />
            </div>
            <div class="form-group">
                <label for="shippingZip">*ZipCode</label><br><form:errors path="zipCode" cssStyle="color: red" />
                <form:input path="zipCode" id="shippingZip" class="form-Control" />
            </div>

            <input type="hidden" name="_flowExecutionKey">

            <br>

            <input type="submit" value="Add" class="btn btn-default" name="_eventId_newAddressAdded">
            <input type="submit" value="Back" class="btn btn-default" name="_eventId_backToCustomerInfo" />
        </form:form>
        <br>
    </div>
</div>

<%@include file="/WEB-INF/view/template/footer.jsp" %>