<%@include file="/WEB-INF/view/admin/template/header.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Category Management</h1>

    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>MainCategory</th>
                <th>SubCategory</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${categoryList}" var="category">
                <tr>
                    <td>${category.mainCategoryName}</td>
                    <td>${category.subCategoryName}</td>
                    <td>
                        <a href="/admin/ca/s?id=${category.categoryId}">
                            <span class="glyphicon glyphicon-pencil"></span></a>
                        <a href="/admin/ca/d?id=${category.categoryId}">
                            <span class="glyphicon glyphicon-remove"></span></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <a href="/admin/ca/s"><button class="btn btn-primary">Add Category</button></a>
    </div>
</div>
</div>
</div>

<%@include file="/WEB-INF/view/admin/template/footer.jsp" %>
