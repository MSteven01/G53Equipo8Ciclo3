<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width">
	<title>Actualizar Usuario</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	 crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	 crossorigin="anonymous">
	<link href="cinsertar.css" rel="stylesheet" type="text/css" />
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
		</nav>
	</header>





				
				
				
<div class="card-login">
<h1>Actualizar Usuarios</h1>

<div id="error1" class="alert alert-danger visually-hidden" role="alert">Error al buscar el usuario, el usuario no existe</div>
<div id="error" class="alert alert-danger visually-hidden" role="alert">Error al actualizar el usuario, el usuario no existe</div>
<div id="correcto" class="alert alert-success visually-hidden" role="alert">Usuario actualizado con exito</div>

 <form action="form1">
 
 <span class="input-group-text btn-card" id="basic-addon4">Ingrese usuario a buscar.</span> 
 <input	type="text" class="form-control" aria-describedby="basic-addon4" required id="usersearch" >
 
  <button type="button" class="btn btn-success btn-card-enviar form" onclick="enviar()">
<i class="fas fa-search"></i> Buscar Usuario
</button>
 
  <span class="input-group-text btn-card" id="inputGroup-sizing-default">Cedula</span>
  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  id="cedula_usuario" required disabled="disabled">
   <span class="input-group-text btn-card" id="inputGroup-sizing-default">E-mail</span>
  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  id="email_usuario" required >
   <span class="input-group-text btn-card" id="inputGroup-sizing-default">Nombre completo</span>
  <input type="text" class="form-control"aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required id="nombre_usuario">
   <span class="input-group-text btn-card" id="inputGroup-sizing-default">User Name</span>
  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required id="user" required disabled="disabled">
   <span class="input-group-text btn-card" id="inputGroup-sizing-default">Contraseña</span>
  <input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required id="password" >
</form>
 <button type="button" class="btn btn-primary btn-card-enviar" onclick="actualizar()">
<i class="fas fa-search"></i> Actualizar Usuario
</button>
</div>
				
				



<div class="card-buttons">

          <button type="button" class="btn btn-success btn-card-footer" onclick="window.location.href='/insertarusuario.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar usuario</button>
					<button type="button" class="btn btn-danger btn-card-footer" onclick="window.location.href='/eliminarusuario.jsp'">
					<i class="fas fa-trash"></i> Eliminar usuario</button>
					<button type="button" class="btn btn-warning btn-card-footer" onclick="window.location.href='/actualizarusuario.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar usuario</button>
					<button type="button" class="btn btn-primary btn-card-footer" onclick="window.location.href='/buscarusuario.jsp'">
					<i class="fas fa-search"></i> Buscar un usuario</button>
					<button type="button" class="btn btn-info btn-card-footer" onclick="window.location.href='/listausuarios.jsp'">
					<i class="fas fa-clipboard-list" ></i> Listar todos los usuarios</button>
</div>

	
	
	<script>
		function enviar() {
				
				var req = new XMLHttpRequest();
				var coincidencia = false;
				var user=   document.getElementById("usersearch").value;
				req.open('GET', 'http://localhost:8080/consultarusuario?usuario='+user, false);
				req.send(null);
				var usuario = null;
				if (req.status == 200)
					usuario = JSON.parse(req.responseText);
				console.log(JSON.parse(req.responseText));
				
			
				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				//var element2 = document.getElementById("correcto");
				//element2.classList.remove("visually-hidden");
				
				console.log(usuario.toString());
				
			if (usuario.toString()!=""){
				document.getElementById("cedula_usuario").value = usuario[0].cedula_usuario;
				document.getElementById("email_usuario").value = usuario[0].email_usuario;
				document.getElementById("nombre_usuario").value = usuario[0].nombre_usuario;
				document.getElementById("password").value = usuario[0].password;
				document.getElementById("user").value = usuario[0].usuario;
				
				document.getElementById("usersearch").value = "";
			
			} else {
				var element = document.getElementById("error1");
				element.classList.remove("visually-hidden");
				//var element2 = document.getElementById("correcto");
				//element2.classList.add("visually-hidden");
				document.getElementById("cedula_usuario").value = "";
				document.getElementById("email_usuario").value = "";
				document.getElementById("nombre_usuario").value = "";
				document.getElementById("password").value = "";
				document.getElementById("user").value = "";
			}
		}
		
		function actualizar() {
			var y = document.getElementById("cedula_usuario").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/listarusuarios', false);
			req.send(null);
			var usuario = null;
			if (req.status == 200)
				usuario = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < usuario.length; i++) {
				console.log(usuario[i].cedula_usuario);

				if (usuario[i].cedula_usuario == y) {
					console.log(usuario[i].cedula_usuario + " " + y);
					coincidencia = true
					break;
				}
			}
			console.log(coincidencia);

			if (coincidencia != false) {
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
				xhr.open("PUT", "http://localhost:8080/actualizarusuarios");

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