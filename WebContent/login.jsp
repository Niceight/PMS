<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Log Masuk</title>
</head>

<body>
	<ul>
		<li><a href="/PMS/index.jsp">Anjung</a></li>
		<li><a href="/PMS/register.jsp">Daftar Pengguna</a></li>
		<li><a class="active" href="/PMS/login.jsp">Log Masuk Pengguna</a></li>
		<li><a href="/PMS/loginAdmin.jsp">Log Masuk Pentadbir</a></li>
	</ul>
	<h2>Log Masuk Pengguna</h2>
	<form method="get" action="LoginController">
		<label>E-Mel:</label><br>
		<input type="email" name="orgEmail" value="" placeholder="Enter Email" required> <br>
		<label>Kata Laluan:</label><br> 
		<input type="password" name="orgPassword" value="" placeholder="Enter Password" required>
		<br> <br>
		<input type="hidden" name="userType" value="organizer" required>
		<br> <input type="submit" value="Log Masuk">
	</form>
</body>

</html>