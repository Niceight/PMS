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
<title>Pinda Profil</title>
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

<p>Pinda Profil <b><c:out value="<%=name%>" /></b></p>
<br/><h1>Profil</h1> 
<br/><br/>
<!-- START OF FORM -->
									
<form name="form1" method="post"  action="OrganizerController">

	<input type="text" name="orgName" value="<c:out value="${organizer.orgName}" />"/><br/>
	<input type="email" name="orgEmail"  value="<c:out value="<%=email%>" />" readonly/><br/>
	<input type="text" name="orgIC"  value="<c:out value="${organizer.orgIC}"/>" /><br/>
	<input type="text" name="orgPhone1"  value="<c:out value="${organizer.orgPhone1}" />"/><br/>
	<input type="text" name="orgPhone2"  value="<c:out value="${organizer.orgPhone2}" />"/><br/>
	<input type="text" name="typeOrganization"  value="<c:out value="${organizer.typeOrganization}" />" readonly/><br/>
	<input type="text" name="organization"  value="<c:out value="${organizer.organization}" />"/><br/>
	<input type="password" name="orgPassword" required="required" /><br/>
	
	<br/><input type="submit" value="Simpan">	       

</form>
</body>
</html>