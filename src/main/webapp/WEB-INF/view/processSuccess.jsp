<%@include file="/WEB-INF/view/template/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-5 col-md-offset-3"><br>
		   	<div class="panel panel-default text-center">
		   		<div class="panel-body">
		            <h1>${title}</h1>
		            <h3>${msg}</h3>
					<hr>
		            <a href="<spring:url value="/customer/account" />" class="btn btn-default">OK</a>
		   			
		   		</div>
		   	</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/view/template/footer.jsp"%>