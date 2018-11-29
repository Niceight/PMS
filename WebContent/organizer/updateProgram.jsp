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
<title>Pinda Program</title>
</head>
<body onload="prevProgram(x,y)">
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

<p>Pinda Program <b><c:out value="${program.progName}" /></b></p>
<br/><h1>Program</h1> 
<br/><br/>
<!-- START OF FORM -->
<script>
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
		if(y == "1") {
			document.getElementById("1").selected = true;
		}
		else if(y == "2") {
			document.getElementById("2").selected = true;
		}
		else {
			document.getElementById("3").selected = true;
		}
		
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
</script>					
<form name="form2" method="post"  action="ProgramController">

	<label>Nama Program:</label><br>
	<input type="text" name="progName" value="<c:out value="${program.progName}" />"  required> <br>
	
	<label>Jenis Program:</label><br>
	<input type="radio" name="progType" id="umum" value="Umum" onclick="programType(0)" required> Umum <br>
	<input type="radio" name="progType" id="tertutup" value="Tertutup" onclick="programType(1)" required> Tertutup <br>
	
	<label>Tarikh Mula Program:</label><br>
	<input type="date" name="progStartDate" value="<c:out value="${program.progStartDate}" />" required> <br>
	
	<label>Tarikh Tamat Program:</label><br>
	<input type="date" name="progEndDate" value="<c:out value="${program.progEndDate}" />"  required> <br>
	
	<label>Masa Mula Program: (HH:MM:SS)</label><br>
	<input type="time" name="progStartTime" value="<c:out value="${program.progStartTime}" />"  required> <br>
	
	<label>Masa Tamat Program: (HH:MM:SS)</label><br>
	<input type="time" name="progEndTime" value="<c:out value="${program.progEndTime}" />" required> <br>
	
	<label>Tempat Program</label><br> 
	<select name="venueID" required>
	    <option value="0">Pilih Tempat</option>
	    <option id="1" value="1">Dalam Masjid</option>
	    <option id="2" value="2">Luar Masjid</option>
	    <option id="3" value="3">Bilik Mesyuarat</option>
  	</select>
  	<br>
	
	<div id="vip" style="display:none">
		<label>Nama VIP:</label><br>
		<input type="text" name="vipName" value="<c:out value="${openProgram.vipName}" />"  > <br>
	</div>
	
	<div id="num" style="display:none">
		<label>Jumlah Peserta:</label><br> 
		<input type="text" name="numParticipant" value="<c:out value="${closedProgram.numParticipant}" />"  > <br>
	</div>
	<input type="hidden" name="orgID" value="<c:out value="<%=id%>"/>"/> 
	<input type="hidden" name="progID" value="<c:out value="${program.progID}" />"/> 
	
	<br> <br>
	<br> <input type="submit" value="Simpan">  

</form>
</body>
</html>