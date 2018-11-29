<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Daftar Pengguna</title>
</head>

<body>
	<ul>
		<li><a href="/PMS/index.jsp">Anjung</a></li>
		<li><a class="active" href="/PMS/register.jsp">Daftar Pengguna</a></li>
		<li><a href="/PMS/login.jsp">Log Masuk Pengguna</a></li>
		<li><a href="/PMS/loginAdmin.jsp">Log Masuk Pentadbir</a></li>
	</ul>
	<h2>Daftar Pengguna</h2>
	<form method="post" action="OrganizerController">
		<label>Nama:</label><br>
		<input type="text" name="orgName" value="" placeholder="Masukkan Nama" required> <br>
		<label>E-Mel:</label><br>
		<input type="email" name="orgEmail" value="" placeholder="Masukkan E-Mel" required> <br>
		<label>Kad Pengenalan</label><br>
		<input type="text" name="orgIC" value="" placeholder="Masukkan Kad Pengenalan" required> <br>
		<label>Telefon 1:</label><br> 
		<input type="text" name="orgPhone1" value="" placeholder="Masukkan Telefon 1" required> <br>
		<label>Telefon 2:</label><br> 
		<input type="text" name="orgPhone2" value="" placeholder="Masukkan Telefon 2" required> <br>
		<label>Jenis Organisasi:</label><br>
		<input type="radio" name="typeOrganization" value="Kerajaan"> Kerajaan <br>
		<input type="radio" name="typeOrganization" value="Swasta"> Swasta <br>
		<input type="radio" name="typeOrganization" value="Institusi"> Institusi <br>
		<label>Nama Organisasi:</label><br>
		<input type="text" name="organization" value="" placeholder="Masukkan Nama Organisasi" required> <br>
		<label>Kata Laluan:</label><br> 
		<input type="password" name="orgPassword" value="" placeholder="Masukkan Kata Laluan" required>
		<br> <br>
		<br> <input type="submit" value="Daftar"> <input type="reset" value="Semula">
	</form>
</body>

</html>