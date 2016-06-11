<%@include file="/WEB-INF/view/template/header.jsp"%>

<section id="aa-error">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-error-area">
                    <h2>${status}</h2>
                    <span>${error }</span>
                    <p>${msg }</p>
                    <a href="/"> Go to Homepage</a>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="/WEB-INF/view/template/footer.jsp"%>