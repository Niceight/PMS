<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Pinda Profil</title>
	<link rel="stylesheet" href="/PMS/css/bulma.min.css" />
</head>
<body onload="orgType(x)">
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
					<div class="column is-3 ">
						<div class="box">
							<aside class="menu is-mobile">
			                    <p class="menu-label">
			                        Umum
			                    </p>
			                    <ul class="menu-list">
			                        <li><a class="" href="/PMS/organizer/index.jsp">Laman Utama</a></li>
			                        <li><a>Profil</a>
				                        <ul>
				                        	<li><a class="" href="/PMS/OrganizerController?action=viewAccount&orgEmail=<c:out value="<%=email%>"/>">Profil Anda</a></li>
				                        	<li><a class="is-active has-text-white" href="/PMS/OrganizerController?action=updateAccount&orgEmail=<c:out value="<%=email%>" />">Pinda Profil</a></li>
				                        </ul>
			                        </li>
			                    </ul>
			                    <p class="menu-label">
			                        Program
			                    </p>
			                    <ul class="menu-list">
			                        <li><a class="" href="/PMS/ProgramController?action=insert">Daftar Program</a></li>
			                        <li><a class="" href="/PMS/ProgramController?action=myProgram&orgID=<c:out value="<%=id%>"/>">MyProgram</a>	</li>
			                    </ul>
			                </aside>
						</div>

					</div><!-- end column is-3 -->
					<div class="column is-7">
						 <section class="hero is-white">
		                    <div class="hero-body">
		                        <div class="container">
		                            <h1 class="title has-text-dark">
		                                Profil <%= name %>.
		                            </h1>
		                            
		                            <form method="post" action="OrganizerController">
			                        	<div class="field">
			                        		<label class="label">Nama</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="text" name="orgName" value="<c:out value="${organizer.orgName}" />" placeholder="Masukkan Nama" required>
			                                </div>
			                            </div>
			                            <div class="field">
			                            	<label class="label">E-mel</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="email" name="orgEmail" value="<c:out value="<%=email%>" />" placeholder="Masukkan E-Mel" readonly>
			                                </div>
			                            </div>
			                            <div class="field">
			                            	<label class="label">Kad Pengenalan</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="text" name="orgIC" value="<c:out value="${organizer.orgIC}"/>" placeholder="Masukkan Kad Pengenalan" required>
			                                </div>
			                            </div>
			                            <div class="field">
			                            	<label class="label">Telefon 1</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="tel" name="orgPhone1" value="<c:out value="${organizer.orgPhone1}" />" placeholder="Masukkan Telefon 1" required>
			                                </div>
			                            </div>
			                            <div class="field">
			                            	<label class="label">Telefon 2</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="tel" name="orgPhone2" value="<c:out value="${organizer.orgPhone2}" />" placeholder="Masukkan Telefon 2" required>
			                                </div>
			                            </div>
			                            <div class="field">
			                            	<label class="label">Jenis Organisasi</label>
			                                <div class="control">
			                                	<label class="radio">
			                                		<input id="1" type="radio" name="typeOrganization" value="Kerajaan"> Kerajaan
												</label>
												<label class="radio">
												    <input id="2" type="radio" name="typeOrganization" value="Swasta"> Swasta
												</label>
												<label class="radio">
												    <input id="3" type="radio" name="typeOrganization" value="Institusi"> Institusi 
												</label>
			                                </div>
			                            </div>
			                            <div class="field">
			                            	<label class="label">Nama Organisasi</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="text" name="organization" value="<c:out value="${organizer.organization}" />" placeholder="Masukkan Nama Organisasi" required>
			                                </div>
			                            </div>
			                            <div class="field">
			                            	<label class="label">Kata Laluan</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="password" name="orgPassword" placeholder="Masukkan Kata Laluan" required>
			                                </div>
			                            </div>
			                            <div class="buttons">
			                            	<input class="button is-info is-medium is-rounded" type="submit" value="Simpan">
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
	<script type="text/javascript">
	var x = new String('${organizer.typeOrganization}');
	function orgType(x) {
		if(x == "Kerajaan") {
			document.getElementById("1").checked = true;
		}
		else if(x == "Swasta") {
			document.getElementById("2").checked = true;
		}
		else {
			document.getElementById("3").checked = true;
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
</body>
</html>