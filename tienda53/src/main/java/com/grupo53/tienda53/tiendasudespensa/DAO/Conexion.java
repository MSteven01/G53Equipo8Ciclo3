package com.grupo53.tienda53.tiendasudespensa.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
	//Base de datos local
	
	static String nombre_bd = "tiendasudespensa";
	static String usuariobd = "root";
	static String clavebd = "mintic";
	static String url = "jdbc:mysql://127.0.0.1/" + nombre_bd;
	Connection connection = null;

	//Base de datos aws
	/*
	static String nombre_bd = "g53e8";
	static String usuariobd = "admin";
	static String clavebd = "minticroca";
	static String url = "jdbc:mariadb://tiendasgenericasdr-g9-g38-53.czo3ixoe3xoe.us-east-1.rds.amazonaws.com/" + nombre_bd;
	Connection connection = null;
	*/

	public Conexion() {
		try {
			// obtenemos el driver de para mysql
			//---------------------- MariaDB----------------------
			//Class.forName("org.mariadb.jdbc.Driver");
			//---------------------- Mysql------------------------
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			// obtenemos la conexión
			connection = DriverManager.getConnection(url, usuariobd, clavebd);
			//si hay conexión correcta mostrar información en consola
			if (connection != null) {
				System.out.println("Conexión a base de datos " 
			+ nombre_bd + " OK\n");
			}
		
		} catch (SQLException e) {
			//error de la base de datos
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			//error en carga de clases
			System.out.println(e);
		} catch (Exception e) {
			//cualquier otro error
			System.out.println(e);
		}
	}

	/** Permite retornar la conexión */
	public Connection getConnection() {
		return connection;
	}
	
	//cerrando la conexión
	public void desconectar() {
		connection = null;
	}
}



