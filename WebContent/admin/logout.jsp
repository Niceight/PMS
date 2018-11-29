<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	response.setHeader("Cache-Control","no-store,must-revalidate"); 
	response.setHeader("Pragma","no-cache"); 
	response.setDateHeader ("Expires", 0);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log Keluar</title>
</head>
<body>
<% 
	session.setAttribute("currentSessionAdminEmail", null);
	session.setAttribute("currentSessionAdminName", null);
	session.setAttribute("currentSessionAdminID", null);
	session.invalidate();
	response.sendRedirect("/PMS/loginAdmin.jsp");
%>
</body>
</html>