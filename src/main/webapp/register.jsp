<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="css/register.css">
<title>Register</title>
<script src="js/form.js"></script>
<jsp:include page="main.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<section class="vh-100">
	<div class="container py-5 h-100">
		<div class="row justify-content-center align-items-center h-100">
			<div class="col-12 col-lg-9 col-xl-7">
				<div class="card shadow-2-strong card-registration"
					style="border-radius: 15px;">
					<div class="card-body p-4 p-md-5">
						<h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-primary">
							<center>Registration Form</center>
						</h3>

						<form id="formSubmit" action="register" method="post"
							onsubmit="return validate();">
							<div class="row">
								<div class="col-md-6 mb-4">

									<div class="form-outline">
										<label class="form-label" for="firstName">First Name</label> <input
											type="text" id="firstName" name="firstName"
											class="form-control form-control" />
									</div>

								</div>
								<div class="col-md-6 mb-4">
									<div class="form-outline">
										<label class="form-label" for="lastName">Last Name</label> <input
											type="text" id="lastName" name="lastName"
											class="form-control form-control" />
									</div>

								</div>
							</div>


							<div class="row">
								<div class="col-md-6 mb-4 pb-2">

									<div class="form-outline">
										<label class="form-label" for="emailAddress">Email</label> <input
											type="text" id="email" name="email"
											class="form-control form-control" />
									</div>

								</div>
								<div class="col-md-6 mb-4 pb-2">

									<div class="form-outline">
										<label class="form-label" for="phoneNumber">Phone
											Number</label> <input type="tel" id="phoneNumber" name="phoneNumber"
											class="form-control form-control" />
									</div>

								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-6">
									<fieldset class="form-group row">
										<legend class="col-form-label col-sm-4 float-sm-left pt-0">Gender</legend>
										<div class="col-sm-8" id="selectError">
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="genderRadios" id="male" value="Male"> <label
													class="form-check-label" for="gridRadios1"> Male </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="genderRadios" id="female" value="Female"> <label
													class="form-check-label" for="gridRadios2"> Female
												</label>
											</div>
											<div class="form-check disabled">
												<input class="form-check-input" type="radio"
													name="genderRadios" id="other" value="Other"> <label
													class="form-check-label" for="gridRadios3"> Other </label>
											</div>
										</div>
									</fieldset>
								</div>

								<div class="form-group col-md-6">
									<fieldset class="form-group row">
										<legend class="col-form-label col-sm-4 float-sm-left pt-0">Language</legend>
										<div class="col-sm-8" id="selectError">
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													name="languageCheck" id="guj" value="Gujarati"> <label
													class="form-check-label" for="gridCheck1"> Gujarati
												</label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													name="languageCheck" id="hindi" value="Hindi"> <label
													class="form-check-label" for="gridCheck1"> Hindi </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													name="languageCheck" id="english" value="English">
												<label class="form-check-label" for="gridCheck1">
													English </label>
											</div>
										</div>
								</div>
								</fieldset>
							</div>
							<br>

							<div class="row">
								<div class="col-md-6 mb-4">
									<div class="form-outline">
										<label for="date">Date of Birth</label> <input type="date"
											class="form-control" id="futureDate" placeholder="date"
											name="dateOfBirth">
									</div>

								</div>

								<div class="col-md-6 mb-4">
									<label for="inputState">Education</label> <select
										id="inputEducation" class="select form-control"
										name="education">
										<option></option>
										<option value="Graduate" name="education" id="graduate">Graduate</option>
										<option value="Under Graduate" name="education" id="ugraduate">Under
											Graduate</option>
										<option value="Post Graduate" name="education" id="pgraduate">Post
											Graduate</option>
									</select>
								</div>
							</div>
							<div class="row">
								<label for="inputAddress">Address</label>
								<textarea rows="4" cols="10" id="address" name="address"
									placeholder="Plot no,Society name,area..."></textarea>
							</div>
							<br>
							<div class="row">
								<div class="form-outline col-md-4">
									<label for="inputCity">City</label> <input type="text"
										class="form-control" id="inputCity" name="city">
								</div>
								<div class="form-outline col-md-4">
									<label for="inputState">State</label> <select id="inputState"
										class="select form-control" name="state">
										<option></option>
										<option value="Gujarat" name="state" id="gj">Gujarat</option>
										<option value="Maharashtra" name="state" id="mh">Maharashtra</option>
										<option value="MP" name="state" id="mp">MP</option>
									</select>
								</div>
								<div class="form-outline col-md-4">
									<label for="inputZip">Pin Code</label> <input type="text"
										class="form-control" id="inputZip" name="zipCode">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-outline">
									<label for="inputPassword4">Password</label> <input
										type="password" class="form-control" id="password"
										placeholder="Password" name="password">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-outline">
									<label for="conpassword">Confirm Password</label> <input
										type="password" class="form-control" id="confirmPassword"
										placeholder="Confirm Password" name="confirmPassword">
								</div>
							</div>
							<div class="mt-4 pt-2">
								<!-- <input class="btn btn-primary btn-lg" type="submit"
										style="width: 100%;" value="Register" /> -->
								<button type="submit" id="registerCheck"
									class="btn btn-primary btn-lg" value="Register"
									style="width: 100%;">Register</button>
							</div>

							<p class="text-center mt-3">
								Already have an account? <span class="text-primary"><a
									href="login.jsp">Sign In</a></span>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:include page="footer.jsp"></jsp:include>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js"
	referrerpolicy="origin"></script>
