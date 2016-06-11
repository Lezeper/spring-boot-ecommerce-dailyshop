<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/template/header.jsp" %>

<div class="container">
    <div class="col-md-8 col-md-offset-2">
        <div class="page-header">
            <h1>Customer Details</h1>
        </div>

        <h3>Shipping Address Info</h3>
        <c:if test="${empty shippingAddresses}">
        <div class="text-center">
        	<h3>No Address available</h3>
        	<form:form>
        		<input type="submit" id="useAddressbutton" value="Add One" class="btn btn-primary" 
			         			name="_eventId_goToAddNewAddress"/>
        	</form:form>
        	
        </div>
        </c:if>
       	<input type="hidden" name="_flowExecutionKey">
       	<c:if test="${not empty shippingAddresses}">
        <div class="panel panel-default">
        	<div class="panel-body">
	        	<h4><strong>Your addresses</strong></h4>
	        	<hr>
	        	<form:form commandName="customerOrderShippingAddress">
	        		
	        		<c:forEach items="${shippingAddresses}" var="address_">
		        		<div class="radio">
		        			<label>
			        			<form:radiobutton onclick="handleClick()" path="originalShippingAddressId" value="${address_.addressId}"/>
				        		<strong>${address_.fullName }</strong> ${address_.address }, 
				        		${address_.city }, ${address_.state }, ${address_.zipCode }, ${address_.country }
			        		</label>
		        		</div>
	        		</c:forEach>
	        		<br>
			         <input type="submit" id="useAddressbutton" value="Use this address" class="btn btn-primary" 
			         		name="_eventId_customerInfoCollected" disabled/>
			         <input type="submit" id="useAddressbutton" value="Add address" class="btn btn-default" 
			         		style="float:right" name="_eventId_goToAddNewAddress" />
	        	</form:form>
	        	<script>
	        		function handleClick(){
	        			$("#useAddressbutton").prop('disabled', false);
	        		}
	        	</script>
        	</div>
        </div>
        </c:if>
        <br>
    </div>
</div>

<%@include file="/WEB-INF/view/template/footer.jsp" %>