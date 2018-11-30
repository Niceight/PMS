<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Log Masuk</title>
	<link rel="stylesheet" href="css/bulma.min.css" />
	<!-- <link rel="stylesheet" href="css/bg.css" /> -->
    <!-- <link rel="stylesheet" type="text/css" href="css/bulma.css"> -->
 	<!-- <link rel="stylesheet" type="text/css" href="css/debug.css"> -->
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
			<div class="navbar-end" >
				<div class="navbar-item">
					<div class="buttons">
						<a class="button is-light is-rounded" href="/PMS/register.jsp">Daftar Pengguna</a>
						<a class="button is-primary is-rounded" href="/PMS/login.jsp">Log Masuk Pengguna</a>
						<a class="button is-light is-rounded" href="/PMS/loginAdmin.jsp">Log Masuk Pentadbir</a>
					</div>
				</div>		
			</div>
		</div>
	</nav>
	<section class="hero is-light is-fullheight-with-navbar">
        <div class="hero-body">
            <div class="container has-text-centered">
                <div class="column is-4 is-offset-4">
                    <h3 class="title has-text-grey-darker">Log Masuk Pengguna</h3>
	                    <p class="subtitle has-text-grey-dark">Sila log masuk.</p>
                    <div class="box">
	                    
                        <!-- <figure class="avatar">
                            <img src="https://placehold.it/128x128">
                        </figure> -->
                        <form method="get" action="LoginController">
                        	<div class="field">
                                <div class="control">
                                    <input class="input is-large is-rounded" type="email" name="orgEmail" value="" placeholder="Masukkan e-mel" autofocus required>
                                </div>
                            </div>
                            <div class="field">
                                <div class="control">
                                    <input class="input is-large is-rounded" type="password" name="orgPassword" value="" placeholder="Masukkan kata laluan" required>
                                </div>
                            </div>
							
							<input type="hidden" name="userType" value="organizer" required>
							<input class="button is-block is-info is-large is-fullwidth is-rounded" type="submit" value="Log Masuk">
                        </form>
                       
                    </div>
                     <p class="has-text-grey-darker">
	                        <a href="/PMS/register.jsp">Daftar Pengguna</a> &nbsp;·&nbsp;
	                        <a href="/PMS/loginAdmin.jsp">Log Masuk Pentadbir</a>
                    	</p>
                </div>
            </div>
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