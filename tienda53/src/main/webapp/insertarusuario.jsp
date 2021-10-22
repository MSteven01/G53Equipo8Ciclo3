<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Insertar Usuario</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link href="cinsertar.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<header>
		<div w3-include-html="/../snippets/sidenav.html"></div>
	</header>

	<div class="card-login">
		<h1>Agregar Usuarios</h1>

		<div id="error" class="alert alert-danger visually-hidden"
			role="alert">Error al crear el usuario</div>
		<div id="correcto" class="alert alert-success visually-hidden"
			role="alert">Usuario creado con exito</div>
		<form action="form1">
			<span class="input-group-text btn-card"
				id="inputGroup-sizing-default">Cedula</span> <input type="text"
				class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" id="cedula_usuario"
				required> <span class="input-group-text btn-card"
				id="inputGroup-sizing-default">E-mail</span> <input type="text"
				class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" id="email_usuario"
				required> <span class="input-group-text btn-card"
				id="inputGroup-sizing-default">Nombre completo</span> <input
				type="text" class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" required
				id="nombre_usuario"> <span class="input-group-text btn-card"
				id="inputGroup-sizing-default">User Name</span> <input type="text"
				class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" required id="user">
			<span class="input-group-text btn-card"
				id="inputGroup-sizing-default">Contraseña</span> <input
				type="password" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" required id="password">
		</form>
		<button type="button" class="btn btn-primary btn-card-enviar"
			onclick="enviar()">
			<i class="fas fa-check"></i> Insertar nuevo usuario
		</button>
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

	<script>
		function enviar() {
						
			var x = document.getElementById("user").value;
			var y = document.getElementById("cedula_usuario").value;
			var getUrl = window.location;
			var baseUrl = getUrl.protocol + "//" + getUrl.host + "/"+ getUrl.pathname.split('/')[1];
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open("GET", baseUrl + "/listarusuarios", false);
			req.send(null);
			var usuarios = null;
			if (req.status == 200)
				usuarios = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < usuarios.length; i++) {
				console.log(usuarios[i].usuario);
				console.log(usuarios[i].cedula_usuario);
				if (usuarios[i].usuario == x) {
					console.log(usuarios[i].usuario + " " + x);
					coincidencia = true
					break;
				}

				if (usuarios[i].cedula_usuario == y) {
					console.log(usuarios[i].cedula_usuario + " " + y);
					coincidencia = true
					break;
				}
			}
			console.log(coincidencia);

			if (coincidencia == false) {
				var formData = new FormData();
				formData.append("cedula_usuario", document
						.getElementById("cedula_usuario").value);
				formData.append("email_usuario", document
						.getElementById("email_usuario").value);
				formData.append("nombre_usuario", document
						.getElementById("nombre_usuario").value);
				formData.append("password",
						document.getElementById("password").value);
				formData.append("usuario",
						document.getElementById("user").value);
			
				var xhr = new XMLHttpRequest();
				xhr.open("POST", baseUrl + "/registrarusuario",);

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("cedula_usuario").value = "";
				document.getElementById("email_usuario").value = "";
				document.getElementById("nombre_usuario").value = "";
				document.getElementById("password").value = "";
				document.getElementById("user").value = "";
				xhr.send(formData);

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("cedula_usuario").value = "";
				document.getElementById("email_usuario").value = "";
				document.getElementById("nombre_usuario").value = "";
				document.getElementById("password").value = "";
				document.getElementById("user").value = "";
			}
		}
	</script>


</body>
</html>