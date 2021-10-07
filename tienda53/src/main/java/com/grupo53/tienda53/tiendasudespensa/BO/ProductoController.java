package com.grupo53.tienda53.tiendasudespensa.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo53.tienda53.tiendasudespensa.DAO.ProductoDAO;
import com.grupo53.tienda53.tiendasudespensa.DTO.ProductoVO;


@RestController
public class ProductoController {
	@PostMapping("/registrarproducto")
	public void registrarProducto(ProductoVO product) {
		ProductoDAO Dao = new ProductoDAO();
		Dao.registrarProducto(product);
	}

	@GetMapping("/consultarproducto")
	public ArrayList<ProductoVO> consultarProducto(Integer code) {
		ProductoDAO Dao = new ProductoDAO();
		return Dao.consultarProducto(code);
	}

	@GetMapping("/listarproductos")
	public ArrayList<ProductoVO> listaDeProductos() {
		ProductoDAO Dao = new ProductoDAO();
		return Dao.listaDeProductos();
	}
	
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
