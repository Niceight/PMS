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
<title>Paparan Profil</title>
</head>
<body>

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

<p>Profil <b><c:out value="<%=name%>" /></b></p>
<br/><h1>Profil</h1> 
<br/><br/>

<!-- START DISPLAY ACCOUNT -->
<p><b>Nama:</b> <c:out value="${organizer.getOrgName()}" /></p>
<p><b>E-mel:</b> <c:out value="<%=email%>" /></p>
<p><b>Kad Pengenalan:</b> <c:out value="${organizer.orgIC}" /></p>
<p><b>Telefon 1:</b> <c:out value="${organizer.orgPhone1}" /></p>
<p><b>Telefon 2:</b> <c:out value="${organizer.orgPhone2}" /></p>
<p><b>Jenis Organisasi:</b> <c:out value="${organizer.typeOrganization}" /></p>
<p><b>Nama Organisasi:</b> <c:out value="${organizer.organization}" /></p>

   <br/><br/>
   <p><a href="OrganizerController?action=updateAccount&orgEmail=<c:out value="<%=email%>" />"><b>Pinda Profil</b></a></p>
</body>
</html>