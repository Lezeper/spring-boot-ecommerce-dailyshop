<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/template/header.jsp" %>

<section id="aa-myaccount">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-myaccount-area">
                    <div class="col-md-6" style="float: none; margin-left: 35%; width: 30%">
                        <div class="aa-myaccount-login">

                            <h4>Reset Password</h4>
							<div id="error" style="color: red">${email_exists}</div><br>
                            <form:form action="/rp" method="post" modelAttribute="user">
                                <form:hidden path="customerName" id="customerName" class="form-Control" value="${user.customerName}" />
                                <form:hidden path="email" id="email" class="form-Control" value="${user.email}" />
                                <div class="form-group">
                                    <label for="password">Password<span style="color: red">*</span></label>
                                    <form:errors path="password" cssStyle="color: red" />
                                    <form:input path="password" id="password" type="password" class="form-Control" />
                                </div>
                                <div class="form-group">
                                    <label for="passwordConfirm">Password again<span style="color: red">*</span></label>
                                    <input type="password" id="passwordConfirm" class="form-Control">
                                </div>

                                <script>
                                    $("#passwordConfirm").on("change paste keyup", function() {
                                        var password = $("#password").val();
                                        var confirmPassword = $("#passwordConfirm").val();

                                        if (password != confirmPassword){
                                            $("#register-submit").prop('disabled', true);
                                            $("#error").html("Passwords do not match!");
                                        }else{
                                            $("#register-submit").prop('disabled', false);
                                            $("#error").html("");
                                        }
                                    });
                                    function jsfunction()
                                    {
                                        //you code
                                        return false;
                                    }
                                </script>

                                <input type="submit" value="submit" id="register-submit" class="btn btn-default" disabled>
                                <a href="<c:url value="/" />" class="btn btn-default">Cancel</a>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="/WEB-INF/view/template/footer.jsp" %>