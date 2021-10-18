<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Insertar Producto</title>
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
<script>
	function loadproductos() {
		var getUrl = window.location;
		var baseUrl = getUrl.protocol + "//" + getUrl.host + "/"+ getUrl.pathname.split('/')[1];
		//var baseurl = "http://localhost:8080/listarproductos";
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseUrl + "/listarproductos", true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var productos = JSON.parse(xmlhttp.responseText);
				var tbltop = "<table class='table table-dark table-striped'><tr><th>Codigo Producto</th><th>Iva</th><th>Nit Proveedor</th><th>Nombre Producto</th><th>Precio Compra</th></th><th>Precio Venta</th></tr>";
				var main = "";
				for (i = 0; i < productos.length; i++) {
					main += "<tr><td>" + productos[i].codigo_producto
							+ "</td><td>" + productos[i].iva_compra
							+ "</td><td>" + productos[i].nit_proveedor
							+ "</td><td>" + productos[i].nombre_producto
							+ "</td><td>" + productos[i].precio_compra
							+ "</td><td>" + productos[i].precio_venta
							+ "</td></tr>";
				}
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				document.getElementById("productosinfo").innerHTML = tbl;
			}
		};
		xmlhttp.send();
	}
	window.onload = function() {
		loadproductos();
	}
</script>
</head>
<body>

	<header>
		<div w3-include-html="/../snippets/sidenav.html"></div>
	</header>

	<div class="card-insertar">
		<h1 class="title-productos">Insertando archivo de productos</h1>

		<div id="error" class="alert alert-danger visually-hidden"
			role="alert">Archivo vacio, extensi�n no valida o datos
			corruptos (El separador debe ser coma ",")</div>

		<div id="correcto" class="alert alert-success visually-hidden"
			role="alert">Productos importados desde CSV con exito</div>

		<form id="form1">
			<div>
				<label for="formFileLg" class="form-label p-insertar">Seleccionar
					archivo CSV con el inventario de los productos.</label> <input
					class="form-control form-control-lg" id="archivo" type="file"
					accept=".csv">

				<button type="button" class="btn btn-success btn-card-enviar"
					onclick="subirArchivo()">
					<i class="far fa-file-archive icon-productos"></i>Subir archivo
				</button>


				<button type="button" class="btn btn-success btn-card-enviar"
					onclick="window.location.reload()">
					<i class="fas fa-sync icon-productos"></i>Recargar
				</button>
			</div>
		</form>
	</div>

	<div class="table-productos">
		<h1 class="title-table">Tabla de productos</h1>
		<div class="row">
			<!--  Aqui es donde se autogenera la tabla basado en el script -->
			<div class="col align-self-center" id="productosinfo"></div>
		</div>
	</div>

	<script src="js/scripts.js"></script>

	<script>
		includeHTML();
	</script>

	<script>
		function subirArchivo() {

			try {
				var getUrl = window.location;
				var baseUrl = getUrl.protocol + "//" + getUrl.host + "/"+ getUrl.pathname.split('/')[1];
				var csvFile = document.getElementById("archivo");

				var input = csvFile.files[0];
				var reader = new FileReader();

				reader.onload = function(e) {

					var text = e.target.result;

					var arrayLineas = text.split("\n");

					var xhr = new XMLHttpRequest();
					xhr.open("DELETE", baseUrl + "/eliminartodoproducto", true);
					xhr.send();

					for (var i = 0; i < arrayLineas.length; i += 1) {
						var arraydatos = arrayLineas[i].split(",");

						if (arrayLineas[i] == "") {
							continue;
						}

						for (var j = 0; j < arraydatos.length; j += 1) {
							console.log(i + " " + j + "->" + arraydatos[j]);
						}

						var formData = new FormData();
						formData.append("codigo_producto", arraydatos[0]);
						formData.append("nombre_producto", arraydatos[1]);
						formData.append("nit_proveedor", arraydatos[2]);
						formData.append("precio_compra", arraydatos[3]);
						formData.append("iva_compra", arraydatos[4]);
						formData.append("precio_venta", arraydatos[5]);
						var xhr = new XMLHttpRequest();
						xhr.open("POST", baseUrl +	"/registrarproducto");

						xhr.send(formData);
					}

					var element = document.getElementById("error");
					element.classList.add("visually-hidden");
					var element2 = document.getElementById("correcto");
					element2.classList.remove("visually-hidden");

					document.getElementById("archivo").value = "";

				};

				reader.readAsText(input);
			} catch (error) {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");

				document.getElementById("archivo").value = "";
			}
		}
	</script>


</body>
</html>