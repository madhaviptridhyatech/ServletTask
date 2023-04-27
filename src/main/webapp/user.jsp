<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<title>User List</title>
<jsp:include page="main.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>

<%-- <center>
	<b><c:if test="${sessionScope.incorrect!=null}">
			<div id="alert" class="alert alert-success">User Login Successful.</div>
		</c:if></b>
</center>
<script>
	setTimeout(function() {
		$('#alert').alert('close');
	}, 2000);
</script> --%>
<section class="vh-100">
	<div class="container py-5 h-100">
		<div>
			<a href="/ServletTask/" type="button" class="btn btn-primary"
				style="float: right; margin-right: 60px;">Logout</a>
		</div>
		<div class="row justify-content-center align-items-center h-100">
			<div class="col-12 col-lg-9 col-xl-7">
				<div class="card shadow-2-strong card-registration"
					style="border-radius: 15px;">
					<div class="card-body p-4 p-md-5">
						<h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-primary">
							<center>Update User Form by User</center>
						</h3>
						<c:forEach var="user" items="${userData}">
							<form action="updateUser" method="post" id="updateUserForm">
								<div class="row">
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<label class="form-label" for="firstName">First Name</label>
											<input type="text" id="firstName" name="firstName"
												class="form-control form-control"
												value="<c:out value='${user.firstName}' />" />
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<label class="form-label" for="lastName">Last Name</label> <input
												type="text" id="lastName" name="lastName"
												class="form-control form-control"
												value="<c:out value='${user.lastName}' />" />
										</div>

									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label class="form-label" for="emailAddress">Email</label> <input
												type="email" id="email" name="email"
												class="form-control form-control"
												value="<c:out value='${user.email}' />" readonly />
										</div>

									</div>
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label class="form-label" for="phoneNumber">Phone
												Number</label> <input type="text" id="phoneNumber"
												name="phoneNumber" class="form-control form-control"
												value="<c:out value='${user.phoneNumber}' />" readonly />
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
														name="genderRadios" id="male" value="Male"
														${user.genderRadios=='Male'?'checked':''} /> <label
														class="form-check-label" for="gridRadios1"> Male </label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="genderRadios" id="female" value="Female"
														${user.genderRadios=='Female'?'checked':''} /> <label
														class="form-check-label" for="gridRadios2"> Female</label>
												</div>
												<div class="form-check disabled">
													<input class="form-check-input" type="radio"
														name="genderRadios" id="other" value="Other"
														${user.genderRadios=='Other'?'checked':''} /> <label
														class="form-check-label" for="gridRadios3"> Other</label>
												</div>
											</div>
										</fieldset>
									</div>
									<div class="form-group col-md-6">
										<c:set var="languageCheck" value="${user.languageCheck}" />
										<c:set var="strLanguageCheck"
											value="${fn:split(languageCheck, ' ')}" />
										<c:set var="checkLength"
											value="${fn:length(strLanguageCheck)}" />

										<fieldset class="form-group row">
											<legend class="col-form-label col-sm-4 float-sm-left pt-0">Language</legend>
											<div class="col-sm-8" id="selectError">
												<div class="form-check">
													<input type="checkbox" value="Gujarati"
														name="languageCheck"
														<c:forEach var="check" begin="0" end="${checkLength-1}"><c:if test="${strLanguageCheck[check] == 'Gujarati' }">checked</c:if></c:forEach>>
													<label class="form-check-label" for="gridCheck1">
														Gujarati </label>
												</div>
												<div class="form-check">
													<input type="checkbox" value="Hindi" name="languageCheck"
														<c:forEach var="check" begin="0" end="${checkLength-1}"><c:if test="${strLanguageCheck[check] == 'Hindi' }">checked</c:if></c:forEach>>
													<label class="form-check-label" for="gridCheck1">
														Hindi </label>
												</div>
												<div class="form-check">
													<input type="checkbox" value="English" name="languageCheck"
														<c:forEach var="check" begin="0" end="${checkLength-1}"><c:if test="${strLanguageCheck[check] == 'English' }">checked</c:if></c:forEach>>
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
												name="dateOfBirth"
												value="<c:out value='${user.dateOfBirth}' />">

										</div>
									</div>
									<div class="col-md-6 mb-4">
										<label for="inputState">Education</label> <select
											id="inputEducation" class="select form-control"
											name="education">
											<option></option>
											<option value="Graduate"
												${user.education == 'Graduate' ? 'selected' : '' }
												name="education" id="graduate">Graduate</option>
											<option value="Under Graduate"
												${user.education == 'Under Graduate' ? 'selected' : '' }
												name="education" id="ugraduate">Under Graduate</option>
											<option value="Post Graduate"
												${user.education == 'Post Graduate' ? 'selected' : '' }
												name="education" id="pgraduate">Post Graduate</option>
										</select>
									</div>
								</div>
								<div class="row">
									<label for="inputAddress">Address</label>
									<textarea rows="4" cols="10" id="address" name="address"
										placeholder="Plot no,Society name,area...">
									<c:out value='${user.address}' />
									</textarea>
								</div>
								<br>
								<div class="row">
									<div class="form-outline col-md-4">
										<label for="inputCity">City</label> <input type="text"
											class="form-control" id="inputCity" name="city"
											value="<c:out value='${user.city}' />" />
									</div>
									<div class="form-outline col-md-4">
										<label for="inputState">State</label> <select id="inputState"
											class="select form-control" name="state">
											<option></option>
											<option value="Gujarat"
												${user.state == 'Gujarat' ? 'selected' : '' } name="state"
												id="gj">Gujarat</option>
											<option value="Maharashtra"
												${user.state == 'Maharashtra' ? 'selected' : '' }
												name="state" id="mh">Maharashtra</option>
											<option value="MP" ${user.state == 'MP' ? 'selected' : '' }
												name="state" id="mp">MP</option>
										</select>
									</div>
									<div class="form-outline col-md-4">
										<label for="inputZip">Pin Code</label> <input type="text"
											class="form-control" id="inputZip" name="zipCode"
											value="<c:out value='${user.zipCode}' />" />
									</div>
								</div>

								<div class="mt-4 pt-2">
									<%-- <a href="updateUser?email=${user.email}" class="btn btn-primary btn-lg" style="width: 100%;">Save</a> --%>
									<input class="btn btn-primary btn-lg" style="width: 100%;"
										value="Save" type="submit">
								</div>
							</form>
						</c:forEach>
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
<script>
	jQuery.validator.addMethod("name_regex", function(value, element) {
		return this.optional(element) || value == value.match(/^[a-zA-Z]+$/);
	});

	var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var MM = String(today.getMonth() + 1).padStart(2, '0');
	var yyyy = today.getFullYear();
	today = yyyy + '-' + MM + '-' + dd;
	$('#futureDate').attr('max', today);

	$('#updateUserForm').validate({
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