package com.grupo53.tienda53.tiendasudespensa.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.grupo53.tienda53.tiendasudespensa.DTO.ClienteVO;
import com.grupo53.tienda53.tiendasudespensa.DTO.ProductoVO;
import com.grupo53.tienda53.tiendasudespensa.DTO.VentaVO;

public class VentaDAO {
	public void registrarVenta(VentaVO ventas) {
		// llama y crea una instancia de la clase encargada de hacer la conexión
		Conexion conex = new Conexion();

		try {
			// sentencia que se ejecutara en la base de datos
			Statement estatuto = conex.getConnection().createStatement();

			// String que contiene la sentencia insert a ejecutar
			String sentencia = "INSERT INTO ventas VALUES(" + ventas.getCodigo_venta() + ","
					+ ventas.getCedula_cliente() + "," + ventas.getCedula_usuario() + ",'" + ventas.getIvaventa() + "',"
					+ ventas.getTotal_venta() + "," + ventas.getValor_venta() + "" + ");";

			// se ejecuta la sentencia en la base de datos
			estatuto.executeUpdate(sentencia);
			// impresión en consola para verificación
			System.out.println("Registrado " + sentencia);
			// cerrando la sentencia y la conexión
			estatuto.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	public ArrayList<ClienteVO> consultarCliente(int cedula_cliente) {
		// lista que contendra el o los usuarios obtenidos
		ArrayList<ClienteVO> listacliente = new ArrayList<ClienteVO>();
		// instancia de la conexión
		Conexion conex = new Conexion();
		try {
			// prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection().prepareStatement(
					"SELECT nombre_cliente FROM clientes INNER JOIN ventas ON clientes.cedula_cliente = ventas.cedula_cliente WHERE clientes.cedula_cliente = ? ");
			// se cambia el comodin ? por el dato que ha llegado en el parametro de la
			// funcion
			consulta.setInt(1, cedula_cliente);
			// ejecute la sentencia
			ResultSet res = consulta.executeQuery();
			// cree un objeto basado en la clase entidad con los datos encontrados
			if (res.next()) {
				ClienteVO Cliente = new ClienteVO();
				Cliente.setCedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
				// Cliente.setEmail_cliente(res.getString("email_cliente"));
				Cliente.setNombre_cliente(res.getString("nombre_cliente"));
				// Cliente.setTelefono_cliente(res.getString("telefono_cliente"));
				// Cliente.setDireccion_cliente(res.getString("direccion_cliente"));

				listacliente.add(Cliente);
			}
			// cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar el cliente");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar el cliente");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
		return listacliente;
	}

	public ArrayList<VentaVO> listaDeVentas() {
		// lista que contendra el o los productos obtenidos
		ArrayList<VentaVO> listaventa = new ArrayList<VentaVO>();

		// instancia de la conexión
		Conexion conex = new Conexion();

		try {
			// prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM ventas");

			// ejecute la sentencia
			ResultSet res = consulta.executeQuery();

			// cree un objeto para cada encontrado en la base de datos basado en la clase
			// entidad con los datos encontrados
			while (res.next()) {
				VentaVO newventa = new VentaVO();
				newventa.setCodigo_venta(Integer.parseInt(res.getString("codigo_venta")));
				newventa.setCedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
				newventa.setCedula_usuario(Integer.parseInt(res.getString("cedula_usuario")));
				newventa.setIvaventa(Double.parseDouble(res.getString("ivaventa")));
				newventa.setTotal_venta(Double.parseDouble(res.getString("total_venta")));
				newventa.setValor_venta(Double.parseDouble(res.getString("valor_venta")));

				listaventa.add(newventa);
			}

			// cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

		return listaventa;
	}

	public ArrayList<ProductoVO> consultarProducto(Integer product) {
		// lista que contendra el o los productos obtenidos
		ArrayList<ProductoVO> listaproductos = new ArrayList<ProductoVO>();
		// instancia de la conexión
		Conexion conex = new Conexion();
		try {
			// prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection()
					.prepareStatement("SELECT * FROM productos where codigo_producto = ? ");
			// se cambia el comodin ? por el dato que ha llegado en el parametro de la
			// funcion
			consulta.setInt(1, product);
			// ejecute la sentencia
			ResultSet res = consulta.executeQuery();
			// cree un objeto basado en la clase entidad con los datos encontrados
			if (res.next()) {
				ProductoVO newproducto = new ProductoVO();
				newproducto.setCodigo_producto(Integer.parseInt(res.getString("codigo_producto")));
				newproducto.setIva_compra(Double.parseDouble(res.getString("iva_compra")));
				// newproducto.setNit_proveedor(Integer.parseInt(res.getString("nit_proveedor")));
				newproducto.setNombre_producto(res.getString("nombre_producto"));
				// newproducto.setPrecio_compra(Double.parseDouble(res.getString("precio_compra")));
				newproducto.setPrecio_venta(Double.parseDouble(res.getString("precio_venta")));

				listaproductos.add(newproducto);
			}
			// cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
		return listaproductos;
	}

	public void eliminarVentaProducto(Integer codigo_venta) {

		// instancia de la conexion
		Conexion conex = new Conexion();

		try {
			// sentencia inicializada
			Statement consulta = conex.getConnection().createStatement();

			// preparando sentencia a realizar
			String sentencia = "delete from ventas where codigo_venta=" + codigo_venta + ";";

			// impresion de verificación
			System.out.println("Registrado " + sentencia);

			// ejecutando la sentencia en la base de datos
			consulta.execute(sentencia);

			// cerrando sentencia y conexión
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	public void actualizarVenta(VentaVO vent) {

		// instancia de conexion
		Conexion conex = new Conexion();

		try {
			// inicializando sentencia
			Statement estatuto = conex.getConnection().createStatement();

			// String con la sentencia a ejecutar
			String sentencia = "UPDATE ventas " + "SET ivaventa = " + vent.getIvaventa() + "," + "total_venta = '"
					+ vent.getTotal_venta() + "'," + "valor_venta = " + vent.getValor_venta() + ""
					+ "WHERE codigo_venta = " + vent.getCodigo_venta() + ";";

			// ejecuta la sentencia
			estatuto.executeUpdate(sentencia);

			// verificación por consola de la sentencia
			System.out.println("Registrado " + sentencia);

			// cerrando sentencia y conexión
			estatuto.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo actualizar  el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	public ArrayList<VentaVO> consultarConsecutivo() {
		// lista que contendra el o los productos obtenidos
		ArrayList<VentaVO> listaventa = new ArrayList<VentaVO>();

		// instancia de la conexión
		Conexion conex = new Conexion();

		try {
			// prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection()
					.prepareStatement("SELECT codigo_venta FROM ventas ORDER BY codigo_venta DESC LIMIT 1;");

			// ejecute la sentencia
			ResultSet res = consulta.executeQuery();

			// cree un objeto para cada encontrado en la base de datos basado en la clase
			// entidad con los datos encontrados
			while (res.next()) {
				VentaVO newventa = new VentaVO();
				newventa.setCodigo_venta(Integer.parseInt(res.getString("codigo_venta")));
				listaventa.add(newventa);
			}

			// cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

		return listaventa;
	}
/*
	public int contadorVentas() {
		// lista que contendra el o los usuarios obtenidos
		int contador = 0;
		// instancia de la conexión
		Conexion conex = new Conexion();
		try { // prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection()
					.prepareStatement("SELECT `AUTO_INCREMENT` " + "FROM INFORMATION_SCHEMA.TABLES "
							+ "WHERE TABLE_SCHEMA = 'tiendalostiburones' " + "AND TABLE_NAME = 'ventas';");
			ResultSet res = consulta.executeQuery(); 
			// cree un objeto para cada encontrado en la base de datos basado
			// en la clase // entidad con los datos encontrados
			while (res.next()) {
				contador = (res.getInt("AUTO_INCREMENT"));
			} // cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();
		} catch (SQLException e) { // si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
		} catch (Exception e) { // si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar contador");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
		return contador;
	}*/
}
