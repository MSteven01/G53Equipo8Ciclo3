<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Lista Clientes</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link href="clistusuarios.css" rel="stylesheet" type="text/css" />

<script>
	var baseurl = "http://localhost:8080/listarclientes";
	function loadclientes() {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseurl, true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var clientes = JSON.parse(xmlhttp.responseText);
				var tbltop = "<table class='table table-dark table-striped'><tr><th>Cedula</th><th>Email</th><th>Nombre</th><th>Direccion</th><th>Telefono</th></tr>";
				var main = "";
				for (i = 0; i < clientes.length; i++) {
					main += "<tr><td>" + clientes[i].cedula_cliente
							+ "</td><td>" + clientes[i].email_cliente
							+ "</td><td>" + clientes[i].nombre_cliente
							+ "</td><td>" + clientes[i].telefono_cliente
							+ "</td><td>" + clientes[i].direccion_cliente
							+ "</td></tr>";
				}
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				document.getElementById("clienteinfo").innerHTML = tbl;
			}
		};
		xmlhttp.send();
	}
	window.onload = function() {
		loadclientes();
	}
</script>

</head>

<body>

	<header>

		<div w3-include-html="/../snippets/sidenav.html"></div>
	</header>


	<div class="card-table">
		<h1 class="title-table">Tabla de Clientes</h1>
		<div class="container">
			<div class="row">
				<!--  Aqui es donde se autogenera la tabla basado en el script -->
				<div class="col align-self-center" id="clienteinfo"></div>
			</div>
		</div>
	</div>

	<div class="card-buttons">
		<button type="button" class="btn btn-success btn-card"
			onclick="window.location.href='/insertarclientes.jsp'">
			<i class="fas fa-plus-circle"></i> Agregar cliente
		</button>
		<button type="button" class="btn btn-danger btn-card"
			onclick="window.location.href='/eliminarcliente.jsp'">
			<i class="fas fa-trash"></i> Eliminar cliente
		</button>
		<button type="button" class="btn btn-warning btn-card"
			onclick="window.location.href='/actualizarcliente.jsp'">
			<i class="fas fa-pen-alt"></i> Actualizar cliente
		</button>
		<button type="button" class="btn btn-primary btn-card"
			onclick="window.location.href='/buscarcliente.jsp'">
			<i class="fas fa-search"></i> Buscar un cliente
		</button>
		<button type="button" class="btn btn-info btn-card"
			onclick="window.location.href='/listaclientes.jsp'">
			<i class="fas fa-clipboard-list"></i> Listar todos los cliente
		</button>
	</div>
	
	<script src="js/scripts.js"></script>

	<script>
		includeHTML();
	</script>


</body>
</html>