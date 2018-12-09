<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Log Masuk Pentadbir</title>
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
			<div class="navbar-end" >
				<div class="navbar-item">
					<div class="buttons">
						<a class="button is-light is-rounded" href="/PMS/register.jsp">Daftar Pengguna</a>
						<a class="button is-light is-rounded" href="/PMS/login.jsp">Log Masuk Pengguna</a>
						<a class="button is-primary is-rounded" href="/PMS/loginAdmin.jsp">Log Masuk Pentadbir</a>
					</div>
				</div>		
			</div>
		</div>
	</nav>
	<section class="hero is-light is-fullheight-with-navbar">
        <div class="hero-body">
            <div class="container has-text-centered">
                <div class="column is-4 is-offset-4">
                    <h3 class="title has-text-grey-darker">Log Masuk Pentadbir</h3>
	                    <p class="subtitle has-text-grey-dark">Sila log masuk.</p>
                    <div class="box">
	                    
                        <!-- <figure class="avatar">
                            <img src="">
                        </figure> -->
                        <form method="get" action="LoginController">
                        	<div class="field">
                                <div class="control">
                                    <input class="input is-large is-rounded" type="email" name="admEmail" value="" placeholder="Masukkan e-mel" autofocus required>
                                </div>
                            </div>
                            <div class="field">
                                <div class="control">
                                    <input class="input is-large is-rounded" type="password" name="admPassword" value="" placeholder="Masukkan kata laluan" required>
                                </div>
                            </div>
							
							<input type="hidden" name="userType" value="admin" required>
							<input class="button is-block is-info is-large is-fullwidth is-rounded" type="submit" value="Log Masuk">
                        </form>
                       
                    </div>
                     <p class="has-text-grey-darker">
	                        <a href="/PMS/register.jsp">Daftar Pengguna</a> &nbsp;·&nbsp;
	                        <a href="/PMS/login.jsp">Log Masuk Pengguna</a>
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
	<footer class="footer">
	  <div class="content has-text-centered">
	    <p>This website was handcrafted with ❤️ </p>
	    <p>by UMMAH InfoSys</p>
	    <p>using <a target="_blank" href="https://bulma.io/">Bulma</a> 
	    | <a target="_blank" href="http://parsleyjs.org/">Parsley.js</a> 
	    | <a target="_blank" href="https://www.chartjs.org/">Chart.js</a></p>
	    <p>Source code on <a target="_blank" href="https://github.com/Niceight/PMS">GitHub</a></p>
	  </div>
	 </footer>
</body>
</html>