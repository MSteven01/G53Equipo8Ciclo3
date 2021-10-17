<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Actualizar Proveedor</title>
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
		<h1>Actualizar Proveedores</h1>

		<div id="error1" class="alert alert-danger visually-hidden"
			role="alert">Error al buscar el proveedor, el proveedor no
			existe</div>
		<div id="error" class="alert alert-danger visually-hidden"
			role="alert">Error al actualizar el proveedor, el proveedor no
			existe</div>
		<div id="correcto" class="alert alert-success visually-hidden"
			role="alert">Proveedor actualizado con exito</div>

		<form action="form1">

			<span class="input-group-text btn-card" id="basic-addon4">Ingrese
				proveedor a buscar.</span> <input type="text" class="form-control"
				aria-describedby="basic-addon4" required id="nit_proveedor1">

			<button type="button" class="btn btn-success btn-card-enviar form"
				onclick="enviar()">
				<i class="fas fa-search"></i> Buscar Proveedor
			</button>

			<span class="input-group-text btn-card"
				id="inputGroup-sizing-default">Nit</span> <input type="text"
				class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" id="nit_proveedor"
				required disabled="disabled"> <span
				class="input-group-text btn-card" id="inputGroup-sizing-default">Nombre
				proveedor</span> <input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" id="nombre_proveedor"
				required> <span class="input-group-text btn-card"
				id="inputGroup-sizing-default">Direccion</span> <input type="text"
				class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" required
				id="direccion_proveedor"> <span
				class="input-group-text btn-card" id="inputGroup-sizing-default">Telefono</span>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" required
				id="telefono_proveedor"> <span
				class="input-group-text btn-card" id="inputGroup-sizing-default">Ciudad</span>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" required
				id="ciudad_proveedor">
		</form>
		<button type="button" class="btn btn-primary btn-card-enviar"
			onclick="actualizar()">
			<i class="fas fa-check"></i> Actualizar Proveedor
		</button>
	</div>





	<div class="card-buttons">

		<button type="button" class="btn btn-success btn-card-footer"
			onclick="window.location.href='/insertarproveedor.jsp'">
			<i class="fas fa-plus-circle"></i> Agregar proveedor
		</button>
		<button type="button" class="btn btn-danger btn-card-footer"
			onclick="window.location.href='/eliminarproveedor.jsp'">
			<i class="fas fa-trash"></i> Eliminar proveedor
		</button>
		<button type="button" class="btn btn-warning btn-card-footer"
			onclick="window.location.href='/actualizarproveedor.jsp'">
			<i class="fas fa-pen-alt"></i> Actualizar proveedor
		</button>
		<button type="button" class="btn btn-primary btn-card-footer"
			onclick="window.location.href='/buscarproveedor.jsp'">
			<i class="fas fa-search"></i> Buscar un proveedor
		</button>
		<button type="button" class="btn btn-info btn-card-footer"
			onclick="window.location.href='/listaproveedores.jsp'">
			<i class="fas fa-clipboard-list"></i> Listar todos los proveedores
		</button>
	</div>

	<script src="js/scripts.js"></script>

	<script>
		includeHTML();
	</script>


	<script>
		function enviar() {

			var req = new XMLHttpRequest();
			var coincidencia = false;
			var nit_bus = document.getElementById("nit_proveedor1").value;
			req.open('GET',
					'http://localhost:8080/consultarproveedores?nit_proveedor='
							+ nit_bus, false);
			req.send(null);
			var proveedor = null;
			if (req.status == 200)
				proveedor = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			var element = document.getElementById("error1");
			element.classList.add("visually-hidden");
			//var element2 = document.getElementById("correcto");
			//element2.classList.remove("visually-hidden");

			console.log(proveedor.toString());

			if (proveedor.toString() != "") {
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

		function actualizar() {
			var y = document.getElementById("nit_proveedor").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/listarproveedores', false);
			req.send(null);
			var proveedor = null;
			if (req.status == 200)
				proveedor = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < proveedor.length; i++) {
				console.log(proveedor[i].nit_proveedor);

				if (proveedor[i].nit_proveedor == y) {
					console.log(proveedor[i].nit_proveedor + " " + y);
					coincidencia = true
					break;
				}
			}
			console.log(coincidencia);

			if (coincidencia != false) {
				var formData = new FormData();
				formData.append("nit_proveedor", document
						.getElementById("nit_proveedor").value);
				formData.append("nombre_proveedor", document
						.getElementById("nombre_proveedor").value);
				formData.append("direccion_proveedor", document
						.getElementById("direccion_proveedor").value);
				formData.append("telefono_proveedor", document
						.getElementById("telefono_proveedor").value);
				formData.append("ciudad_proveedor", document
						.getElementById("ciudad_proveedor").value);
				var xhr = new XMLHttpRequest();
				xhr.open("PUT", "http://localhost:8080/actualizarproveedores");

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("nit_proveedor").value = "";
				document.getElementById("nombre_proveedor").value = "";
				document.getElementById("direccion_proveedor").value = "";
				document.getElementById("telefono_proveedor").value = "";
				document.getElementById("ciudad_proveedor").value = "";
				xhr.send(formData);

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