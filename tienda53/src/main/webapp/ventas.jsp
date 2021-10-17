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
<link href="cventas.css" rel="stylesheet" type="text/css" />
<script>
	window.onload = function() {
		var req = new XMLHttpRequest();
		var coincidencia = false;
		req.open('GET', 'http://localhost:8080/consultarconsecutivo', false);
		req.send(null);
		var consecutivo = null;
		if (req.status == 200)
			consecutivo = JSON.parse(req.responseText);
		console.log(JSON.parse(req.responseText));

		var element = document.getElementById("errorproducto");
		element.classList.add("visually-hidden");
		var element2 = document.getElementById("correcto");
		element2.classList.remove("visually-hidden");
		console.log(consecutivo.toString());

		if (consecutivo.toString() != "") {
			document.getElementById("consec").value = consecutivo[0].codigo_venta;
			var element = document.getElementById("errorconsec");
			element.classList.add("visually-hidden");
			var cons = parseInt(document.getElementById("consec").value);
			cons = cons + 1;
			document.getElementById("consec").value = cons;

		} else {
			var element = document.getElementById("errorconsec");
			element.classList.remove("visually-hidden");

		}

	}
</script>
</head>

<body>

	<header>
		<div w3-include-html="/../snippets/sidenav.html"></div>
	</header>


	<div class="card-login col-auto">
		<h1>Ventas</h1>

		<div class="box-cliente">

			<form action="form1">


				<div id="errorproducto" class="alert alert-danger visually-hidden"
					role="alert">Error al buscar producto.</div>
				<div id="correcto" role="alert"></div>
				<div id="error" class="alert alert-danger visually-hidden"
					role="alert">Error al buscar el cliente, el cliente no existe</div>
				<div id="errorconsec" class="alert alert-danger visually-hidden"
					role="alert">Error al cargar el consecutivo. Recargue la
					pagina</div>
				<div id="errorventa" class="alert alert-danger visually-hidden"
					role="alert">Error al registrar venta</div>
				<div id="correcto" class="alert alert-success visually-hidden"
					role="alert">Venta registrada</div>


				<div class="row ">
					<div class="col-xl-3 col-lg-4 col-md-4 col-sm-5">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text p-insertar" id="basic-addon1">Consecutivo</span>
							<input type="text" class="form-control" readonly="readonly"
								id="consec">
						</div>

					</div>
				</div>

				<div class="row ">
					<div class="col-xl-3 col-lg-4 col-md-4 col-sm-5">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text"><i id="checkusuario"
								class="fas fa-times text-danger"></i></span><span
								class="input-group-text p-insertar" id="basic-addon1">Cedula
								usuario</span><input type="text" class="form-control"
								id="cedula_usuario" oninput="enviarusuario()">
						</div>
					</div>
					<div class="col-xl-9 col-lg-8 col-md-8 col-sm-7">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text p-insertar" id="basic-addon1">Nombre</span>
							<input type="text" class="form-control" readonly="readonly"
								id="nombre_usuario">
						</div>
					</div>
				</div>


				<div class="row ">
					<div class="col-xl-3 col-lg-4 col-md-4 col-sm-5">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text"> <i id="checkcliente"
								class="fas fa-times text-danger"></i></span> <span
								class="input-group-text p-insertar" id="basic-addon1">Cedula
								cliente</span> <input type="text" class="form-control"
								id="cedula_buscar" oninput="enviar()">
						</div>
					</div>
					<div class="col-xl-9 col-lg-8 col-md-8 col-sm-7">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text p-insertar" id="basic-addon1">Nombre</span>
							<input type="text" class="form-control" readonly="readonly"
								id="nombre_cliente">
						</div>
					</div>
				</div>




				<div class="table-responsive-md-sm-lg-xl-xxl">
					<table class="table align-middle table table-borderless">

						<thead>
							<tr>
								<th scope="col"><span class="input-group-text p-insertar"
									id="inputGroup-sizing-default">Cod Producto</span></th>
								<th scope="col"></th>
								<th scope="col"><span class="input-group-text p-insertar"
									id="inputGroup-sizing-default">Nombre Producto</span></th>
								<th scope="col"><span class="input-group-text p-insertar"
									id="inputGroup-sizing-default">Cantidad</span></th>
								<th scope="col"><span class="input-group-text p-insertar"
									id="inputGroup-sizing-default">Vlr.unidad</span></th>
								<th scope="col"><span class="input-group-text p-insertar"
									id="inputGroup-sizing-default">Vlr.total</span></th>
							</tr>
						</thead>


						<tbody>
							<tr>
								<th scope="row"><input type="text"
									class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" required
									id="codigo_buscar"></th>
								<td><button type="button"
										class="btn btn-success btn-card-enviar1 form"
										onclick="bucarproducto()">
										<i class="fas fa-search"></i> Consultar
									</button></td>
								<td><input type="text" class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default"
									id="nombre_producto" disabled="disabled"></td>

								<td><input type="number"
									class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" id="cantidad1"
									min="0" max="100" value="0"
									oninput="validity.valid||(value='0');" onchange="calcular1()"></td>
								<td><input type="text" class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" id="precio1"
									disabled="disabled"></td>


								<td><input type="number"
									class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" id="total1"
									min="0" value="0" disabled="disabled"></td>
							</tr>

							<tr>
								<th scope="row"><input type="text"
									class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" required
									id="codigo_buscar2"></th>
								<td><button type="button"
										class="btn btn-success btn-card-enviar1 form"
										onclick="bucarproducto2()">
										<i class="fas fa-search"></i> Consultar
									</button></td>
								<td><input type="text" class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default"
									id="nombre_producto2" disabled="disabled"></td>
								<td><input type="number"
									class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" id="cantidad2"
									min="0" max="100" value="0"
									oninput="validity.valid||(value='0');" onchange="calcular1()"></td>
								<td><input type="text" class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" id="precio2"
									disabled="disabled"></td>
								<td><input type="number"
									class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" id="total2"
									value="0" disabled="disabled"></td>
							</tr>




							<tr>
								<th scope="row"><input type="text"
									class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" required
									id="codigo_buscar3"></th>
								<td><button type="button"
										class="btn btn-success btn-card-enviar1 form"
										onclick="bucarproducto3()">
										<i class="fas fa-search"></i> Consultar
									</button></td>
								<td><input type="text" class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default"
									id="nombre_producto3" disabled="disabled"></td>
								<td><input type="number"
									class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" id="cantidad3"
									min="0" maxlength="100" value="0"
									oninput="validity.valid||(value='0');" onchange="calcular1()"></td>
								<td><input type="text" class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" id="precio3"
									disabled="disabled"></td>
								<td><input type="number"
									class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" id="total3"
									value="0" disabled="disabled"></td>
							</tr>

							<tr>
								<th></th>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="input-group-text p-insertar"
									id="inputGroup-sizing-default">Total compra</span></td>
								<td><input type="number"
									class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" id="total4"
									disabled="disabled"></td>
							</tr>
							<tr>
								<th></th>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="input-group-text p-insertar"
									id="inputGroup-sizing-default">Total iva</span></td>
								<td><input type="number"
									class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" id="totaliva"
									disabled="disabled"></td>
							</tr>
							<tr>
								<th></th>
								<td></td>
								<td></td>
								<td></td>
								<td><span class="input-group-text p-insertar"
									id="inputGroup-sizing-default">Total con iva</span></td>
								<td><input type="number"
									class="form-controls1 form-control"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" id="totalconiva"
									disabled="disabled"></td>
							</tr>
							<tr>
								<td colspan="6">
									<button type="button"
										class="btn btn-success btn-card-enviar2 form"
										onclick="calcular1()">
										<i class="fas fa-search"></i> Calcular valor total
									</button>
								</td>
							</tr>

							<tr>
								<td colspan="6">
									<button type="button"
										class="btn btn-success btn-card-enviar2 form"
										onclick="guardar()">
										<i class="fas fa-search"></i> Guardar
									</button>
								</td>
							</tr>

							<tr>
								<td colspan="6">
									<button type="reset"
										class="btn btn-danger btn-card-enviar2 form">
										<i class="fas fa-trash"></i> Limpiar celdas
									</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>

	<!--  
			 <div class="input-group mb-3">
		<span class="input-group-text p-insertar" id="inputGroup-sizing-default">Consec.</span>
  		<input type="text" class="form-control form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required id="#s">
	</div>
		-->

	<script src="js/scripts.js"></script>

	<script>
		includeHTML();
	</script>


	<script>
		function enviar() {

			var client = document.getElementById("cedula_buscar").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET',
					'http://localhost:8080/consultarcliente?cedula_cliente='
							+ client, false);
			req.send(null);
			var cliente = null;
			if (req.status == 200)
				cliente = JSON.parse(req.responseText);
			console.log(cliente);

			var icono = document.getElementById("checkcliente");
			if (cliente.toString() != "") {

				document.getElementById("nombre_cliente").value = cliente[0].nombre_cliente;

				icono.classList.replace("text-danger", "text-success");
				icono.classList.replace("fa-times", "fa-check");

			} else {
				document.getElementById("nombre_cliente").value = "";
				icono.classList.replace("text-success", "text-danger");
				icono.classList.replace("fa-check", "fa-times");
			}

		}
		//

		function enviarusuario() {
			var user = document.getElementById("cedula_usuario").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/consultarusuario?usuario='
					+ user, false);
			req.send(null);
			var usuario = null;
			if (req.status == 200)
				usuario = JSON.parse(req.responseText);
			console.log(usuario);

			var icono2 = document.getElementById("checkusuario");
			if (usuario.toString() != "") {

				document.getElementById("nombre_usuario").value = usuario[0].nombre_usuario;

				icono2.classList.replace("text-danger", "text-success");
				icono2.classList.replace("fa-times", "fa-check");

			} else {
				document.getElementById("nombre_usuario").value = "";
				icono2.classList.replace("text-success", "text-danger");
				icono2.classList.replace("fa-check", "fa-times");
			}
		}
		//--------------------     Buscar Producto1		----------------------------- //		

		function bucarproducto() {
			var req = new XMLHttpRequest();
			var coincidencia = false;
			var pro_bus = document.getElementById("codigo_buscar").value;
			req.open('GET', 'http://localhost:8080/consultarproducto?code='
					+ pro_bus, false);
			req.send(null);
			var producto = null;
			if (req.status == 200)
				producto = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			var element = document.getElementById("errorproducto");
			element.classList.add("visually-hidden");
			var element2 = document.getElementById("correcto");
			element2.classList.remove("visually-hidden");
			console.log(producto.toString());

			if (producto.toString() != "") {
				document.getElementById("nombre_producto").value = producto[0].nombre_producto;
				document.getElementById("precio1").value = producto[0].precio_venta;
				document.getElementById("totaliva").value = producto[0].iva_compra;
				document.getElementById("codigo_buscar").value = "";
				var element = document.getElementById("errorproducto");
				element.classList.add("visually-hidden");

			} else {
				var element = document.getElementById("errorproducto");
				element.classList.remove("visually-hidden");

			}
		}

		//--------------------     Buscar Producto2		----------------------------- //

		function bucarproducto2() {
			var req = new XMLHttpRequest();
			var coincidencia = false;
			var pro_bus = document.getElementById("codigo_buscar2").value;
			req.open('GET', 'http://localhost:8080/consultarproducto?code='
					+ pro_bus, false);
			req.send(null);
			var producto = null;
			if (req.status == 200)
				producto = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			var element = document.getElementById("errorproducto");
			element.classList.add("visually-hidden");
			var element2 = document.getElementById("correcto");
			element2.classList.remove("visually-hidden");
			console.log(producto.toString());

			if (producto.toString() != "") {
				document.getElementById("nombre_producto2").value = producto[0].nombre_producto;
				document.getElementById("precio2").value = producto[0].precio_venta;
				document.getElementById("codigo_buscar2").value = "";
				var element = document.getElementById("errorproducto");
				element.classList.add("visually-hidden");

			} else {
				var element = document.getElementById("errorproducto");
				element.classList.remove("visually-hidden");

			}
		}

		//--------------------     Buscar Producto3		----------------------------- //

		function bucarproducto3() {
			var req = new XMLHttpRequest();
			var coincidencia = false;
			var pro_bus = document.getElementById("codigo_buscar3").value;
			req.open('GET', 'http://localhost:8080/consultarproducto?code='
					+ pro_bus, false);
			req.send(null);
			var producto = null;
			if (req.status == 200)
				producto = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			var element = document.getElementById("errorproducto");
			element.classList.add("visually-hidden");
			var element2 = document.getElementById("correcto");
			element2.classList.remove("visually-hidden");
			console.log(producto.toString());

			if (producto.toString() != "") {
				document.getElementById("nombre_producto3").value = producto[0].nombre_producto;
				document.getElementById("precio3").value = producto[0].precio_venta;
				document.getElementById("codigo_buscar3").value = "";
				var element = document.getElementById("errorproducto");
				element.classList.add("visually-hidden");

			} else {
				var element = document.getElementById("errorproducto");
				element.classList.remove("visually-hidden");

			}
		}

		//--------------------     Calcular productos		----------------------------- //
		function calcular1() {

			var cantidad1 = parseInt(document.getElementById("cantidad1").value);
			var precio1 = parseInt(document.getElementById("precio1").value);
			var total1 = cantidad1 * precio1;
			document.getElementById("total1").value = total1;

			var cantidad2 = parseInt(document.getElementById("cantidad2").value);
			var precio2 = parseInt(document.getElementById("precio2").value);
			var total2 = cantidad2 * precio2;
			document.getElementById("total2").value = total2;

			var cantidad3 = parseInt(document.getElementById("cantidad3").value);
			var precio3 = parseInt(document.getElementById("precio3").value);
			var total3 = cantidad3 * precio3;
			document.getElementById("total3").value = total3;

			if (document.getElementById("total1").value.length != 0
					&& document.getElementById("total2").value.length == 0
					&& document.getElementById("total3").value.length == 0) {
				document.getElementById("total4").value = total1;

			} else if (document.getElementById("total1").value.length != 0
					&& document.getElementById("total2").value.length != 0
					&& document.getElementById("total3").value.length == 0) {
				var suma = total1 + total2;
				document.getElementById("total4").value = suma;

			} else if (document.getElementById("total1").value.length != 0
					&& document.getElementById("total2").value.length != 0
					&& document.getElementById("total3").value.length != 0) {
				var suma = total1 + total2 + total3;
				document.getElementById("total4").value = suma;

			} else if (document.getElementById("total1").value.length != 0
					&& document.getElementById("total2").value.length == 0
					&& document.getElementById("total3").value.length != 0) {
				var suma = total1 + total3;
				document.getElementById("total4").value = suma;

			} else if (document.getElementById("total1").value.length == 0
					&& document.getElementById("total2").value.length != 0
					&& document.getElementById("total3").value.length != 0) {
				var suma = total2 + total3;
				document.getElementById("total4").value = suma;

			}

			else if (document.getElementById("total1").value.length == 0
					&& document.getElementById("total2").value.length != 0
					&& document.getElementById("total3").value.length == 0) {
				document.getElementById("total4").value = total2;

			}

			else if (document.getElementById("total1").value.length == 0
					&& document.getElementById("total2").value.length == 0
					&& document.getElementById("total3").value.length != 0) {
				document.getElementById("total4").value = total3;
			}

			var total4 = parseInt(document.getElementById("total4").value);
			var iva = parseInt(document.getElementById("totaliva").value);
			var totaliva = total4 * .19;
			totaliva = totaliva.toFixed(1);
			document.getElementById("totaliva").value = totaliva;

			var total5 = parseInt(document.getElementById("totalconiva").value);
			total5 = (Number(total4)) + (Number(totaliva));
			total5 = total5.toFixed(1);
			document.getElementById("totalconiva").value = total5;

		}

		function guardar() {

			var formData = new FormData();
			formData.append("codigo_venta",
					document.getElementById("consec").value);
			formData.append("cedula_cliente", document
					.getElementById("cedula_buscar").value);
			formData.append("cedula_usuario", document
					.getElementById("cedula_usuario").value);
			formData.append("ivaventa",
					document.getElementById("totaliva").value);
			formData.append("total_venta",
					document.getElementById("total4").value);
			formData.append("valor_venta", document
					.getElementById("totalconiva").value);
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "http://localhost:8080/registrarventa");

			var element = document.getElementById("errorventa");
			element.classList.add("visually-hidden");
			var element2 = document.getElementById("correcto");
			element2.classList.remove("visually-hidden");

			document.getElementById("consec").value = "";
			document.getElementById("cedula_buscar").value = "";
			document.getElementById("nombre_cliente").value = "";
			document.getElementById("cedula_usuario").value = "";
			document.getElementById("nombre_usuario").value = "";
			document.getElementById("nombre_producto").value = "";
			document.getElementById("nombre_producto2").value = "";
			document.getElementById("nombre_producto3").value = "";
			document.getElementById("cantidad1").value = "";
			document.getElementById("cantidad2").value = "";
			document.getElementById("cantidad3").value = "";
			document.getElementById("precio1").value = "";
			document.getElementById("precio2").value = "";
			document.getElementById("precio3").value = "";
			document.getElementById("totaliva").value = "";
			document.getElementById("total1").value = "";
			document.getElementById("total2").value = "";
			document.getElementById("total3").value = "";
			document.getElementById("total4").value = "";
			document.getElementById("totalconiva").value = "";
			xhr.send(formData);

		}
	</script>
</body>
</html>