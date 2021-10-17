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
<link href="cinsertar.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<header>
		<div w3-include-html="/../snippets/sidenav.html"></div>
	</header>

	<div class="card-login">
		<h1>Actualizar Clientes</h1>

		<div id="error1" class="alert alert-danger visually-hidden"
			role="alert">Error al buscar el cliente, el cliente no existe</div>
		<div id="error" class="alert alert-danger visually-hidden"
			role="alert">Error al actualizar el cliente, el cliente no
			existe</div>
		<div id="correcto" class="alert alert-success visually-hidden"
			role="alert">Cliente actualizado con exito</div>

		<form action="form1">

			<span class="input-group-text btn-card" id="basic-addon4">Ingrese
				cliente a buscar.</span> <input type="text" class="form-control"
				aria-describedby="basic-addon4" required id="cedula_buscar">

			<button type="button" class="btn btn-success btn-card-enviar form"
				onclick="enviar()">
				<i class="fas fa-search"></i> Buscar Cliente
			</button>

			<span class="input-group-text btn-card"
				id="inputGroup-sizing-default">Cedula</span> <input type="text"
				class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" id="cedula_cliente"
				required disabled="disabled"> <span
				class="input-group-text btn-card" id="inputGroup-sizing-default">Direccion</span>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" id="direccion_cliente"
				required> <span class="input-group-text btn-card"
				id="inputGroup-sizing-default">Email</span> <input type="text"
				class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" required
				id="email_cliente"> <span class="input-group-text btn-card"
				id="inputGroup-sizing-default">Nombre</span> <input type="text"
				class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" required
				id="nombre_cliente"> <span class="input-group-text btn-card"
				id="inputGroup-sizing-default">Telefono</span> <input type="text"
				class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" required
				id="telefono_cliente">
		</form>
		<button type="button" class="btn btn-primary btn-card-enviar"
			onclick="actualizar()">
			<i class="fas fa-check"></i> Actualizar Cliente
		</button>
	</div>





	<div class="card-buttons">

		<button type="button" class="btn btn-success btn-card-footer"
			onclick="window.location.href='/insertarclientes.jsp'">
			<i class="fas fa-plus-circle"></i> Agregar cliente
		</button>
		<button type="button" class="btn btn-danger btn-card-footer"
			onclick="window.location.href='/eliminarcliente.jsp'">
			<i class="fas fa-trash"></i> Eliminar cliente
		</button>
		<button type="button" class="btn btn-warning btn-card-footer"
			onclick="window.location.href='/actualizarcliente.jsp'">
			<i class="fas fa-pen-alt"></i> Actualizar cliente
		</button>
		<button type="button" class="btn btn-primary btn-card-footer"
			onclick="window.location.href='/buscarcliente.jsp'">
			<i class="fas fa-search"></i> Buscar un cliente
		</button>
		<button type="button" class="btn btn-info btn-card-footer"
			onclick="window.location.href='/listaclientes.jsp'">
			<i class="fas fa-clipboard-list"></i> Listar todos los clientes
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
			var ced_bus = document.getElementById("cedula_buscar").value;
			req.open('GET',
					'http://localhost:8080/consultarcliente?cedula_cliente='
							+ ced_bus, false);
			req.send(null);
			var cliente = null;
			if (req.status == 200)
				cliente = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			var element = document.getElementById("error1");
			element.classList.add("visually-hidden");
			//var element2 = document.getElementById("correcto");
			//element2.classList.remove("visually-hidden");

			console.log(cliente.toString());

			if (cliente.toString() != "") {
				document.getElementById("cedula_cliente").value = cliente[0].cedula_cliente;
				document.getElementById("direccion_cliente").value = cliente[0].direccion_cliente;
				document.getElementById("email_cliente").value = cliente[0].email_cliente;
				document.getElementById("nombre_cliente").value = cliente[0].nombre_cliente;
				document.getElementById("telefono_cliente").value = cliente[0].telefono_cliente;

				document.getElementById("cedula_buscar").value = "";

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("cedula_cliente").value = "";
				document.getElementById("direccion_cliente").value = "";
				document.getElementById("email_cliente").value = "";
				document.getElementById("nombre_cliente").value = "";
				document.getElementById("telefono_cliente").value = "";
			}
		}

		function actualizar() {
			var y = document.getElementById("cedula_cliente").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/listarclientes', false);
			req.send(null);
			var cliente = null;
			if (req.status == 200)
				cliente = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < cliente.length; i++) {
				console.log(cliente[i].cedula_cliente);

				if (cliente[i].cedula_cliente == y) {
					console.log(cliente[i].cedula_cliente + " " + y);
					coincidencia = true
					break;
				}
			}
			console.log(coincidencia);

			if (coincidencia != false) {
				var formData = new FormData();
				formData.append("cedula_cliente", document
						.getElementById("cedula_cliente").value);
				formData.append("direccion_cliente", document
						.getElementById("direccion_cliente").value);
				formData.append("email_cliente", document
						.getElementById("email_cliente").value);
				formData.append("nombre_cliente", document
						.getElementById("nombre_cliente").value);
				formData.append("telefono_cliente", document
						.getElementById("telefono_cliente").value);
				var xhr = new XMLHttpRequest();
				xhr.open("PUT", "http://localhost:8080/actualizarcliente");

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("cedula_cliente").value = "";
				document.getElementById("direccion_cliente").value = "";
				document.getElementById("email_cliente").value = "";
				document.getElementById("nombre_cliente").value = "";
				document.getElementById("telefono_cliente").value = "";
				xhr.send(formData);

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");

				document.getElementById("cedula_cliente").value = "";
				document.getElementById("direccion_cliente").value = "";
				document.getElementById("email_cliente").value = "";
				document.getElementById("nombre_cliente").value = "";
				document.getElementById("telefono_cliente").value = "";
			}
		}
	</script>

</body>
</html>