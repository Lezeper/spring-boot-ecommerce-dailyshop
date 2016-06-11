<%@include file="/WEB-INF/view/template/header.jsp"%>
<section id="aa-myaccount" ng-controller="fpCtrl">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
	           <div class="aa-myaccount-area">
	                <div class="col-md-6" style="float: none; margin-left: 35%; width: 30%">
	                    <div class="aa-myaccount-login" ng-show="fpShow">
	                    	<h2>Reset my passowrd</h2>
			            	<form class="aa-login-form" novalidate>
			
								<c:if test="${not empty error}">
								    <div class="error" style="color: red">${error}</div>
								</c:if>
				               <div class="form-group">
				                   <label for="email">Email<span>*</span></label>
				                   <input id="email" type="text" name="email" placeholder="Email address" 
				                   		ng-model="email" class="form-control" />
				                   <button class="btn btn-primary" ng-click="sendResetPasswordEmail()">Send</button>
				               </div>
			              	</form>
	                    </div>
	                    <div class="text-center" ng-show="sendReady">
	                    	<p>The link has been send to the your email if that is on our database.</p>
	                    	<a href="/login"><button class="btn btn-primary">OK</button></a>
	                    </div>
	                </div>
	            </div>
            </div>
        </div>
    </div>
</section>

<%@include file="/WEB-INF/view/template/footer.jsp"%>