<!-- <script src="form.js"></script> -->
<script>
	jQuery.validator.addMethod("name_regex", function(value, element) {
		return this.optional(element) || value == value.match(/^[a-zA-Z]+$/);
	});

	jQuery.validator.addMethod("address_regex", function(value, element) {
		return this.optional(element) || /[a-zA-z0-9,]$/i.test(value);
	});

	/* jQuery.validator.addMethod("email_regex", function(value, element) {
		return this.optional(element) || /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/i.test(value);
	}); */

	jQuery.validator.addMethod("password_regex", function(value, element) {
		return this.optional(element)
				|| /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8,8})$/i
						.test(value);
	});

	var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var MM = String(today.getMonth() + 1).padStart(2, '0');
	var yyyy = today.getFullYear();
	today = yyyy + '-' + MM + '-' + dd;
	$('#futureDate').attr('max', today);

	$('#formSubmit').validate({
		errorClass : 'error',
		rules : {
			firstName : {
				required : true,
				name_regex : true,
			},
			lastName : {
				required : true,
				name_regex : true,
			},
			email : {
				required : true,
				email_regex : true,
			},
			phoneNumber : {
				required : true,
				number : true,
				minlength : 10,
				maxlength : 10,
			},
			genderRadios : {
				required : true,
			},
			languageCheck : {
				required : true,
			},
			dateOfBirth : {
				required : true,
			},
			education : {
				required : true,
			},
			address : {
				required : true,
			},
			city : {
				required : true,
				name_regex : true,
			},
			state : {
				required : true,
			},
			zipCode : {
				required : true,
				number : true,
				minlength : 6,
				maxlength : 6,
			},
			password : {
				required : true,
				password_regex : true,
			},
			confirmPassword : {
				required : true,
				equalTo : "#password"
			},
		},
		messages : {
			firstName : {
				required : "Enter your First Name.",
				name_regex : "First name only contain letters."
			},
			lastName : {
				required : "Enter your Last Name.",
				name_regex : "Last name only contain letters."
			},
			email : {
				required : "Enter your Email.",
				email_regex : "Please enter valid Email Address."
			},
			phoneNumber : {
				required : "Enter your Phone Number.",
				number : "Please enter only number.",
				minlength : "Phone number contain only 10 Digit.",
				maxlength : "Phone number contain only 10 Digit.",
			},
			genderRadios : {
				required : "Choose your Gender.",
			},
			languageCheck : {
				required : "Choose your Language.",
			},
			dateOfBirth : {
				required : "Choose your Birth Day",
			},
			education : {
				required : "Select your Education.",
			},
			address : {
				required : "Enter your Address.",
			},
			city : {
				required : "Enter your City.",
				name_regex : "City name only contain letters.",
			},
			state : {
				required : "Select your State.",
			},
			zipCode : {
				required : "Enter your area Pin Code Number.",
				number : "Please enter only number.",
				minlength : "Pincode contain only 6 Digit.",
				maxlength : "Pincode contain only 6 Digit.",
			},
			password : {
				required : "Enter your password.",
				password_regex : "Please enter strong password",
			},
			confirmPassword : {
				required : "Enter your confirm password.",
				equalTo : "Confirm password should be same as password."
			},
		},
		errorPlacement : function(error, element) {
			if (element.is(":radio") || element.is(":checkbox")) {
				error.appendTo(element.parents('#selectError'));
			} else {
				error.insertAfter(element);
			}
			error.css('color', 'red', '<br/>');
		}
	});
</script>