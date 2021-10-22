<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Insertar Proveedores</title>
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
		<h1>Agregar Proveedores</h1>

		<div id="error" class="alert alert-danger visually-hidden"
			role="alert">Error al crear el proveedor</div>
		<div id="correcto" class="alert alert-success visually-hidden"
			role="alert">Proveedor creado con exito</div>
		<form action="form1">
			<span class="input-group-text btn-card"
				id="inputGroup-sizing-default">Nit Proveedor</span> <input
				type="text" class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" id="nit_proveedor"
				required> <span class="input-group-text btn-card"
				id="inputGroup-sizing-default">Nombre proveedor</span> <input
				type="text" class="form-control" aria-label="Sizing example input"
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
			onclick="enviar()">
			<i class="fas fa-check"></i> Insertar nuevo proveedor
		</button>
	</div>


	<div class="card-buttons">
		<div class="row">
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-success btn-card"
					onclick="window.location.href='insertarproveedor.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar proveedor
				</button>
			</div>
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-danger btn-card"
					onclick="window.location.href='eliminarproveedor.jsp'">
					<i class="fas fa-trash"></i> Eliminar proveedor
				</button>
			</div>
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-warning btn-card"
					onclick="window.location.href='actualizarproveedor.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar proveedor
				</button>
			</div>
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-primary btn-card"
					onclick="window.location.href='buscarproveedor.jsp'">
					<i class="fas fa-search"></i> Buscar un proveedor
				</button>
			</div>
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-info btn-card"
					onclick="window.location.href='listaproveedores.jsp'">
					<i class="fas fa-clipboard-list"></i> Listar todos los proveedores
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
			var y = document.getElementById("nit_proveedor").value;
			var getUrl = window.location;
			var baseUrl = getUrl.protocol + "//" + getUrl.host + "/"
					+ getUrl.pathname.split('/')[1];
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', baseUrl + '/listarproveedores', false);
			req.send(null);
			var proveedores = null;
			if (req.status == 200)
				proveedores = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < proveedores.length; i++) {
				console.log(proveedores[i].nit_proveedor);

				if (proveedores[i].nit_proveedor == y) {
					console.log(proveedor[i].nit_proveedor + " " + y);
					coincidencia = true
					break;
				}
			}
			console.log(coincidencia);

			if (coincidencia == false) {
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
				xhr.open("POST", baseUrl + "/registrarproveedores");

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