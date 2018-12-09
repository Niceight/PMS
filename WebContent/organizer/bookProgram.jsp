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
	<link rel="stylesheet" href="/PMS/css/parsley.css" />
	<link rel="stylesheet" href="/PMS/css/bulma-divider.min.css" />
	<link rel="stylesheet" href="/PMS/css/jquery-ui.css">
</head>
<body >
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
				<a class="navbar-item is-active" href="/PMS/ProgramController?action=insert">Daftar Program</a>
				<a class="navbar-item" href="/PMS/ProgramController?action=myProgram&orgID=<c:out value="<%=id%>"/>">MyProgram</a>
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
			                        <li><a class="is-active has-text-white" href="/PMS/ProgramController?action=insert">Daftar Program</a></li>
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
		                                Program Lulus 
		                            </h1>
		                            <h3 class="subtitle">Sila pilih tarikh selain tarikh program yang sudah diluluskan dibawah</h3>
		                            <table class="table is-fullwidth" >
		                            	<thead>
		                            		<tr>
		                            			<th>Bil.</th>
		                            			<th>Nama Program</th>
		                            			<th>Tarikh Mula Program</th>
		                            			<th>Tarikh Akhir Program</th>
		                            		</tr>
		                            	</thead>
		                            	<tbody>
		                            		 <c:forEach items="${programsLulus}" var="program" varStatus="theCount">
										  		<tr>
										  			<th><c:out value="${theCount.count}" /></th>
										  			<td><c:out value="${program.progName}" /></td>
										  			<td><c:out value="${program.progStartDate}" /></td>
										  			<td><c:out value="${program.progEndDate}" /></td>
										  		</tr>
									    	</c:forEach>
		                            	</tbody>
		                            </table>
		                            <div class="is-divider" data-content="TAMAT"></div>
		                            
									<h1 class="title has-text-dark">
		                                Daftar Program 
		                            </h1>
		                            <h3 class="subtitle">Masukkan semua butiran 👇</h3>
									<form name="form" method="post" action="ProgramController" data-parsley-validate>
			                            <div class="field">
			                        		<label class="label">Nama Program</label>
			                                <div class="control">
			                                     <input class="input is-medium is-rounded" type="text" name="progName" value="" placeholder="Masukkan Nama Program" 
			                                     autofocus data-parsley-required data-parsley-required-message="Ruang ini wajib diisi" 
                                    			 data-parsley-length="[5, 50]" data-parsley-length-message="Nama porgram anda perlu melebihi 5 huruf dan tidak melebihi 50 huruf">
			                                </div>
			                            </div>
			                            
			                            <div class="field">
			                        		<label class="label">Jenis Program</label>
			                                <div class="control">
			                                    <label class="radio">
			                                    	<input type="radio" name="progType" value="Umum" onclick="programType(0)" 
			                                    	data-parsley-required data-parsley-required-message="Ruang ini wajib dipilih"> Umum
			                                    </label>
			                                    <label class="radio">
			                                    	<input type="radio" name="progType" value="Tertutup" onclick="programType(1)"> Tertutup
			                                    </label>
			                                </div>
			                            </div>
			                            
			                            <div class="field">
			                        		<label class="label">Tarikh Mula Program</label>
			                                <div class="control">
			                                    <input id="date" class="input is-medium is-rounded" type="text" name="progStartDate" value="" placeholder="Pilih Tarikh Program Bermula" 
			                                    data-parsley-required data-parsley-required-message="Ruang ini wajib diisi">
			                                </div>
			                            </div>
			                            
			                            <div class="field">
			                        		 <label class="label">Tarikh Tamat Program</label>
			                                <div class="control">
			                                    <input id="date2" class="input is-medium is-rounded" type="text" name="progEndDate" value="" placeholder="Pilih Tarikh Program Berakhir" 
			                                    data-parsley-required data-parsley-required-message="Ruang ini wajib diisi">
			                                </div>
			                            </div>
			                            
			                            <div class="field">
			                        		<label class="label">Masa Mula Program</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="time" name="progStartTime" value="" placeholder="Pilih Masa Program Bermula" 
			                                    data-parsley-required data-parsley-required-message="Ruang ini wajib diisi">
			                                </div>
			                            </div>
			                            
			                            <div class="field">
			                        		<label class="label">Masa Tamat Program</label>
			                                <div class="control">
			                                    <input class="input is-medium is-rounded" type="time" name="progEndTime" value="" placeholder="Pilih Masa Program Berakhir" 
			                                    data-parsley-required data-parsley-required-message="Ruang ini wajib diisi">
			                                </div>
			                            </div>
			                            
			                            <div class="field">
			                        		<label class="label">Tempat Program</label>
			                        		<div class="control">
			                        			<div class="select is-medium is-rounded is-fullwidth">
				                                    <select name="venueID" data-parsley-required data-parsley-required-message="Ruang ini wajib dipilih">
													    <option value="">Pilih Tempat</option>
													    <c:forEach items="${venues}" var="venue">
															    <option id="<c:out value="${venue.venueID}" />" value="<c:out value="${venue.venueID}" />"><c:out value="${venue.venueName}" /></option>		  	
														</c:forEach>
												  	</select>
				                                </div>
			                        		</div>
			                            </div>
			                            <h1 class="title"></h1>
			                            <div class="content" id="num" style="display:none">
			                            	<div class="field">
				                        		<label class="label">Jumlah Peserta</label>
				                                <div class="control">
				                                    <input class="input is-medium is-rounded" type="text" name="numParticipant" value="" placeholder="Masukkan Jumlah Peserta Hadiri"
				                                    	data-parsley-type="digits" data-parsley-type-message="Ruang ini perlu diisi digit sahaja">
				                                </div>
				                            </div>
										</div>
										
										<div class="content" id="vip" style="display:none">
											<div class="field">
				                        		<label class="label">Nama VIP</label>
				                                <div class="control">
				                                    <input class="input is-medium is-rounded" type="text" name="vipName" value="" placeholder="Masukkan Nama VIP"
                                    			 	data-parsley-length="[3, 50]" data-parsley-length-message="Nama VIP anda perlu melebihi 3 huruf dan tidak melebihi 50 huruf">
				                                </div>
				                            </div>
										</div>
										
										<div class="field">
			                                <div class="control">
			                                    <input type="hidden" name="orgID" value="<c:out value="<%=id%>"/>"/>
			                                </div>
			                            </div>
			                        
			                           	<div class="buttons">
			                           		<input class="button is-medium is-info is-rounded is-fullwidth" type="submit" value="Daftar"> 
			                           		<input class="button is-medium is-danger is-rounded is-fullwidth" type="reset" value="Semula"> 
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
	<script src="js/jquery-1.12.4.js"></script>
  	<script src="js/jquery-ui.js"></script>
	<script type="text/javascript">
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
	var arr = [], arr2 =[];
	<c:forEach var="program" items="${programsLulus}">
		arr.push("<c:out value="${program.progStartDate}"></c:out>");
		arr2.push("<c:out value="${program.progEndDate}"></c:out>");
	</c:forEach>

	$('#date').datepicker({
	    beforeShowDay: function(date){
	        var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
	        return [ arr.indexOf(string) == -1 ]
	    }
	});
	$('#date2').datepicker({
	    beforeShowDay: function(date){
	        var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
	        return [ arr2.indexOf(string) == -1 ]
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