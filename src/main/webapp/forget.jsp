<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forget Password</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

</head>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<form action="forget" method="post" id="forgetPassword">
		<div class="container" style="padding-left: 500px;">
			<div class="card text-center" style="width: 450px;">
				<div class="card-header h5 text-white bg-primary">Password
					Reset</div>
				<div class="card-body px-5">
					<p class="card-text py-2">Enter your email address and new
						Password.</p>
					<table>
						<div class="form-outline">
							<tr>
								<td style="text-align: left;"><label class="form-label" for="typeEmail">Email</label></td>
								<td><input type="text" id="typeEmail" name="email"
									class="form-control my-3" /></td>
							</tr>
						</div>
						<div class="form-outline">
							<tr>
								<td style="text-align: left;"><label class="form-label" for="password">New Password</label></td>
								<td><input type="password" id="password" name="password"
									class="form-control my-3" /></td>
						</div>
						</tr>
					</table>
					<input class="btn btn-primary d-grid col-12 mx-auto" type="submit" value="Reset password" />
					
					<!-- <div class="d-flex justify-content-between mt-4">
					<a class="" href="login.jsp">Login</a> <a class="" href="register.jsp">Register</a>
				</div> -->
				</div>
			</div>
		</div>
	</form>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
<script>
jQuery.validator.addMethod("email_regex", function(value, element) {
	return this.optional(element) || /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/i.test(value);
});

jQuery.validator.addMethod("password_regex", function(value, element) {
	return this.optional(element) || /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8,8})$/i.test(value);
});

$('#forgetPassword').validate({
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
			password_regex : "Invalid Password.",
		},
	},
	errorPlacement : function(error, element) {
		error.insertAfter(element);
		error.css('color', 'red', '<br/>');
	},
});
</script>
</body>
</html>