<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Eliminar Proveedor</title>
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
		<h1>Eliminar Proveedor</h1>


		<div id="error" class="alert alert-danger visually-hidden"
			role="alert">Error al eliminar el proveedor, verifique que
			exista un proveedor con el nit dado</div>


		<div id="correcto" class="alert alert-success visually-hidden"
			role="alert">Proveedor eliminado con exito</div>



		<form id="form1">


			<span class="input-group-text btn-card"
				id="inputGroup-sizing-default">nit</span> <input type="text"
				class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default" id="nit_proveedor"
				required>


		</form>

		<button type="button" class="btn btn-danger btn-card-enviar"
			onclick="eliminar()">
			<i class="fas fa-skull-crossbones"></i> Eliminar Proveedor
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
		function eliminar() {
			var y = document.getElementById("nit_proveedor").value;
			var getUrl = window.location;
			var baseUrl = getUrl.protocol + "//" + getUrl.host + "/"
					+ getUrl.pathname.split('/')[1];
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', baseUrl + '/listarproveedores', false);
			req.send(null);
			var proveedor = null;
			if (req.status == 200)
				proveedor = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < proveedor.length; i++) {

				console.log(proveedor[i].nit_proveedor);
				if (proveedor[i].nit_proveedor == y) {
					console.log(proveedor[i].nit_proveedor + " " + y);
					coincidencia = true;
					break;
				}
			}
			console.log(coincidencia);

			if (coincidencia != false) {
				var nit = document.getElementById("nit_proveedor").value;

				var xhr = new XMLHttpRequest();
				xhr.open("DELETE", baseUrl
						+ "/eliminarproveedores?nit_proveedor=" + nit);

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");

				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("nit_proveedor").value = "";
				xhr.send();

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");

				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");

				document.getElementById("nit_proveedor").value = "";
				;
			}
		}
	</script>

</body>
</html>