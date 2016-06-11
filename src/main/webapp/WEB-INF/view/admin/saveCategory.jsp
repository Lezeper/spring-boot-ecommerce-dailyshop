<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/admin/template/header.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <div class="container">
        <div class="page-header">
            <h1>${title}</h1>
        </div>

        <form:form action="/admin/ca/s" method="post" commandName="category">

			<form:hidden path="categoryId" value="${category.categoryId}" />
            <div class="form-group"><form:errors path="mainCategoryName" cssStyle="color: red" />
                <label for="mainCategoryName">MainCategory</label>
                <form:input path="mainCategoryName" id="mainCategoryName" class="form-Control" />
            </div>

            <div class="form-group"><form:errors path="subCategoryName" cssStyle="color: red" />
                <label for="subCategoryName">SubCategory</label>
                <form:input path="subCategoryName" id="subCategoryName" class="form-Control" />
            </div>

            <input type="submit" value="submit" class="btn btn-default">
            <a href="<c:url value="/admin/ca/m" />" class="btn btn-default">Cancel</a>

        </form:form>
    </div>
</div>