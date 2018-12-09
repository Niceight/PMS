<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Daftar Pengguna</title>
	<link rel="stylesheet" href="css/bulma.min.css" />
	<link rel="stylesheet" href="css/parsley.css" />
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
                <div class="column is-8 is-offset-2">
                    <h3 class="title has-text-grey-darker">Daftar Pengguna</h3>
	                    <p class="subtitle has-text-grey-dark">Masukkan semua butiran 👇</p>
                    <div class="box">
                        <!-- <figure class="avatar">
                            <img src="https://placehold.it/128x128">
                        </figure> -->
                        <form method="post" action="OrganizerController" data-parsley-validate>
                        	<div class="field">
                        		<label class="label">Nama</label>
                                <div class="control">
                                    <input class="input is-medium is-rounded" type="text" name="orgName" value="" placeholder="Masukkan Nama" 
                                    autofocus data-parsley-required data-parsley-required-message="Ruang ini wajib diisi" 
                                    data-parsley-length="[3, 50]" data-parsley-length-message="Nama anda perlu melebihi 3 huruf dan tidak melebihi 50 huruf">
                                </div>
                            </div>
                            <div class="field">
                            	<label class="label">E-mel</label>
                                <div class="control">
                                    <input class="input is-medium is-rounded" data-parsley-type="email" name="orgEmail" value="" placeholder="Masukkan E-Mel" 
                                    data-parsley-required data-parsley-required-message="Ruang ini wajib diisi" 
                                    data-parsley-maxlength="50" data-parsley-maxlength-message="E-mel anda perlu tidak melebihi 50 huruf" >
                                </div>
                            </div>
                            <div class="field">
                            	<label class="label">Kad Pengenalan</label>
                                <div class="control">
                                    <input class="input is-medium is-rounded" type="text" name="orgIC" value="" placeholder="Masukkan Kad Pengenalan" 
                                    data-parsley-required data-parsley-required-message="Ruang ini wajib diisi" 
                                    data-parsley-pattern="/^\d{6}-\d{2}-\d{4}$/" data-parsley-pattern-message="Nombor kad pengenalan anda perlu ada '-' atau terdapat huruf" >
                                </div>
                            </div>
                            <div class="field">
                            	<label class="label">Telefon Bimbit</label>
                                <div class="control">
                                    <input class="input is-medium is-rounded" type="tel" name="orgPhone1" value="" placeholder="Masukkan Telefon Bimbit" 
                                    data-parsley-required data-parsley-required-message="Ruang ini wajib diisi" 
                                    data-parsley-pattern="/^0\d{9}$|^0\d{10}$/" data-parsley-pattern-message="Telefon bimbit anda tidak perlu ada '-', bermula dengan 0 dan perlu ada 10 digit atau 11 digit" 
                                    data-parsley-type="number" data-parsley-type-message="Telefon bimbit anda terdapat huruf">
                                </div>
                            </div>
                            <div class="field">
                            	<label class="label">Telefon Ofis</label>
                                <div class="control">
                                    <input class="input is-medium is-rounded" type="tel" name="orgPhone2" value="" placeholder="Masukkan Telefon Ofis" 
                                    data-parsley-required data-parsley-required-message="Ruang ini wajib diisi" 
                                    data-parsley-pattern="/^0\d{8}$/" data-parsley-pattern-message="Telefon ofis anda tidak perlu ada '-', bermula dengan 0 dan perlu ada 9 digit" 
                                    data-parsley-type="number" data-parsley-type-message="Telefon bimbit anda terdapat huruf">
                                </div>
                            </div>
                            <div class="field">
                            	<label class="label">Jenis Organisasi</label>
                                <div class="control has-text-centered">
                                	<label class="radio">
                                		<input type="radio" name="typeOrganization" value="Kerajaan" data-parsley-required data-parsley-required-message="Ruang ini wajib diisi"> Kerajaan
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
                                    <input class="input is-medium is-rounded" type="text" name="organization" value="" placeholder="Masukkan Nama Organisasi" 
                                    data-parsley-required data-parsley-required-message="Ruang ini wajib diisi" 
                                     data-parsley-length="[3, 50]" data-parsley-length-message="Nama organisasi anda perlu tidak melebihi 50 huruf">
                                </div>
                            </div>
                            <div class="field">
                            	<label class="label">Kata Laluan</label>
                                <div class="control">
                                    <input id="pass1"  class="input is-medium is-rounded" type="password" name="" value="" placeholder="Masukkan Kata Laluan" 
                                    data-parsley-required data-parsley-required-message="Ruang ini wajib diisi" >
                                </div>
                            </div>
                            <div class="field">
                            	<label class="label">Pastikan Kata Laluan</label>
                                <div class="control">
                                    <input id="pass2" class="input is-medium is-rounded" type="password" name="orgPassword" value="" placeholder="Masukkan Kata Laluan" 
                                    data-parsley-required data-parsley-required-message="Ruang ini wajib diisi" 
                                    data-parsley-equalto="#pass1" data-parsley-equalto-message="Kata laluan ini tidak sama dengan kata laluan diatas" 
                                    data-parsley-length="[3, 12]" data-parsley-length-message="Kata laluan anda perlu melebihi 3 dan tidak melebihi 12 huruf/digit">
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
    <script src="js/jquery.js"></script>
	<script src="js/parsley.min.js"></script>
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
	    <p>using <a target="_blank" href="https://bulma.io/">Bulma</a></p>
	    <p>Source code on <a target="_blank" href="https://github.com/Niceight/PMS">GitHub</a></p>
	  </div>
	 </footer>
</body>
</html>