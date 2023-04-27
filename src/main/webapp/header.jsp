<link rel="stylesheet" href="css/header.css">
<title>Header</title>
<jsp:include page="main.jsp"></jsp:include>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark p-3">
		<div class="container-fluid">
			<!-- <div>
				<img src="img/logo.png" class="img">
			</div> -->
			<a class="navbar-brand" href="#">Tridhya Tech</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class=" collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav ms-auto ">
					 <li class="nav-item"><a class="nav-link mx-2 active"
						aria-current="page" href="/ServletTask/">Home</a></li>
					 <!-- <li class="nav-item"><a class="nav-link mx-2" href="login.jsp">Login</a>
					</li>
					<li class="nav-item"><a class="nav-link mx-2"
						href="register.jsp">Sign up</a></li> -->
				</ul>
			</div>
		</div>
	</nav>