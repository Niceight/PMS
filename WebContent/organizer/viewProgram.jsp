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
<title>Paparan Program</title>
</head>
<body onload="programType(x,y)">
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
<script>
	var x = new String('${program.progType}');
	var y = new String('${statusProgram.status}');
	function programType(x,y) {
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
	}
</script>
<br/><h1>Paparan Program : </h1> 
<br/><br/>

<p>Program ID : <c:out value="${program.progID}" /></p>
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
<p>Status Program : <b><c:out value="${statusProgram.status}" /></b></p>


 <br/><br/>
 <div id="status" style="display:none">
 	 <p><a href="ProgramController?action=updateProgram&progID=<c:out value="${program.progID}"/>"><b>Pinda Program</b></a></p>
 	 <p><a href="ProgramController?action=deleteProgram&progID=<c:out value="${program.progID}"/>&orgID=<c:out value="<%=id%>"/>"><b>Batal Program</b></a></p>
 </div>
 
</body>
</html>