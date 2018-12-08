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
<body onload="prevProgram(x,y)">
<%	String email = (String)session.getAttribute("currentSessionOrganizerEmail");
	String name = (String)session.getAttribute("currentSessionOrganizerName");
	String id = (String)session.getAttribute("currentSessionOrganizerID");
%>
	<nav class="navbar is-primary" role="navigation" aria-label="main navigation">
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
									<form name="form2" method="post"  action="ProgramController">
			                            <div class="field">
			                        		<label class="label">Nama Program</label>
			                                <div class="control">
			                                     <input class="input is-medium is-rounded" type="text" name="progName" value="<c:out value="${program.progName}" />"  required>
			                                </div>
			                            </div>
			                            
			                            <div class="field">
			                        		<label class="label">Jenis Program</label>
			                                <div class="control">
			                                    <label class="radio">
			                                    	<input type="radio" name="progType" id="umum" value="Umum" onclick="programType(0)" required> Umum
			                                    </label>
			                                    <label class="radio">
			                                    	<input type="radio" name="progType" id="tertutup" value="Tertutup" onclick="programType(1)" required> Tertutup
			                                    </label>
			                                </div>
			                            </div>
			                            
			                            <div class="field">
			                        		<label class="label">Tarikh Mula Program</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="date" name="progStartDate" value="<c:out value="${program.progStartDate}" />" required>
			                                </div>
			                            </div>
			                            
			                            <div class="field">
			                        		 <label class="label">Tarikh Tamat Program</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="date" name="progEndDate" value="<c:out value="${program.progEndDate}" />"  required>
			                                </div>
			                            </div>
			                            
			                            <div class="field">
			                        		<label class="label">Masa Mula Program</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="time" name="progStartTime" value="<c:out value="${program.progStartTime}" />"  required>
			                                </div>
			                            </div>
			                            
			                            <div class="field">
			                        		<label class="label">Masa Tamat Program</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="time" name="progEndTime" value="<c:out value="${program.progEndTime}" />" required>
			                                </div>
			                            </div>
			                            
			                            <div class="field">
			                        		<label class="label">Tempat Program</label>
			                        		<div class="control">
			                        			<div class="select is-medium is-rounded is-fullwidth">
				                                    <select name="venueID" required>
													    <option value="0">Pilih Tempat</option>
													    <c:forEach items="${venues}" var="venue">
															    <option id="<c:out value="${venue.venueID}" />" value="<c:out value="${venue.venueID}" />"><c:out value="${venue.venueName}" /></option>		  	
														</c:forEach>
												  	</select>
				                                </div>
			                        		</div>
			                            </div>
			                            
			                            <div class="content" id="num" style="display:none">
			                            	<div class="field">
				                        		<label class="label">Jumlah Peserta</label>
				                                <div class="control">
				                                    <input class="input is-medium is-rounded" type="text" name="numParticipant" value="<c:out value="${closedProgram.numParticipant}" />"  >
				                                </div>
				                            </div>
										</div>
										
										<div class="content" id="vip" style="display:none">
											<div class="field">
				                        		<label class="label">Nama VIP</label>
				                                <div class="control">
				                                    <input class="input is-medium is-rounded" type="text" name="vipName" value="<c:out value="${openProgram.vipName}" />" >
				                                </div>
				                            </div>
										</div>
										
										<div class="field">
			                                <div class="control">
			                                    <input type="hidden" name="orgID" value="<c:out value="<%=id%>"/>"/>
			                                </div>
			                            </div>
			                            <div class="field">
			                                <div class="control">
			                                    <input type="hidden" name="progID" value="<c:out value="${program.progID}" />"/>
			                                </div>
			                            </div>

			                           	<div class="buttons">
			                           		<input class="button is-medium is-info is-rounded is-fullwidth" type="submit" value="Simpan"> 
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
	var x = new String('${program.progType}');
	var y = new String('${program.venueID}');
	function prevProgram(x,y) {
		if(x == "Umum") {
			document.getElementById("umum").checked = true;
			document.getElementById('vip').style.display='block';
		}
		else {
			document.getElementById("tertutup").checked = true;
			document.getElementById('num').style.display='block';
		}
		document.getElementById(y).selected = true;
	}
	function programType(x) {
		if(x==0) {
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
</body>
</html>