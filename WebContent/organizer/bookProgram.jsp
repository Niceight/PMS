<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Daftar Program</title>
</head>
<body >
<%	String email = (String)session.getAttribute("currentSessionOrganizerEmail");
	String name = (String)session.getAttribute("currentSessionOrganizerName");
	String id = (String)session.getAttribute("currentSessionOrganizerID");
%>
<header>
	<ul>
	   <li><a href="/PMS/organizer/index.jsp">Anjung</a></li>
	   <li><a href="/PMS/ProgramController?action=insert">Daftar Program</a></li>
	   <li><a href="/PMS/ProgramController?action=myProgram&orgID=<c:out value="<%=id%>"/>">MyProgram</a></li> 
	   <li class='active'><a href="/PMS/OrganizerController?action=viewAccount&orgEmail=<c:out value="<%=email%>"/>">Profil</a></li>
	   <li><a href="/PMS/organizer/logout.jsp">Log Keluar</a></li>
	</ul>
</header>

<br/><h1>Daftar Program</h1> 
<script>
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
</script>
<form method="post" action="ProgramController">

	<label>Nama Program:</label><br>
	<input type="text" name="progName" value="" placeholder="Masukkan Nama Program" required> <br>
	
	<label>Jenis Program:</label><br>
	<input type="radio" name="progType" value="Umum" onclick="programType(0)" required> Umum <br>
	<input type="radio" name="progType" value="Tertutup" onclick="programType(1)" required> Tertutup <br>
	
	<label>Tarikh Mula Program:</label><br>
	<input type="date" name="progStartDate" value="" placeholder="Pilih Tarikh Program Bermula" required> <br>
	
	<label>Tarikh Tamat Program:</label><br>
	<input type="date" name="progEndDate" value="" placeholder="Pilih Tarikh Program Berakhir" required> <br>
	
	<label>Masa Mula Program: (HH:MM:SS)</label><br>
	<input type="time" name="progStartTime" value="" placeholder="Pilih Masa Program Bermula" required> <br>
	
	<label>Masa Tamat Program: (HH:MM:SS)</label><br>
	<input type="time" name="progEndTime" value="" placeholder="Pilih Masa Program Berakhir" required> <br>
	
	<label>Tempat Program</label><br> 
	<select name="venueID" required>
	    <option value="0">Pilih Tempat</option>
	    <option value="1">Dalam Masjid</option>
	    <option value="2">Luar Masjid</option>
	    <option value="3">Bilik Mesyuarat</option>
  	</select>
  	<br>
	
	<div id="vip" style="display:none">
		<label>Nama VIP:</label><br>
		<input type="text" name="vipName" value="" placeholder="Masukkan Nama VIP" > <br>
	</div>
	
	<div id="num" style="display:none">
		<label>Jumlah Peserta:</label><br> 
		<input type="text" name="numParticipant" value="" placeholder="Masukkan Jumlah Peserta Hadiri" > <br>
	</div>
	
	<input type="hidden" name="orgID" value="<c:out value="<%=id%>"/>"/> 
	
	<br> <br>
	<br> <input type="submit" value="Daftar"> <input type="reset" value="Semula">       

</form>
</body>
</html>