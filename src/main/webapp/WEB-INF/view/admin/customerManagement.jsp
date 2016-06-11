<%@include file="/WEB-INF/view/admin/template/header.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Customer Management</h1>

    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>Username</th>
                <th>Authority</th>
                <th>Enable</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${customerList}" var="customer">
                <tr>
                    <td>${customer.customerName}</td>
                    <td>${customer.email}</td>
                    <td>
                    	<c:forEach items="${customer.roles}" var="role">
                    		${role.authority} |
                    	</c:forEach>
                    </td>
                    <td>${customer.enabled}</td>
                    <td>
                    	<a href="/admin/cu/e?id=${customer.customerId}">
                            <span class="glyphicon glyphicon-ok-circle"></span></a>
                        <a href="/admin/cu/ds?id=${customer.customerId}">
                            <span class="glyphicon glyphicon-ban-circle"></span></a>
                        <a href="/admin/cu/d?id=${customer.customerId}">
                            <span class="glyphicon glyphicon-remove"></span></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</div>
</div>

<%@include file="/WEB-INF/view/admin/template/footer.jsp" %>
