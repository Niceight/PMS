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
<title>Senarai Program</title>
</head>
<body>
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

<br/><h1>Pengesahan program</h1> 

<!-- START OF TABLE -->
	
<table border="1">
      <tr>
          <th>Nama Program</th>
      </tr>
  <c:forEach items="${programs}" var="program">
       <tr>
           <td><a href="StatusController?action=validateProgram&progID=<c:out value="${program.progID}" />"><c:out value="${program.progName}" /></a></td>
       </tr>
    </c:forEach>
</table>

<!-- END OF TABLE -->

</body>
</html>