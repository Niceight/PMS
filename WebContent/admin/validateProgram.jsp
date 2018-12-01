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
	<title>Pengesahan Program</title>
	<link rel="stylesheet" href="/PMS/css/bulma.min.css" />
</head>
<body onload="programType(x)">
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
				<a class="navbar-item is-active" href="/PMS/StatusController?action=listProgram">Pengesahan Program</a>
				<a class="navbar-item" href="/PMS/ProgramController?action=insert">Daftar Program</a>
				<a class="navbar-item" href="/PMS/ProgramController?action=myProgram&admID=<c:out value="<%=id%>"/>">MyProgram</a>
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
				                        	<li><a class="" href="/PMS/OrganizerController?action=viewAccount&orgEmail=<c:out value="<%=email%>"/>">Profil Anda</a></li>
				                        	<li><a href="/PMS/OrganizerController?action=updateAccount&orgEmail=<c:out value="<%=email%>" />">Pinda Profil</a></li>
				                        </ul>
			                        </li>
			                    </ul>
			                    <p class="menu-label">
			                        Urusan Pentadbir
			                    </p>
			                    <ul class="menu-list">
			                    	<li><a class="is-active has-text-white" href="/PMS/StatusController?action=listProgram">Pengesahan Program</a>	</li>
			                    	<li><a>Pentadbir</a>
				                        <ul>
				                        	<li><a class="" href="/PMS/AdminController?action=insert">Daftar Pentadbir</a></li>
				                        	<li><a href="/PMS/OrganizerController?action=updateAccount&orgEmail=<c:out value="<%=email%>" />">Papar Pentadbir Bawahan</a></li>
				                        </ul>
			                        </li>
			                    </ul>
			                    <p class="menu-label">
			                        Program
			                    </p>
			                    <ul class="menu-list">
			                        <li><a class="" href="/PMS/ProgramController?action=insert">Daftar Program</a></li>
			                        <li><a class="" href="/PMS/ProgramController?action=myProgram&admID=<c:out value="<%=id%>"/>">MyProgram</a>	</li>
			                    </ul>
			                    <p class="menu-label">
			                        Laporan
			                    </p>
			                    <ul class="menu-list">
			                        <li><a class="" href="/PMS/AdminController?action=insert">Papar Laporan</a></li>
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
		                            
		                            <label class="label">Nama Pengajur</label>
		                            <p class="content is-medium"><c:out value="${statusProgram.validateOrgName}" /></p>
		                            
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
		                            <p class="content is-medium"><strong><c:out value="${statusProgram.validateStatus}" /></strong></p>
		                            
		                            <label class="label">Dikemaskini Oleh</label>
		                            <p class="content is-medium"><c:out value="${statusProgram.validateAdmName}" /></p>
		                            
		                            <label class="label">Tarikh kemaskini</label>
		                            <p class="content is-medium"><c:out value="${statusProgram.validateStatusDate}" /></p>
		                            
		                           	<div class="buttons">
									 	<a onclick="return confirm('Anda pasti LULUS-kan program ini? 😃');"class="button is-medium is-success is-rounded" href="StatusController?action=approveProgram&progID=<c:out value="${program.progID}"/>&admID=<c:out value="<%=id%>"/>">Lulus ✔️</a>
										<a onclick="return confirm('Anda pasti GAGAL-kan program ini? 😮');" class="button is-medium is-danger is-rounded" href="StatusController?action=rejectProgram&progID=<c:out value="${program.progID}"/>&admID=<c:out value="<%=id%>"/>">Gagal ❌</a>
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
	function programType(x) {
		if(x == "Umum") {
			document.getElementById('num').style.display='none';
			document.getElementById('vip').style.display='block';
		}
		else {
			document.getElementById('num').style.display='block';
			document.getElementById('vip').style.display='none';
		}
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

									
<%-- <p>Program ID : <c:out value="${program.progID}" /></p>
<p>Nama Penganjur : <c:out value="${statusProgram.validateOrgName}" /></p>
<p>Nama Program : <c:out value="${program.progName}" /></p>
<p>Jenis Program : <c:out value="${program.progType}" /></p>
<p>Tarikh Mula Program : <c:out value="${program.progStartDate}" /></p>
<p>Tarikh Tamat Program : <c:out value="${program.progEndDate}" /></p>
<p>Masa Mula Program : <c:out value="${program.progStartTime}" /></p>
<p>Masa Tamat Program : <c:out value="${program.progEndTime}" /></p>
<p>Tempat Program : <c:out value="${program.venueID}" /></p>
<div id="num" style="display:none">
	<p>Jumlah Peserta : <c:out value="${closedProgram.numParticipant}" /></p>
</div>
<div id="vip" style="display:none">
	<p>Nama VIP : <c:out value="${openProgram.vipName}" /></p>
</div>
<p>Status Program : <b><c:out value="${statusProgram.validateStatus}" /></b></p>
<p>Dikemaskini Oleh : <c:out value="${statusProgram.validateAdmName}" /></p>
<p>Tarikh kemaskini : <c:out value="${statusProgram.validateStatusDate}" /></p>

 <br/><br/>
 <p><a href="StatusController?action=approveProgram&progID=<c:out value="${program.progID}"/>&admID=<c:out value="<%=id%>"/>"><b>Lulus</b></a></p>
 <p><a href="StatusController?action=rejectProgram&progID=<c:out value="${program.progID}"/>&admID=<c:out value="<%=id%>"/>"><b>Gagal</b></a></p> --%>
</body>
</html>