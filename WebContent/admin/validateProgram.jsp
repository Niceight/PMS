<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<meta charset="ISO-8859-1">
<title>Pengesahan Program</title>
</head>
<body onload="programType(x)">
<%	String email = (String)session.getAttribute("currentSessionAdminEmail");
	String name = (String)session.getAttribute("currentSessionAdminName");
	String id = (String)session.getAttribute("currentSessionAdminID");
%>
<header>
	<ul>
	   <li><a href="/PMS/admin/index.jsp">Anjung</a></li>
	   <%-- <li><a href="/PMS/ProgramController?action=insert">Daftar Program</a></li>
	   <li><a href="/PMS/ProgramController?action=myProgram&admID=<c:out value="<%=id%>"/>">MyProgram</a></li>  --%>
	   <li class='active'><a href="/PMS/StatusController?action=listProgram">Pengesahan Program</a></li>
	   <li><a href="/PMS/AdminController?action=viewAccount&admEmail=<c:out value="<%=email%>"/>">Profil</a></li>
	   <li><a href="/PMS/admin/logout.jsp">Log Keluar</a></li>
	</ul>
</header>
<script>
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
</script>
<br/><h1>Pengesahan Program : </h1> 
<br/><br/>

<p>Program ID : <c:out value="${program.progID}" /></p>
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
 <p><a href="StatusController?action=rejectProgram&progID=<c:out value="${program.progID}"/>&admID=<c:out value="<%=id%>"/>"><b>Gagal</b></a></p>
</body>
</html>