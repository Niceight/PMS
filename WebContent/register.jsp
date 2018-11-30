<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Daftar Pengguna</title>
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
						<a class="button is-primary is-rounded" href="/PMS/register.jsp">Daftar Pengguna</a>
						<a class="button is-light is-rounded" href="/PMS/login.jsp">Log Masuk Pengguna</a>
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
                    <h3 class="title has-text-grey-darker">Daftar Pengguna</h3>
	                    <p class="subtitle has-text-grey-dark">Masukkan semua butiran.</p>
                    <div class="box">
                        <!-- <figure class="avatar">
                            <img src="https://placehold.it/128x128">
                        </figure> -->
                        <form method="post" action="OrganizerController">
                        	<div class="field">
                        		<label class="label">Nama</label>
                                <div class="control">
                                    <input class="input is-medium is-rounded" type="text" name="orgName" value="" placeholder="Masukkan Nama" autofocus required>
                                </div>
                            </div>
                            <div class="field">
                            	<label class="label">E-mel</label>
                                <div class="control">
                                    <input class="input is-medium is-rounded" type="email" name="orgEmail" value="" placeholder="Masukkan E-Mel" required>
                                </div>
                            </div>
                            <div class="field">
                            	<label class="label">Kad Pengenalan</label>
                                <div class="control">
                                    <input class="input is-medium is-rounded" type="text" name="orgIC" value="" placeholder="Masukkan Kad Pengenalan" required>
                                </div>
                            </div>
                            <div class="field">
                            	<label class="label">Telefon 1</label>
                                <div class="control">
                                    <input class="input is-medium is-rounded" type="tel" name="orgPhone1" value="" placeholder="Masukkan Telefon 1" required>
                                </div>
                            </div>
                            <div class="field">
                            	<label class="label">Telefon 2</label>
                                <div class="control">
                                    <input class="input is-medium is-rounded" type="tel" name="orgPhone2" value="" placeholder="Masukkan Telefon 2" required>
                                </div>
                            </div>
                            <div class="field">
                            	<label class="label">Jenis Organisasi</label>
                                <div class="control has-text-centered">
                                	<label class="radio">
                                		<input type="radio" name="typeOrganization" value="Kerajaan"> Kerajaan
									</label>
									<label class="radio">
									    <input type="radio" name="typeOrganization" value="Swasta"> Swasta
									</label>
									<label class="radio">
									    <input type="radio" name="typeOrganization" value="Institusi"> Institusi 
									</label>
                                </div>
                            </div>
                            <div class="field">
                            	<label class="label">Nama Organisasi</label>
                                <div class="control">
                                    <input class="input is-medium is-rounded" type="text" name="organization" value="" placeholder="Masukkan Nama Organisasi" required>
                                </div>
                            </div>
                            <div class="field">
                            	<label class="label">Kata Laluan</label>
                                <div class="control">
                                    <input class="input is-medium is-rounded" type="password" name="orgPassword" value="" placeholder="Masukkan Kata Laluan" required>
                                </div>
                            </div>
                            <div class="buttons">
                            	<input class="button is-info is-medium is-fullwidth is-rounded" type="submit" value="Daftar">
								<input class="button is-danger is-medium is-fullwidth is-rounded" type="reset" value="Semula">
                            </div>
                        </form>
                       
                    </div>
                     <p class="has-text-grey-darker">
                        <a href="/PMS/login.jsp">Log Masuk Pengguna</a> &nbsp;·&nbsp;
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