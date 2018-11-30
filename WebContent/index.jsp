<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Laman Utama</title>
	<link rel="stylesheet" href="css/bulma.min.css" />
</head>

<body>
	<nav class="navbar is-light" role="navigation" aria-label="main navigation">
		<div class="navbar-brand" >
			<a class="navbar-item" href="/PMS/index.jsp">
				<img alt="" src="/PMS/img/logo/logo-pms.png">
			</a>
			<a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
		      <span aria-hidden="true"></span>
		      <span aria-hidden="true"></span>
		      <span aria-hidden="true"></span>
    		</a>
		</div>
		<div id="navbarBasicExample" class="navbar-menu">
			<div class="navbar-start">
				<a class="navbar-item" href="/PMS/index.jsp">
					Laman Utama
				</a>		
			</div>
			<div class="navbar-end">
				<div class="navbar-item">
					<div class="buttons">
						<a class="button is-light is-rounded" href="/PMS/register.jsp">Daftar Pengguna</a>
						<a class="button is-light is-rounded" href="/PMS/login.jsp">Log Masuk Pengguna</a>
						<a class="button is-light is-rounded" href="/PMS/loginAdmin.jsp">Log Masuk Pentadbir</a>
					</div>
				</div>		
			</div>
		</div>
	</nav>
<body>
	<section class="hero is-light is-fullheight-with-navbar">
	  <!-- Hero content: will be in the middle -->
	  <div class="hero-body">
	    <div class="container has-text-centered">
	      <h1 class="title">
	        SELAMAT DATANG KE PROGRAM MANAGEMENT SYSTEM
	      </h1>
	      <h2 class="subtitle">
	        untuk Masjid As-sajidin
	      </h2>
	    </div>
	  </div>
	
	  <!-- Hero footer: will stick at the bottom -->
	  <div class="hero-foot">
	    <nav class="tabs is-boxed is-fullwidth">
	      <div class="container">
	        <ul>
	          <li class="is-active"><a>Laman Utama</a></li>
	          <li><a>Sejarah</a></li>
	          <li><a>Galeri</a></li>
	          <li><a>Organisasi</a></li>
	          <li><a>Hubungi</a></li>
	        </ul>
	      </div>
	    </nav>
	  </div>
	</section>
	<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', () => {

		  // Get all "navbar-burger" elements
		  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

		  // Check if there are any navbar burgers
		  if ($navbarBurgers.length > 0) {

		    // Add a click event on each of them
		    $navbarBurgers.forEach( el => {
		      el.addEventListener('click', () => {

		        // Get the target from the "data-target" attribute
		        const target = el.dataset.target;
		        const $target = document.getElementById(target);

		        // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
		        el.classList.toggle('is-active');
		        $target.classList.toggle('is-active');

		      });
		    });
		  }

		});
	</script>
</body>
</html>