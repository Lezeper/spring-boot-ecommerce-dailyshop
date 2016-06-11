<%@include file="/WEB-INF/view/template/header.jsp"%>

<!-- Cart view section -->
<section id="aa-myaccount">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-myaccount-area">
                    <div class="col-md-6" style="float: none; margin-left: 35%; width: 30%">
                        <div class="aa-myaccount-login">

                            <h4>Login</h4>

                            <form name="loginForm" action="/login"
                                  class="aa-login-form" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <c:if test="${not empty error}">
                                <p id="error" style="color: red"> ${error} </p>
                                </c:if>

                                <div class="form-group">
                                    <label for="email">Email<span>*</span></label>
                                    <input id="email" type="email" name="email" placeholder="Email address" class="form-control" />
                                </div>

                                <div class="form-group">
                                    <label for="password">Password<span>*</span></label>
                                    <input id="password" type="password" name="password" placeholder="Password" class="form-control">
                                </div>

                                <button type="submit" class="aa-browse-btn">Login</button>

                                <label class="rememberme" for="rememberme"><input type="checkbox" id="rememberme"> Remember me </label>
                                <p class="aa-lost-password"><a href="fp">Lost your password?</a></p>
                                <p>Don't have an account?<a href="<spring:url value="/register" />" style="color: red">Register now!</a></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Cart view section -->

<%@include file="/WEB-INF/view/template/footer.jsp"%>