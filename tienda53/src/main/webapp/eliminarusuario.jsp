<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width">
	<title>Primer login</title>
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
    <a class="navbar-brand" href="#">
    <i class="fas fa-store icon-nav"></i>
      Market SuDespensa.com
    </a>
    </div>
  </nav>

	<nav class="navbar navbar-dark bg-dark navbar-expand-lg">
  <div class="container-fluid">
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse container-fluid div-navbar" id="navbarNavAltMarkup">
      <div class="navbar-nav">
       <a class="navbar-brand" href="listausuarios.jsp"><i class="fas fa-users icon-nav"></i>Usuarios</a>
       <a class="navbar-brand" href="listaclientes.jsp"><i class="far fa-address-card icon-nav"></i>Clientes</a>
       <a class="navbar-brand" href="#"><i
				class="fas fa-truck icon-nav"></i>Proveedores</a>
       <a class="navbar-brand" href="#"><i class="fas fa-box-open icon-nav"></i>Productos</a>
       <a class="navbar-brand" href="#"><i class="fas fa-file-invoice-dollar icon-nav"></i>Ventas</a>
       <a class="navbar-brand" href="#"><i
				class="fas fa-clipboard-list icon-nav"></i>Reportes</a>
      </div>
    </div>
  </div>
</nav>
</header>


	<div class="card-login">
		<h1>Eliminar Usuarios</h1>


			<div id="error" class="alert alert-danger visually-hidden"
				role="alert">Error al eliminar el usuario, verifique que 
				exista un usuario con la cedula y usuario dados</div>


			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Usuario eliminado con exito</div>



			<form id="form1">
			
				
					<span class="input-group-text btn-card" id="inputGroup-sizing-default">Cedula</span>
  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  id="cedula_usuario" required>
				

			</form>

			<button type="button" class="btn btn-danger btn-card-enviar" onclick="eliminar()">
				<i class="fas fa-skull-crossbones"></i> Eliminar usuario
			</button>
</div>

	<div class="card-buttons">

          <button type="button" class="btn btn-success btn-card-footer" onclick="window.location.href='/insertarusuario.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar usuario</button>
					<button type="button" class="btn btn-danger btn-card-footer" onclick="window.location.href='/eliminarusuario.jsp'">
					<i class="fas fa-trash"></i> Eliminar usuario</button>
					<button type="button" class="btn btn-warning btn-card-footer" onclick="window.location.href='/actualizarusuario.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar usuario</button>
					<button type="button" class="btn btn-primary btn-card-footer"  onclick="window.location.href='/buscarusuario.jsp'">
					<i class="fas fa-search"></i> Buscar un usuario</button>
					<button type="button" class="btn btn-info btn-card-footer" onclick="window.location.href='/listausuarios.jsp'">
					<i class="fas fa-clipboard-list" ></i> Listar todos los usuarios</button>
	</div>

		

	
	
	<script>
		function eliminar() {
			var y = document.getElementById("cedula_usuario").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/listarusuarios', false);
			req.send(null);
			var usuarios = null;
			if (req.status == 200)
				usuarios = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < usuarios.length; i++) {
				
				console.log(usuarios[i].cedula_usuario);
				if (usuarios[i].cedula_usuario == y) {
					console.log(usuarios[i].cedula_usuario + " " + y);
					coincidencia = true;
					break;
				}
			}
			console.log(coincidencia);

			if (coincidencia != false) {
				var cedula=document.getElementById("cedula_usuario").value;
				
				var xhr = new XMLHttpRequest();
				xhr.open("DELETE", "http://localhost:8080/eliminarusuario?cedula_usuario="+cedula);
				
				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("cedula_usuario").value = "";
				xhr.send();

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				
				document.getElementById("cedula_usuario").value = "";;
			}
		}
	</script>

</body>
</html>