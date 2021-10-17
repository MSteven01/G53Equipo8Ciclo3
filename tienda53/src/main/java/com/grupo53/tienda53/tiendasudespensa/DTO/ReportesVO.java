package com.grupo53.tienda53.tiendasudespensa.DTO;

import java.io.Serializable;

public class ReportesVO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer cedula_cliente;
	private String nombre_cliente;
	private Double valor_venta;
	private Double valor_total_venta;
	
	/**
	 * @return the valor_total_venta
	 */
	public Double getValor_total_venta() {
		return valor_total_venta;
	}
	/**
	 * @param valor_total_venta the valor_total_venta to set
	 */
	public void setValor_total_venta(Double valor_total_venta) {
		this.valor_total_venta = valor_total_venta;
	}
	/**
	 * @return the cedula_cliente
	 */
	public Integer getCedula_cliente() {
		return cedula_cliente;
	}
	/**
	 * @param cedula_cliente the cedula_cliente to set
	 */
	public void setCedula_cliente(Integer cedula_cliente) {
		this.cedula_cliente = cedula_cliente;
	}
	/**
	 * @return the nombre_cliente
	 */
	public String getNombre_cliente() {
		return nombre_cliente;
	}
	/**
	 * @param nombre_cliente the nombre_cliente to set
	 */
	public void setNombre_cliente(String nombre_cliente) {
		this.nombre_cliente = nombre_cliente;
	}

	/**
	 * @return the valor_venta
	 */
	public Double getValor_venta() {
		return valor_venta;
	}
	/**
	 * @param valor_venta the valor_venta to set
	 */
	public void setValor_venta(Double valor_venta) {
		this.valor_venta = valor_venta;
	}
	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
