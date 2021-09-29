package com.grupo53.tienda53.tiendasudespensa.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo53.tienda53.tiendasudespensa.DAO.ClienteDAO;
import com.grupo53.tienda53.tiendasudespensa.DTO.ClienteVO;


@RestController
public class ClienteController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrarclientes")
	public void registrarClientes(ClienteVO nombre_cliente) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.registrarCliente(nombre_cliente);
	}

	@GetMapping("/consultarcliente")
	public ArrayList<ClienteVO> consultarClientes(int cedula_cliente) {
		ClienteDAO Dao = new ClienteDAO();
		return Dao.consultarCliente(cedula_cliente);
	}

	@GetMapping("/listarclientes")
	public ArrayList<ClienteVO> listaDeClientes() {
		ClienteDAO Dao = new ClienteDAO();
		return Dao.listaDeClientes();
	}
	@DeleteMapping("/eliminarclientes")
	public void eliminarCliente(Integer cedula_cliente) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.eliminarCliente(cedula_cliente);
	}
	
	@PutMapping("/actualizarcliente")
	public void actualizarCliente(ClienteVO nombre_cliente) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.actualizarCliente(nombre_cliente);
	}
	
	

}