<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Actualizar Cliente</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link href="/../css/cssreportes.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<header>
		<div w3-include-html="/../snippets/sidenav.html"></div>
	</header>




	<div class="card-login">
		<div class="row">
			<h1>Ventas</h1>
			<div class="box-cliente col-xl-4 col-lg-4 col-md-12 col-sm-12">
				<button type="button" class="btn btn-success btn-card-enviar2 form"
					onclick="loadusuarios()">
					<i class="far fa-user"></i> Cargar Usuarios
				</button>
			</div>
			<div class="box-cliente col-xl-4 col-lg-4 col-md-12 col-sm-12">
				<button type="button" class="btn btn-success btn-card-enviar2 form"
					onclick="loadclientes()">
					<i class="far fa-address-card"></i> Cargar Clientes
				</button>
			</div>

			<div class="box-cliente col-xl-4 col-lg-4 col-md-12 col-sm-12">
				<button type="button" class="btn btn-success btn-card-enviar2 form"
					onclick="loadreportes()">
					<i class="fas fa-search"></i> Cargar Ventas
				</button>
			</div>

		</div>

		<div class="card-table visually-hidden" id="tablausuario">
			<h1 class="title-table">Tabla de usuarios</h1>
			<div class="container">
				<div class="row">
					<!--  Aqui es donde se autogenera la tabla basado en el script -->
					<div class="col align-self-center" id="usuariosinfo"></div>
				</div>
			</div>
		</div>

		<div class="card-table visually-hidden" id="tablacliente">
			<h1 class="title-table">Tabla de clientes</h1>
			<div class="container">
				<div class="row">
					<!--  Aqui es donde se autogenera la tabla basado en el script -->
					<div class="col align-self-center" id="clienteinfo"></div>
				</div>
			</div>
		</div>

		<div class="card-table visually-hidden" id="tablareportes">
			<h1 class="title-table">Tabla de reportes</h1>
			<div class="container">
				<div class="row">
					<!--  Aqui es donde se autogenera la tabla basado en el script -->
					<div
						class="col align-self-center col-xl-12 col-lg-12 col-md-12 col-sm-12"
						id="reportesinfo"></div>

					<div class="row ">
						<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12">
							<div class="input-group input-group-sm mb-3">
								<span class="input-group-text p-insertar" id="basic-addon1">Valor total $:</span>
								<input type="text" class="form-control" readonly="readonly"
									id="total_venta">
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





	<script src="js/scripts.js"></script>

	<script>
		includeHTML();
	</script>


	<script>
		function loadusuarios() {
			var element = document.getElementById("tablacliente");
			element.classList.add("visually-hidden");
			var element2 = document.getElementById("tablausuario");
			element2.classList.remove("visually-hidden");
			var element3 = document.getElementById("tablareportes");
			element3.classList.add("visually-hidden");
			var baseurl = "http://localhost:8080/listarusuarios";
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", baseurl, true);
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
					var usuarios = JSON.parse(xmlhttp.responseText);
					var tbltop = "<table class='table table-dark table-striped'><tr><th>Cedula</th><th>Email</th><th>Nombre</th><th>Password</th><th>Usuario</th></tr>";
					var main = "";
					for (i = 0; i < usuarios.length; i++) {
						main += "<tr><td>" + usuarios[i].cedula_usuario
								+ "</td><td>" + usuarios[i].email_usuario
								+ "</td><td>" + usuarios[i].nombre_usuario
								+ "</td><td>" + usuarios[i].password
								+ "</td><td>" + usuarios[i].usuario
								+ "</td></tr>";
					}
					var tblbottom = "</table>";
					var tbl = tbltop + main + tblbottom;
					document.getElementById("usuariosinfo").innerHTML = tbl;
				}
			};
			xmlhttp.send();
		}

		function loadclientes() {
			var element = document.getElementById("tablausuario");
			element.classList.add("visually-hidden");
			var element3 = document.getElementById("tablareportes");
			element3.classList.add("visually-hidden");
			var element2 = document.getElementById("tablacliente");
			element2.classList.remove("visually-hidden");
			var baseurl = "http://localhost:8080/listarclientes";
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

		function loadreportes() {
			var element = document.getElementById("tablausuario");
			element.classList.add("visually-hidden");
			var element2 = document.getElementById("tablacliente");
			element2.classList.add("visually-hidden");
			var element3 = document.getElementById("tablareportes");
			element3.classList.remove("visually-hidden");
			var baseurl = "http://localhost:8080/listarreportes";
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", baseurl, true);
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
					var reportes = JSON.parse(xmlhttp.responseText);
					var tbltop = "<table class='table table-dark table-striped'><tr><th>Cedula</th><th>Nombre Cliente</th><th>Valor venta</th></tr>";
					var main = "";
					for (i = 0; i < reportes.length; i++) {
						main += "<tr><td>" + reportes[i].cedula_cliente
								+ "</td><td>" + reportes[i].nombre_cliente
								+ "</td><td>" + reportes[i].valor_venta
								+ "</td></tr>"
					}
					var tblbottom = "</table>";
					var tbl = tbltop + main + tblbottom;
					document.getElementById("total_venta").value = reportes[1].valor_total_venta;
					document.getElementById("reportesinfo").innerHTML = tbl;
	

				}
			};
			xmlhttp.send();

		}
	</script>
</body>
</html>