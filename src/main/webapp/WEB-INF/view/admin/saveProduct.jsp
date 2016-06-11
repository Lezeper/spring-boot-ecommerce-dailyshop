<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/admin/template/header.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <div class="container">
        <div class="page-header">
            <h1>${title}</h1>
        </div>

        <form:form action="/admin/pd/s" method="post" commandName="product" enctype="multipart/form-data">
        
        	<form:hidden path="productViews" value="${product.productViews}" />
            <form:hidden path="productDate" id="productDate" value="${now}" />
            <form:hidden path="productId" value="${product.productId}" />
            
            <div class="form-group">
                <label for="name">Name</label><br><form:errors path="productName" cssStyle="color: red" />
                <form:input path="productName" id="name" class="form-Control" />
            </div>

            <div class="form-group">
                <label for="productCategory">Category</label><br><form:errors path="productCategory" cssStyle="color: red" />
                <c:forEach items="${categoryList}" var="category">
                	<c:if test="${category.categoryId eq product.productCategory.categoryId}">
	                    <label class="checkbox-inline">
	                    	<form:radiobutton path="productCategory" checked="checked" value="${category}"/>
	                           ${category.mainCategoryName} - ${category.subCategoryName}
	                    </label>
                	</c:if>
                	<c:if test="${category.categoryId ne product.productCategory.categoryId}">
	                	<label class="checkbox-inline">
	                    	<form:radiobutton path="productCategory" value="${category}"/>
	                           ${category.mainCategoryName} - ${category.subCategoryName}
	                    </label>
                    </c:if>
                </c:forEach>
            </div>

            <div class="form-group">
                <label for="productSummary">Summary</label><br><form:errors path="productSummary" cssStyle="color: red" />
                <form:input path="productSummary" id="productSummary" class="form-Control" />
            </div>

            <div class="form-group">
                <label for="productDescription">Description</label><br><form:errors path="productDescription" cssStyle="color: red" />
                <form:textarea path="productDescription" id="productDescription" class="form-Control" />
            </div>

            <div class="form-group">
                <label for="price">Price</label> <br><form:errors path="productPrice" cssStyle="color: red" />
                <form:input type="Number" step="0.01" path="productPrice" id="price" class="form-Control" min="0"/>
            </div>

            <div class="form-group">
                <label for="condition">Condition</label><form:errors path="productCondition" cssStyle="color: red"/>
                <label class="checkbox-inline"><form:radiobutton path="productCondition" id="condition"
                                                     checked="checked" value="new" />New</label>
                <label class="checkbox-inline"><form:radiobutton path="productCondition" id="condition"
                                                                 value="used" />Used</label>
            </div>

            <div class="form-group">
                <label for="unitInStock">Unit In Stock</label><br><form:errors path="unitInStock" cssStyle="color: red" />
                <form:input type="Number" min="0" path="unitInStock" id="unitInStock" class="form-Control" />
            </div>

            <div class="form-group">
                <label for="productTags">Tags (Separate with ";")</label><br><form:errors path="productTags" cssStyle="color: red" />
                <form:input path="productTagsW" id="productTags" class="form-Control" />
            </div>

            <div class="form-group">
                <label class="control-label" for="productImage">Upload Picture</label>
                <form:input id="productImage" path="productImage" type="file" class="form:input-large" />
            </div>

            <input type="submit" value="submit" class="btn btn-default">
            <a href="/admin/pd/m" class="btn btn-default">Cancel</a>

        </form:form>
    </div>
</div>
<%@include file="/WEB-INF/view/admin/template/footer.jsp" %>