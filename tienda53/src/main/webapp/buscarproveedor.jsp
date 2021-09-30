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
<h1>Buscar Proveedor</h1>

<div id="error" class="alert alert-danger visually-hidden" role="alert">Error al buscar el proveedor, el proveedor no existe</div>
<div id="correcto" class="alert alert-success visually-hidden" role="alert">Proveedor encontrado con exito</div>

 <form action="form1">
 
 <span class="input-group-text btn-card" id="basic-addon4">Ingrese proveedor a buscar.</span> 
 <input	type="text" class="form-control" aria-describedby="basic-addon4" required id="nit_proveedor1" >
  <span class="input-group-text btn-card" id="inputGroup-sizing-default">Nit</span>
  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  id="nit_proveedor" required disabled="disabled">
   <span class="input-group-text btn-card" id="inputGroup-sizing-default">Nombre proveedor</span>
  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  id="nombre_proveedor" required disabled="disabled">
   <span class="input-group-text btn-card" id="inputGroup-sizing-default">Direccion</span>
  <input type="text" class="form-control"aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required id="direccion_proveedor" disabled="disabled">
   <span class="input-group-text btn-card" id="inputGroup-sizing-default">Telefono</span>
  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required id="telefono_proveedor" disabled="disabled">
   <span class="input-group-text btn-card" id="inputGroup-sizing-default">Ciudad</span>
  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required id="ciudad_proveedor" disabled="disabled">
</form>
 <button type="button" class="btn btn-primary btn-card-enviar" onclick="enviar()">
<i class="fas fa-check"></i> Buscar Proveedor
</button>
</div>
				
				



	<div class="card-buttons">

          <button type="button" class="btn btn-success btn-card-footer" onclick="window.location.href='/insertarclientes.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar cliente</button>
					<button type="button" class="btn btn-danger btn-card-footer" onclick="window.location.href='/eliminarcliente.jsp'">
					<i class="fas fa-trash"></i> Eliminar cliente</button>
					<button type="button" class="btn btn-warning btn-card-footer" onclick="window.location.href='/actualizarcliente.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar cliente</button>
					<button type="button" class="btn btn-primary btn-card-footer" onclick="window.location.href='/buscarcliente.jsp'">
					<i class="fas fa-search"></i> Buscar un cliente</button>
					<button type="button" class="btn btn-info btn-card-footer" onclick="window.location.href='/listaclientes.jsp'">
					<i class="fas fa-clipboard-list" ></i> Listar todos los clientes</button>
	</div>

	
	
	<script>
		function enviar() {
				
				var req = new XMLHttpRequest();
				var coincidencia = false;
				var nit_bus=   document.getElementById("nit_proveedor1").value;
				req.open('GET', 'http://localhost:8080/consultarproveedores?nit_proveedor='+nit_bus, false);
				req.send(null);
				var proveedor = null;
				if (req.status == 200)
					proveedor = JSON.parse(req.responseText);
				console.log(JSON.parse(req.responseText));
				
			
				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");
				
				console.log(proveedor.toString());
				
			if (proveedor.toString()!=""){
				document.getElementById("nit_proveedor").value = proveedor[0].nit_proveedor;
				document.getElementById("nombre_proveedor").value = proveedor[0].nombre_proveedor;
				document.getElementById("direccion_proveedor").value = proveedor[0].direccion_proveedor;
				document.getElementById("telefono_proveedor").value = proveedor[0].telefono_proveedor;
				document.getElementById("ciudad_proveedor").value = proveedor[0].ciudad_proveedor;
				
				document.getElementById("nit_proveedor1").value = "";
			
			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("nit_proveedor").value = "";
				document.getElementById("nombre_proveedor").value = "";
				document.getElementById("direccion_proveedor").value = "";
				document.getElementById("telefono_proveedor").value = "";
				document.getElementById("ciudad_proveedor").value = "";
			}
		}
	</script>

</body>
</html>