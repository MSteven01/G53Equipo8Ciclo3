package com.grupo53.tienda53.tiendasudespensa.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo53.tienda53.tiendasudespensa.DAO.ReportesDAO;
import com.grupo53.tienda53.tiendasudespensa.DTO.ReportesVO;

@RestController
public class ReportesController {

	@GetMapping("/listarreportes")
	public ArrayList<ReportesVO> reporteDeVentas() {
		ReportesDAO Dao = new ReportesDAO();
		return Dao.reporteDeVentas();

	}
}
