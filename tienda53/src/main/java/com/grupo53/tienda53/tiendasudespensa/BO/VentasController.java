package com.grupo53.tienda53.tiendasudespensa.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo53.tienda53.tiendasudespensa.DAO.ClienteDAO;
import com.grupo53.tienda53.tiendasudespensa.DAO.VentaDAO;
import com.grupo53.tienda53.tiendasudespensa.DTO.ClienteVO;
import com.grupo53.tienda53.tiendasudespensa.DTO.VentaVO;

@RestController
public class VentasController {
	
	
		@PostMapping("/registrarventa")
		public void registrarVenta(VentaVO ventas) {
			VentaDAO Dao = new VentaDAO();
			Dao.registrarVenta(ventas);
		}

		@GetMapping("/consultarventacliente")
		public ArrayList<ClienteVO> consultarCliente(Integer code) {
			ClienteDAO Dao = new ClienteDAO();
			return Dao.consultarCliente(code);
		}

		@GetMapping("/listarventas")
		public ArrayList<VentaVO> listaDeVenta() {
			VentaDAO Dao = new VentaDAO();
			return Dao.listaDeVentas();
		
		}
}
		/*	
			@DeleteMapping("/eliminarproducto")
		public void eliminarProducto(Integer code) {
			ProductoDAO Dao = new ProductoDAO();
			Dao.eliminarProducto(code);
		}
		
		@DeleteMapping("/eliminartodoproducto")
		public void eliminarTodoProducto() {
			ProductoDAO Dao = new ProductoDAO();
			Dao.eliminarTodoProducto();
		}
		
		@PutMapping("/actualizarproducto")
		public void actualizarProducto(ProductoVO product) {
			ProductoDAO Dao = new ProductoDAO();
			Dao.actualizarProducto(product);
		}
	}
	*/

