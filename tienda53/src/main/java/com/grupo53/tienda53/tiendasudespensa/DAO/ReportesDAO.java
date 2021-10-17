package com.grupo53.tienda53.tiendasudespensa.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.grupo53.tienda53.tiendasudespensa.DTO.ReportesVO;
public class ReportesDAO {

	public ArrayList<ReportesVO> reporteDeVentas() {
		// lista que contendra el o los productos obtenidos
		ArrayList<ReportesVO> listaventa = new ArrayList<ReportesVO>();

		// instancia de la conexión
		Conexion conex = new Conexion();

		try {
			// prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection().prepareStatement("select cedula_cliente, nombre_cliente,(SELECT SUM(valor_venta) FROM ventas WHERE ventas.cedula_cliente=clientes.cedula_cliente) AS valor_venta, (SELECT SUM(valor_venta) FROM ventas) AS valor_total_venta FROM clientes;");

			// ejecute la sentencia
			ResultSet res = consulta.executeQuery();

			// cree un objeto para cada encontrado en la base de datos basado en la clase
			// entidad con los datos encontrados
			while (res.next()) {
				ReportesVO newventa = new ReportesVO();
				newventa.setCedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
				newventa.setNombre_cliente(res.getString("nombre_cliente"));
				newventa.setValor_venta(Double.parseDouble(res.getString("valor_venta")));
				newventa.setValor_total_venta(Double.parseDouble(res.getString("valor_total_venta")));
				

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

}
