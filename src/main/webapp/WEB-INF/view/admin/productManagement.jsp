<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/view/admin/template/header.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Product Inventory</h1>

    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Thumb</th>
                <th>Name</th>
                <th>Category</th>
                <th>SubCategory</th>
                <th>Condition</th>
                <th>Description</th>
                <th>Summary</th>
                <th>Price</th>
                <th>Tag</th>
                <th>Stock</th>
                <th>Date</th>
                <th>Views</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td><img src="<c:url value="/images/${product.productId}/0.png" />"
                             style="width: 50px; height: 50px"></td>
                    <td>${product.productName}</td>
                    <td>${product.productCategory.mainCategoryName}</td>
                    <td>${product.productCategory.subCategoryName}</td>
                    <td>${product.productCondition}</td>
                    <td>${product.productDescription}</td>
                    <td>${product.productSummary}</td>
                    <td>${product.productPrice}</td>
                    <td>
                    	<c:forEach items="${product.productTags}" var="productTag">
                    		${productTag} |
                    	</c:forEach>
                    </td>
                    <td>${product.unitInStock}</td>
                    <td>${product.productDate}</td>
                    <td>${fn:substringBefore(product.productViews/2, '.')}</td>
                    <td>
                        <a href="/pd/p/view?id=${product.productId}">
                            <span class="glyphicon glyphicon-info-sign"></span></a>
                        <a href="/admin/pd/s?id=${product.productId}">
                            <span class="glyphicon glyphicon-pencil"></span></a>
                        <a href="/admin/pd/d?id=${product.productId}">
                            <span class="glyphicon glyphicon-remove"></span></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <a href="/admin/pd/s"><button class="btn btn-primary">Add Product</button></a>
    </div>
</div>
</div>
</div>

<%@include file="/WEB-INF/view/admin/template/footer.jsp" %>
