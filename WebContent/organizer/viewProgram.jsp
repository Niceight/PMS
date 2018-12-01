<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	
	if(session.getAttribute("currentSessionOrganizerEmail")==null)
	    response.sendRedirect("/PMS/login.jsp");
%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Anjung Pengguna</title>
	<link rel="stylesheet" href="/PMS/css/bulma.min.css" />
	
</head>
<body onload="programType(x,y,z)">
<%	String email = (String)session.getAttribute("currentSessionOrganizerEmail");
	String name = (String)session.getAttribute("currentSessionOrganizerName");
	String id = (String)session.getAttribute("currentSessionOrganizerID");
%>
	<nav class="navbar is-primary" role="navigation" aria-label="main navigation">
		<div class="container">
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
					<a class="navbar-item" href="/PMS/organizer/index.jsp">Laman Utama</a>
					<a class="navbar-item" href="/PMS/OrganizerController?action=viewAccount&orgEmail=<c:out value="<%=email%>"/>">Profil Anda</a>
					<a class="navbar-item" href="/PMS/ProgramController?action=insert">Daftar Program</a>
					<a class="navbar-item is-active" href="/PMS/ProgramController?action=myProgram&orgID=<c:out value="<%=id%>"/>">MyProgram</a>
				</div>
				<div class="navbar-end">
					<div class="navbar-item">
						<div class="buttons">
							<a class="button is-light is-rounded" href="/PMS/organizer/logout.jsp">Log Keluar</a>
						</div>
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
			                        <li><a class="" href="/PMS/organizer/index.jsp">Laman Utama</a></li>
			                        <li><a>Profil</a>
				                        <ul>
				                        	<li><a class="" href="/PMS/OrganizerController?action=viewAccount&orgEmail=<c:out value="<%=email%>"/>">Profil Anda</a></li>
				                        	<li><a href="/PMS/OrganizerController?action=updateAccount&orgEmail=<c:out value="<%=email%>" />">Pinda Profil</a></li>
				                        </ul>
			                        </li>
			                    </ul>
			                    <p class="menu-label">
			                        Program
			                    </p>
			                    <ul class="menu-list">
			                        <li><a class="" href="/PMS/ProgramController?action=insert">Daftar Program</a></li>
			                        <li><a class="is-active has-text-white" href="/PMS/ProgramController?action=myProgram&orgID=<c:out value="<%=id%>"/>">MyProgram</a>	</li>
			                    </ul>
			                </aside>
						</div>

					</div><!-- end column is-3 -->
					<div class="column is-7">
						 <section class="hero is-white">
		                    <div class="hero-body">
		                        <div class="container">
									<h1 class="title has-text-dark">
		                                Program <c:out value="${program.progName}" />.
		                            </h1>

		                            <label class="label">Program ID</label>
		                            <p class="content is-medium"><c:out value="${program.progID}" /></p>
		                            
		                            <label class="label">Nama Program</label>
		                            <p class="content is-medium"><c:out value="${program.progName}" /></p>
		                            
		                            <label class="label">Jenis Program</label>
		                            <p class="content is-medium"><c:out value="${program.progType}" /></p>
		                            
		                            <label class="label">Tarikh Mula Program</label>
		                            <p class="content is-medium"><c:out value="${program.progStartDate}" /></p>
		                            
		                            <label class="label">Tarikh Tamat Program</label>
		                            <p class="content is-medium"><c:out value="${program.progEndDate}" /></p>
		                            
									<label class="label">Masa Mula Program</label>
		                            <p class="content is-medium"><c:out value="${program.progStartTime}" /></p>
		                            
		                            <label class="label">Masa Tamat Program</label>
		                            <p class="content is-medium"><c:out value="${program.progEndTime}" /></p>
		                            
		                            <label class="label">Tempat Program</label>
		                            <p class="content is-medium" id="venue"></p>
		                            
		                            <div class="content" id="num" style="display:none">
		                            	<label class="label">Jumlah Peserta</label>
										<p class="content is-medium"><c:out value="${closedProgram.numParticipant}" /></p>
									</div>
									
									<div class="content" id="vip" style="display:none">
										<label class="label">Nama VIP</label>
										<p class="content is-medium"><c:out value="${openProgram.vipName}" /></p>
									</div>
									
									<label class="label">Status Program</label>
		                            <p class="content is-medium"><strong><c:out value="${statusProgram.status}" /></strong></p>
		                            
		                           	<div class="buttons">
									 	<a id="status" style="display:none" class="button is-medium is-info is-rounded" href="ProgramController?action=updateProgram&progID=<c:out value="${program.progID}"/>">Pinda Program</a>
										<a onclick="return confirm('Anda pasti batal program ini? 😮');" class="button is-medium is-danger is-rounded" href="ProgramController?action=deleteProgram&progID=<c:out value="${program.progID}"/>&orgID=<c:out value="<%=id%>"/> ">Batal Program</a>
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
	var x = new String('${program.progType}');
	var y = new String('${statusProgram.status}');
	var z = new String('${program.venueID}');
	function programType(x,y,z) {
		if(x == "Umum") {
			document.getElementById('num').style.display='none';
			document.getElementById('vip').style.display='block';
		}
		else {
			document.getElementById('num').style.display='block';
			document.getElementById('vip').style.display='none';
		}
		if(y == "DIPROSES") {
			document.getElementById('status').style.display='block';
		}
		else {
			document.getElementById('status').style.display='none';
		}
		if(z == "1") {
			var venue = "Dalam Masjid";
		}
		else if(z == "2") {
			var venue = "Luar Masjid";
		}
		else {
			var venue = "Bilik Mesyuarat";
		}
		document.getElementById("venue").innerHTML=venue;
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