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
	<title>Daftar Program</title>
	<link rel="stylesheet" href="/PMS/css/bulma.min.css" />
	<style>
		/* Style the tab content */
		.tabcontent {
		    display: none;
		    padding: 6px 12px;
		    -webkit-animation: fadeEffect 1s;
		    animation: fadeEffect 1s;
		}
		
		/* Fade in tabs */
		@-webkit-keyframes fadeEffect {
		    from {opacity: 0;}
		    to {opacity: 1;}
		}
		
		@keyframes fadeEffect {
		    from {opacity: 0;}
		    to {opacity: 1;}
		}
	</style>
</head>
<body >
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
				<a class="navbar-item" href="/PMS/AdminController?action=viewAccount&admEmail=<c:out value="<%=email%>"/>">Profil Anda</a>
				<a class="navbar-item" href="/PMS/StatusController?action=listProgram">Pengesahan Program</a>
				<a class="navbar-item" href="/PMS/AdminController?action=registerAdmins">Daftar Pentadbir</a>
				<a class="navbar-item" href="/PMS/AdminController?action=viewAdmins&admID=<c:out value="<%=id%>" />">Papar Pentadbir Bawahan</a>
				<a class="navbar-item" href="/PMS/ProgramAdminController?action=insert">Daftar Program</a>
				<a class="navbar-item is-active" href="/PMS/ProgramAdminController?action=myProgram&admID=<c:out value="<%=id%>" />">MyProgram</a>
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
				                        	<li><a href="/PMS/AdminController?action=updateAccount&admEmail=<c:out value="<%=email%>" />">Pinda Profil</a></li>
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
			                        <li><a class="is-active has-text-white" href="/PMS/ProgramAdminController?action=myProgram&admID=<c:out value="<%=id%>"/>">MyProgram</a>	</li>
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
		                        <div class="container is-widescreen">
		                        	<div class="tabs is-toggle is-toggle-rounded is-fullwidth">
									    <ul>
									    	<li class="tablinks" onclick="openProgram(event, 'Diproses')"><a>Diproses</a></li>
										    <li class="tablinks" onclick="openProgram(event, 'Lulus')"><a>Lulus</a></li>
										    <li class="tablinks" onclick="openProgram(event, 'Gagal')"><a>Gagal</a></li>
									    </ul>
									</div>
								    <div id="Diproses" class="tabcontent">
								      <table class="table is-hoverable is-fullwidth">
								      	<thead>
								      		<tr>
										      	<th>Bil.</th>
										        <th>Nama Program</th>
									      </tr>
								      	</thead>
									  <c:forEach items="${programsDiproses}" var="program" varStatus="theCount">
									  	<tbody>
									  		<tr>
									  			<th><c:out value="${theCount.count}" /></th>
									  			<td><a href="ProgramAdminController?action=viewProgram&progID=<c:out value="${program.progID}" />"><c:out value="${program.progName}" /></a></td>
									  		</tr>
									  	</tbody>
									    </c:forEach>
									</table>
								    </div>
								    <div id="Lulus" class="tabcontent">
								      <table class="table is-hoverable is-fullwidth">
									    <thead>
								      		<tr>
										      	<th>Bil.</th>
										        <th>Nama Program</th>
									      </tr>
								      	</thead>
									  <c:forEach items="${programsLulus}" var="program" varStatus="theCount">
									  	<tbody>
									  		<tr>
									  			<th><c:out value="${theCount.count}" /></th>
									  			<td><a href="ProgramAdminController?action=viewProgram&progID=<c:out value="${program.progID}" />"><c:out value="${program.progName}" /></a></td>
									  		</tr>
									  	</tbody>
									    </c:forEach>
									   </table>
								    </div>
								    <div id="Gagal" class="tabcontent">
								    	<table class="table is-hoverable is-fullwidth">
										    <thead>
									      		<tr>
											      	<th>Bil.</th>
											        <th>Nama Program</th>
										      </tr>
									      	</thead>
										  <c:forEach items="${programsGagal}" var="program" varStatus="theCount">
										  	<tbody>
										  		<tr>
										  			<th><c:out value="${theCount.count}" /></th>
										  			<td><a href="ProgramAdminController?action=viewProgram&progID=<c:out value="${program.progID}" />"><c:out value="${program.progName}" /></a></td>
										  		</tr>
										  	</tbody>
										    </c:forEach>
										</table>
								    </div>
								    <div class="buttons is-right">
								    	<a class="button is-medium is-info is-rounded" href="ProgramAdminController?action=insert">Daftar Program</a>
								    </div>
		                        </div>
		                    </div>
		                </section>
					</div><!-- end column is-9 -->
				</div><!-- end columns -->
			</div><!-- end hero-body -->
		</div><!-- end container -->
	</section>
	<script type="text/javascript">
	function openProgram(evt, status) {
	    var i, tabcontent, tablinks;
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }
	    tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" is-active", "");
	    }
	    document.getElementById(status).style.display = "block";
	    evt.currentTarget.className += " is-active";
	}

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
	<script>
		var mybtn = document.getElementsByClassName("tablinks")[0];
		mybtn.click();
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