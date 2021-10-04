<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width">
	<title>Lista Proveedores</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	 crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	 crossorigin="anonymous">
	<link href="clistusuarios.css" rel="stylesheet" type="text/css" />

  <script>
	var baseurl = "http://localhost:8080/listarproveedores";
	function loadproveedores() {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseurl, true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var proveedores = JSON.parse(xmlhttp.responseText);
				var tbltop = "<table class='table table-dark table-striped'><tr><th>Nit</th><th>Nombre proveedor</th><th>Direccion</th><th>Telefono</th><th>Ciudad</th></tr>";
				var main = "";
				for (i = 0; i < proveedores.length; i++) {
					main += "<tr><td>" + proveedores[i].nit_proveedor
							+ "</td><td>" + proveedores[i].nombre_proveedor
							+ "</td><td>" + proveedores[i].direccion_proveedor
							+ "</td><td>" + proveedores[i].telefono_proveedor + "</td><td>"
							+ proveedores[i].ciudad_proveedor + "</td></tr>";
				}
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				document.getElementById("proveedoresinfo").innerHTML = tbl;
			}
		};
		xmlhttp.send();
	}
	window.onload = function() {
		loadproveedores();
	}
</script>

</head>

<body>

<header>
		<nav class="navbar navbar-dark bg-dark navbar-expand-lg border-nav">
			<div class="container-fluid div-navbar">
				<a class="navbar-brand" href="#"> <i
					class="fas fa-store icon-nav"></i> Market SuDespensa.com
				</a>
			</div>
		</nav>
		<nav class="navbar navbar-dark bg-dark navbar-expand-lg">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse container-fluid div-navbar"
					id="navbarNavAltMarkup">
					<div class="navbar-nav">
						<a class="navbar-brand" href="listausuarios.jsp"><i
							class="fas fa-users icon-nav"></i>Usuarios</a> <a
							class="navbar-brand" href="listaclientes.jsp"><i
							class="far fa-address-card icon-nav"></i>Clientes</a> <a
							class="navbar-brand" href="listaproveedores.jsp"><i
							class="fas fa-truck icon-nav"></i>Proveedores</a> <a
							class="navbar-brand" href="insertarproducto.jsp"><i
							class="fas fa-box-open icon-nav"></i>Productos</a> <a
							class="navbar-brand" href="#"><i
							class="fas fa-file-invoice-dollar icon-nav"></i>Ventas</a> <a
							class="navbar-brand" href="#"><i
							class="fas fa-clipboard-list icon-nav"></i>Reportes</a>
					</div>
				</div>
			</div>
		</nav>
	</header>
	
	<div class="card-table">
		<h1 class="title-table">Tabla de proveedores</h1>
			<div class="container">
				<div class="row">
					<!--  Aqui es donde se autogenera la tabla basado en el script -->
					<div class="col align-self-center" id="proveedoresinfo"> 	
					</div>
				</div>
			</div>
	</div>

<div class="card-buttons">
          <button type="button" class="btn btn-success btn-card" onclick="window.location.href='/insertarproveedor.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar proveedor</button>
					<button type="button" class="btn btn-danger btn-card" onclick="window.location.href='/eliminarproveedor.jsp'">
					<i class="fas fa-trash"></i> Eliminar proveedor</button>
					<button type="button" class="btn btn-warning btn-card" onclick="window.location.href='/actualizarproveedor.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar proveedor</button>
					<button type="button" class="btn btn-primary btn-card"  onclick="window.location.href='/buscarproveedor.jsp'">
					<i class="fas fa-search"></i> Buscar un proveedor</button>
					<button type="button" class="btn btn-info btn-card" onclick="window.location.href='/listaproveedores.jsp'">
					<i class="fas fa-clipboard-list"></i> Listar todos los proveedores</button>
</div>

</body>
</html>