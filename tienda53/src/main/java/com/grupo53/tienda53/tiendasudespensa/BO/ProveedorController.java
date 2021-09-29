package com.grupo53.tienda53.tiendasudespensa.BO;


import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo53.tienda53.tiendasudespensa.DAO.ProveedorDAO;
import com.grupo53.tienda53.tiendasudespensa.DTO.ProveedorVO;




@RestController
public class ProveedorController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrarproveedores")
	public void registrarProveedores(ProveedorVO nombre_proveedor) {
		ProveedorDAO Dao = new ProveedorDAO();
		Dao.registrarProveedor(nombre_proveedor);
	}

	@GetMapping("/consultarproveedores")
	public ArrayList<ProveedorVO> consultarProveedores(int nit_proveedor) {
		ProveedorDAO Dao = new ProveedorDAO();
		return Dao.consultarProveedor(nit_proveedor);
	}

	@GetMapping("/listarproveedores")
	public ArrayList<ProveedorVO> listaDeClientes() {
		ProveedorDAO Dao = new ProveedorDAO();
		return Dao.listaDeProveedores();
	}
	@DeleteMapping("/eliminarproveedores")
	public void eliminarProveedor(Integer nit_proveedor) {
		ProveedorDAO Dao = new ProveedorDAO();
		Dao.eliminarProveedor(nit_proveedor);
	}
	
	@PutMapping("/actualizarproveedores")
	public void actualizarProveedor(ProveedorVO nombre_proveedor) {
		ProveedorDAO Dao = new ProveedorDAO();
		Dao.actualizarProveedor(nombre_proveedor);
	}
	
}

