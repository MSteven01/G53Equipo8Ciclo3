<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Lista Usuarios</title>
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
	//var baseurl = "http://localhost:8080/listarusuarios";
	function loadusuarios() {
		//var x = document.getElementById("inputuser").value;
		//var y = document.getElementById("inputpass").value;
		var getUrl = window.location;
		var baseUrl = getUrl.protocol + "//" + getUrl.host + "/"
				+ getUrl.pathname.split('/')[1];
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseUrl + "/listarusuarios", true);

		//var xmlhttp = new XMLHttpRequest();
		//xmlhttp.open("GET", baseurl, true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var usuarios = JSON.parse(xmlhttp.responseText);
				var tbltop = "<table class='table table-dark table-striped'><tr><th>Cedula</th><th>Email</th><th>Nombre</th><th>Password</th><th>Usuario</th></tr>";
				var main = "";
				for (i = 0; i < usuarios.length; i++) {
					main += "<tr><td>" + usuarios[i].cedula_usuario
							+ "</td><td>" + usuarios[i].email_usuario
							+ "</td><td>" + usuarios[i].nombre_usuario
							+ "</td><td>" + usuarios[i].password + "</td><td>"
							+ usuarios[i].usuario + "</td></tr>";
				}
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				document.getElementById("usuariosinfo").innerHTML = tbl;
			}
		};
		xmlhttp.send();
	}
	window.onload = function() {
		loadusuarios();
	}
</script>

</head>

<body>

	<header>
		<div w3-include-html="/../snippets/sidenav.html"></div>
	</header>


	<div class="card-table">
		<h1 class="title-table">Tabla de usuarios</h1>
		<div class="container">
			<div class="row">
				<!--  Aqui es donde se autogenera la tabla basado en el script -->
				<div class="col align-self-center" id="usuariosinfo"></div>
			</div>
		</div>
	</div>

	<div class="card-buttons">
		<div class="row">
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-success btn-card-footer"
					onclick="window.location.href='insertarusuario.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar usuario
				</button>
			</div>
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-danger btn-card-footer"
					onclick="window.location.href='eliminarusuario.jsp'">
					<i class="fas fa-trash"></i> Eliminar usuario
				</button>
			</div>
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-warning btn-card-footer"
					onclick="window.location.href='actualizarusuario.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar usuario
				</button>
			</div>
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-primary btn-card-footer"
					onclick="window.location.href='buscarusuario.jsp'">
					<i class="fas fa-search"></i> Buscar un usuario
				</button>
			</div>
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-info btn-card-footer"
					onclick="window.location.href='listausuarios.jsp'">
					<i class="fas fa-clipboard-list"></i> Listar todos los usuarios
				</button>
			</div>
		</div>
	</div>


	<script src="js/scripts.js"></script>

	<script>
		includeHTML();
	</script>
</body>
</html>