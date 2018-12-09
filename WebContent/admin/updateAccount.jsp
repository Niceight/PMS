<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	
	if(session.getAttribute("currentSessionAdminEmail")==null)
	    response.sendRedirect("/PMS/loginAdmin.jsp");
%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Pinda Profil</title>
	<link rel="stylesheet" href="/PMS/css/bulma.min.css" />
	<link rel="stylesheet" href="/PMS/css/parsley.css" />
</head>
<body>
<%	String email = (String)session.getAttribute("currentSessionAdminEmail");
	String name = (String)session.getAttribute("currentSessionAdminName");
	String id = (String)session.getAttribute("currentSessionAdminID");
%>
	<nav class="navbar is-link" role="navigation" aria-label="main navigation">
		<div class="navbar-brand" >
			<a class="navbar-item" href="/PMS/organizer/index.jsp">
				<img alt="" src="/PMS/img/logo/logo-pms.png">
			</a>
			<a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
		      <span aria-hidden="true"></span>
		      <span aria-hidden="true"></span>
		      <span aria-hidden="true"></span>
    		</a>
		</div>
		<div id="navbarBasicExample" class="navbar-menu">
			<div class="navbar-start is-hidden-desktop">
				<a class="navbar-item" href="/PMS/admin/index.jsp">Laman Utama</a>
				<a class="navbar-item is-active" href="/PMS/AdminController?action=viewAccount&admEmail=<c:out value="<%=email%>"/>">Profil Anda</a>
				<a class="navbar-item" href="/PMS/StatusController?action=listProgram">Pengesahan Program</a>
				<a class="navbar-item" href="/PMS/AdminController?action=registerAdmins">Daftar Pentadbir</a>
				<a class="navbar-item" href="/PMS/AdminController?action=viewAdmins&admID=<c:out value="<%=id%>" />">Papar Pentadbir Bawahan</a>
				<a class="navbar-item" href="/PMS/ProgramAdminController?action=insert">Daftar Program</a>
				<a class="navbar-item" href="/PMS/ProgramAdminController?action=myProgram&admID=<c:out value="<%=id%>" />">MyProgram</a>
				<a class="navbar-item" href="/PMS/AdminController?action=report">Papar Laporan</a>
			</div>
			<div class="navbar-end">
				<div class="navbar-item">
					<div class="buttons">
						<a class="button is-light is-rounded" href="/PMS/admin/logout.jsp">Log Keluar</a>
					</div>
				</div>		
			</div>
		</div>
	</nav>
	<section class="hero is-light is-fullheight-with-navbar">
		<div class="container">
			<div class="hero-body">
			    <div class="columns">
					<div class="column is-3 is-hidden-mobile">
						<div class="box">
							<aside class="menu is-medium">
			                    <p class="menu-label">
			                        Umum
			                    </p>
			                    <ul class="menu-list">
			                        <li><a class="" href="/PMS/admin/index.jsp">Laman Utama</a></li>
			                        <li><a>Profil</a>
				                        <ul>
				                        	<li><a class="" href="/PMS/AdminController?action=viewAccount&admEmail=<c:out value="<%=email%>"/>">Profil Anda</a></li>
				                        	<li><a class="is-active has-text-white" href="/PMS/AdminController?action=updateAccount&admEmail=<c:out value="<%=email%>" />">Pinda Profil</a></li>
				                        </ul>
			                        </li>
			                    </ul>
			                    <p class="menu-label">
			                        Urusan Pentadbir
			                    </p>
			                    <ul class="menu-list">
			                    	<li><a class="" href="/PMS/StatusController?action=listProgram">Pengesahan Program</a>	</li>
			                    	<li><a>Pentadbir</a>
				                        <ul>
				                        	<li><a class="" href="/PMS/AdminController?action=registerAdmins">Daftar Pentadbir</a></li>
				                        	<li><a href="/PMS/AdminController?action=viewAdmins&admID=<c:out value="<%=id%>" />">Papar Pentadbir Bawahan</a></li>
				                        </ul>
			                        </li>
			                    </ul>
			                    <p class="menu-label">
			                        Program
			                    </p>
			                    <ul class="menu-list">
			                        <li><a class="" href="/PMS/ProgramAdminController?action=insert">Daftar Program</a></li>
			                        <li><a class="" href="/PMS/ProgramAdminController?action=myProgram&admID=<c:out value="<%=id%>"/>">MyProgram</a>	</li>
			                    </ul>
			                    <p class="menu-label">
			                        Laporan
			                    </p>
			                    <ul class="menu-list">
			                        <li><a class="" href="/PMS/AdminController?action=report">Papar Laporan</a></li>
			                    </ul>
			                </aside>
						</div>

					</div><!-- end column is-3 -->
					<div class="column is-7">
						 <section class="hero is-white">
		                    <div class="hero-body">
		                        <div class="container">
		                            <h1 class="title has-text-dark">
		                                Daftar Pentadbir 
		                            </h1>
		                            
		                            <h2 class="subtitle has-text-dark">
		                                Masukkan semua butiran 👇
		                            </h2>
		                            <form method="post" action="AdminController" data-parsley-validate>
			                        	<div class="field">
			                        		<label class="label">Nama</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="text" name="admName" value="<c:out value="${admin.admName}" />" placeholder="" 
			                                    autofocus data-parsley-required data-parsley-required-message="Ruang ini wajib diisi" 
                                   	 			data-parsley-length="[3, 50]" data-parsley-length-message="Nama anda perlu melebihi 3 huruf dan tidak melebihi 50 huruf">
			                                </div>
			                            </div>
			                            <div class="field">
			                            	<label class="label">E-mel</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="email" name="admEmail" value="<c:out value="${admin.admEmail}" />" placeholder="" readonly>
			                                </div>
			                            </div>
			                            <div class="field">
			                            	<label class="label">Telefon Bimbit</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="text" name="admPhone" value="<c:out value="${admin.admPhone}" />" placeholder="" 
			                                    data-parsley-required data-parsley-required-message="Ruang ini wajib diisi" 
			                                    data-parsley-pattern="/^0\d{9}$|^0\d{10}$/" data-parsley-pattern-message="Telefon bimbit anda tidak perlu ada '-', bermula dengan 0 dan perlu ada 10 digit atau 11 digit" 
			                                    data-parsley-type="number" data-parsley-type-message="Telefon bimbit anda terdapat huruf">
			                                </div>
			                            </div>
			                            <div class="field">
			                                <div class="control">
			                                    <input type="hidden" name="check" value="updateAccount"/>
			                                </div>
			                            </div>
			                            <div class="field">
			                                <div class="control">
			                                    <input type="hidden" name="admID" value="<c:out value="${admin.admID}" />"/>
			                                </div>
			                            </div>
			                            <div class="field">
			                                <div class="control">
			                                    <input type="hidden" name="svID" value="<c:out value="${admin.svID}" />"/>
			                                </div>
			                            </div>
			                            <div class="field">
			                            	<label class="label">Kata Laluan</label>
			                                <div class="control">
			                                    <input id="pass1" class="input is-medium is-rounded" type="password" name="" value="" placeholder="Masukkan Kata Laluan" 
			                                    data-parsley-required data-parsley-required-message="Ruang ini wajib diisi">
			                                </div>
			                            </div>
			                            <div class="field">
			                            	<label class="label">Pastikan Kata Laluan</label>
			                                <div class="control">
			                                    <input id="pass2" class="input is-medium is-rounded" type="password" name="admPassword" value="" placeholder="Masukkan Kata Laluan sekali lagi" 
			                                    data-parsley-required data-parsley-required-message="Ruang ini wajib diisi" 
			                                    data-parsley-equalto="#pass1" data-parsley-equalto-message="Kata laluan ini tidak sama dengan kata laluan diatas" 
			                                    data-parsley-length="[3, 12]" data-parsley-length-message="Kata laluan anda perlu melebihi 3 dan tidak melebihi 12 huruf/digit">
			                                </div>
			                            </div>
			                            <div class="buttons">
			                            	<input class="button is-info is-medium is-rounded is-fullwidth" type="submit" value="Simpan">
			                            </div>
			                        </form>
		                        </div>
		                    </div>
		                </section>
					</div><!-- end column is-9 -->
				</div><!-- end columns -->
			</div><!-- end hero-body -->
		</div><!-- end container -->
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
	    <p>using <a target="_blank" href="https://bulma.io/">Bulma</a> 
	    | <a target="_blank" href="http://parsleyjs.org/">Parsley.js</a> 
	    | <a target="_blank" href="https://www.chartjs.org/">Chart.js</a></p>
	    <p>Source code on <a target="_blank" href="https://github.com/Niceight/PMS">GitHub</a></p>
	  </div>
	</footer>
</body>
</html>