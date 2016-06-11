<%@include file="/WEB-INF/view/admin/template/header.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Slider</h1>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Thumb</th>
                <th>SliderUpperData</th>
                <th>SliderTitle</th>
                <th>SliderDescription</th>
                <th>SliderLink</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sliderList}" var="slider">
                <tr>
                    <td><img src="/images/slider/${slider.sliderId}/0.png"
                             style="width: 300px; height: 100px"></td>
                    <td>${slider.sliderUpperData}</td>
                    <td>${slider.sliderTitle}</td>
                    <td>${slider.sliderDescription}</td>
                    <td>${slider.sliderLink}</td>
                    <td>
                        <a href="/admin/hs/s?id=${slider.sliderId}">
                            <span class="glyphicon glyphicon-pencil"></span></a>
                        <a href="/admin/hs/d?id=${slider.sliderId}">
                            <span class="glyphicon glyphicon-remove"></span></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <a href="/admin/hs/s"><button class="btn btn-primary">Add Slider</button></a>
    </div>
</div>

<%@include file="/WEB-INF/view/admin/template/footer.jsp" %>
