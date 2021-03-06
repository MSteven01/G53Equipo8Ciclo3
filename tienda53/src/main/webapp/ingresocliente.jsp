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
  <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
    <div class="container-fluid">
    <a class="navbar-brand" href="index.html">
    <i class="fas fa-store icon-nav"></i>
      Market SuDespensa.com
    </a>
    </div>
  </nav>
</header>


	<div class="card-login">
    
    <div class="card-header">
		<h1>Bienvenido a la Tienda Gen?rica</h1>
    </div>

    <div class="card-body">
	<span class="span-login">Usuario</span>
    <div class="input-group mb-3">
    <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
    </div>
    <input id="inputuser" type="text" class="form-control" placeholder="Usuario" aria-label="Usuario" aria-describedby="basic-addon1">
    </div>
    <span class="span-login">Contrase?a</span>
    <div class="input-group mb-3">
    <div class="input-group-prepend">
      <span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></span>
    </div>
      <input id="inputpass" type="password" class="form-control" placeholder="Contrase?a" aria-label="Contrase?a" aria-describedby="basic-addon1">
    </div>  
    <div>
      <button type="button" class="btn btn-primary btn-login-ingresar" onclick="comparar()">Ingresar</button>
       <div id="error" class="alert alert-danger visually-hidden"
    role="alert">Usuario o contrase?a incorrecta!
    </div>
      <button type="button" class="btn btn-primary btn-login-crearc">Crear cuenta</button>
    </div>
    </div>

    <div class="card-footer">
      <a href="#"><button class="btn btn-primary btn-login-opassword">?Olvidaste la contrase?a?</button></a>
    </div>
    
   
	</div>
 

<script>
function comparar() {
	//trayendo texto de input de username
	var x = document.getElementById("inputuser").value;
	//trayendo texto de input de password
	var y = document.getElementById("inputpass").value;
	//url de la api 
	var baseurl = "http://localhost:8080/listarclientes";
	//creando un objeto de manipulacion de solicitudes
	var xmlhttp = new XMLHttpRequest();
	//abriendo la api
	xmlhttp.open("GET", baseurl, true);
	//funcion interna que compara la informaci?n
	xmlhttp.onreadystatechange = function() {
		//si se obtiene un 200 (Conexion correcta)
		if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
			//convirtiendo JSON en variable javascrip
			var usuarios = JSON.parse(xmlhttp.responseText);
			
			//verificando uno por uno si existe ese usuario
			for (i = 0; i < usuarios.length; i++) {
				
				//imprimiendo en la consola del navegador pata verificar
				console.log(usuarios);
				console.log(x);
				console.log(usuarios[i].usuario);
				console.log(y);
				console.log(usuarios[i].password);
				
				//si el nombre coincide
				if (usuarios[i].usuario === x) {
					//si la clave coincide
					if (usuarios[i].password === y) {
						console.log("si");
						var element = document.getElementById("error");
						element.classList.add("visually-hidden");
						document.getElementById("inputuser").value = "";
						document.getElementById("inputpass").value = "";
						window.location.href = "listaclientes.jsp";
						return;
					} else {
						//si la clave NO coincide
						console.log("error clave");
						var element = document.getElementById("error");
						element.classList.remove("visually-hidden");
						document.getElementById("inputuser").value = "";
						document.getElementById("inputpass").value = "";
						return;
					}
				}
			}
			//Si no existe el usuario
			console.log("no encontrado");
			
			//quitando la capacidad de ocultacion del error para mostrarlo
			var element = document.getElementById("error");
			element.classList.remove("visually-hidden");
			document.getElementById("inputuser").value = "";
			document.getElementById("inputpass").value = "";
			return;
		}
	};
	//ejecutando
	xmlhttp.send();
}
</script>
</body>
</html>