<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" %>
<title>Login</title>
<jsp:include page="main.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
<body>
<%-- <center>
	<b><c:if test="${sessionScope.registered!=null}">
			<div id="alert" class="alert alert-success">User Registration Successful.</div>
		</c:if></b>
</center>
<center>
	<b><c:if test="${sessionScope.forgot!=null}">
			<div id="alert" class="alert alert-success">Password reset successful.</div>
		</c:if></b>
</center>
<script>
		setTimeout(function() {
			$('#alert').alert('close');
		}, 1000);
	</script> --%>
<div class="" style="margin-top: 30px">
	<div class="rounded d-flex justify-content-center">
		<div class="col-md-4 col-sm-12 shadow-lg p-5 bg-light">
			<div class="text-center">
				<h3 class="text-primary">Login</h3>
			</div>
			<div class="p-4">
				<form id="loginSubmit" action="user" method="post">
					<div class="input-group mb-3"> 
						<input type="text" class="form-control" placeholder="Email" id="email"
							name="email" style="width:100%">
							<span class="error" style="display: inline-block;width: 10em;position: relative;bottom: -0em;margin-left: 10px;color:red;width:100%;"></span>
					</div>
					<br> 
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="Password" id="password"
							name="password" style="width:100%">
							<span class="error" style="display: inline-block;width: 10em;position: relative;bottom: -0em;margin-left: 10px;color:red;width:100%;"></span>
					</div>
					<br>
					<div class="d-grid col-12 mx-auto">
						<input class="btn btn-primary" type="submit" value="Sign In" />
					</div>
					<p class="text-right mt-3" style="text-align: right;">
						<span class="text-primary"><a href="forget.jsp">Forget
								Password?</a></span>
					</p>
					<p class="text-center mt-3">
						Not have an account? <span class="text-primary"><a
							href="register.jsp">Sign Up</a></span>
					</p>
				</form>
			</div>
		</div>
	</div>
</div>
<br>
<jsp:include page="footer.jsp"></jsp:include>
<script>
jQuery.validator.addMethod("email_regex", function(value, element) {
	return this.optional(element) || /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/i.test(value);
});

jQuery.validator.addMethod("password_regex", function(value, element) {
	return this.optional(element) || /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8,8})$/i.test(value);
});

	$('#loginSubmit').validate({
		errorClass : 'error',
		rules : {
			email : {
				required : true,
				email_regex : true,
			},
			password : {
				required : true,
				password_regex : true,
			},
		},
		messages : {
			email : {
				required : "Enter your Email.",
				email_regex : "Please enter valid Email Address."
			},
			password : {
				required : "Enter your password.",
				password_regex : "Invalid Password",
			},
		},
		errorPlacement : function(error, element) {
			error.insertAfter(element);
			error.css('color', 'red', '<br/>');
		},
	});
</script>
</body>
