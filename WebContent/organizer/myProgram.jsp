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
<title>MyProgram</title>
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

<br/><h1>MyProgram</h1> 

<!-- START OF TABLE -->
	
<table border="1">
      <tr>
          <th>Nama Program</th>
      </tr>
  <c:forEach items="${programs}" var="program">
       <tr>
           <td><a href="ProgramController?action=viewProgram&progID=<c:out value="${program.progID}" />"><c:out value="${program.progName}" /></a></td>
       </tr>
    </c:forEach>
</table>

<!-- END OF TABLE -->

<p><a href="ProgramController?action=insert"><b>Daftar Program</b></a></p>
</body>
</html>