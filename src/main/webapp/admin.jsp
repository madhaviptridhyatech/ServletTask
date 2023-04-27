<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<title>Admin</title>
<head>
<jsp:include page="main.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
</head>
<body>
	<%-- <center>
		<b><c:if test="${sessionScope.incorrect!=null}">
				<div id="alert" class="alert alert-success">Admin Login
					Successful.</div>
			</c:if></b>
	</center>
	<script>
		setTimeout(function() {
			$('#alert').alert('close');
		}, 1000);
	</script> --%>
	<div style="margin-top: 15px;">
		<div>
			<a href="/ServletTask/" type="button" class="btn btn-primary"
				style="float: right; margin-right: 60px;">Logout</a>
		</div>
		<div>
			<center>
				<h2 class="text-primary" style="text-align: center;">Admin Dashboard</h2>
			</center>
		</div>

		<section class="intro">
			<table class="table table-striped">
				<thead style="background-color: LightCoral; color: white;">
					<tr>
						<th scope="col">ID</th>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">Email</th>
						<th scope="col">Phone Number</th>
						<th scope="col">Gender</th>
						<th scope="col">Language</th>
						<th scope="col">Date of Birth</th>
						<th scope="col">Education</th>
						<th scope="col">Address</th>
						<th scope="col">City</th>
						<th scope="col">State</th>
						<th scope="col">Pin Code</th>
						<th scope="col">Password</th>
						<th scope="col">Edit</th>
						<th scope="col">Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${userData}">
						<tr>
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.firstName}" /></td>
							<td><c:out value="${user.lastName}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.phoneNumber}" /></td>
							<td><c:out value="${user.genderRadios}" /></td>
							<td><c:out value="${user.languageCheck}" /></td>
							<td><c:out value="${user.dateOfBirth}" /></td>
							<td><c:out value="${user.education}" /></td>
							<td><c:out value="${user.address}" /></td>
							<td><c:out value="${user.city}" /></td>
							<td><c:out value="${user.state}" /></td>
							<td><c:out value="${user.zipCode}" /></td>
							<td><c:out value="${user.password}" /></td>
							<td><a href="editUser?id=${user.id}" class="btn btn-success">Edit</a></td>

							<td><a href="deleteUser?id=${user.id}"
								class="btn btn-danger">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>