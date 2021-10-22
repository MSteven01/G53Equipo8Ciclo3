<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Eliminar Cliente</title>
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
		<h1>Eliminar Cliente</h1>


		<div id="error" class="alert alert-danger visually-hidden"
			role="alert">Error al eliminar el cliente, verifique que exista
			un cliente con la cedula dada</div>


		<div id="correcto" class="alert alert-success visually-hidden"
			role="alert">Cliente eliminado con exito</div>



		<form id="form1">


			<span class="input-group-text btn-card"
				id="inputGroup-sizing-default">Cedula</span> <input type="text"
				class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" id="cedula_cliente"
				required>


		</form>

		<button type="button" class="btn btn-danger btn-card-enviar"
			onclick="eliminar()">
			<i class="fas fa-skull-crossbones"></i> Eliminar Cliente
		</button>
	</div>

	<div class="card-buttons">
<div class="row">
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-success btn-card"
					onclick="window.location.href='insertarclientes.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar cliente
				</button>
			</div>
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-danger btn-card"
					onclick="window.location.href='eliminarcliente.jsp'">
					<i class="fas fa-trash"></i> Eliminar cliente
				</button>
			</div>
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-warning btn-card"
					onclick="window.location.href='actualizarcliente.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar cliente
				</button>
			</div>
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-primary btn-card"
					onclick="window.location.href='buscarcliente.jsp'">
					<i class="fas fa-search"></i> Buscar un cliente
				</button>
			</div>
			<div class="box-cliente col-xl-2 col-lg-2 col-md-12 col-sm-12">
				<button type="button" class="btn btn-info btn-card"
					onclick="window.location.href='listaclientes.jsp'">
					<i class="fas fa-clipboard-list"></i> Listar todos los cliente
				</button>
			</div>
		</div>
	</div>

	<script src="js/scripts.js"></script>

	<script>
		includeHTML();
	</script>

	<script>
		function eliminar() {
			var y = document.getElementById("cedula_cliente").value;
			var getUrl = window.location;
			var baseUrl = getUrl.protocol + "//" + getUrl.host + "/"+ getUrl.pathname.split('/')[1];
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', baseUrl + '/listarclientes', false);
			req.send(null);
			var clientes = null;
			if (req.status == 200)
				clientes = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < clientes.length; i++) {

				console.log(clientes[i].cedula_cliente);
				if (clientes[i].cedula_cliente == y) {
					console.log(clientes[i].cedula_cliente + " " + y);
					coincidencia = true;
					break;
				}
			}
			console.log(coincidencia);

			if (coincidencia != false) {
				var cedula = document.getElementById("cedula_cliente").value;

				var xhr = new XMLHttpRequest();
				xhr.open("DELETE",	baseUrl + "/eliminarclientes?cedula_cliente="
								+ cedula);

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");

				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("cedula_cliente").value = "";
				xhr.send();

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");

				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");

				document.getElementById("cedula_cliente").value = "";
				;
			}
		}
	</script>

</body>
</html>