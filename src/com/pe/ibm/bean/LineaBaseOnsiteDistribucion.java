package com.pe.ibm.bean;

public class LineaBaseOnsiteDistribucion extends LineaBaseOnsiteDetalle{

	private int id = 0;
	private String id_resultado_sla = null;
	private int id_lineabase_detalle = 0;
	private int resultado = 0;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getId_resultado_sla() {
		return id_resultado_sla;
	}
	public void setId_resultado_sla(String id_resultado_sla) {
		this.id_resultado_sla = id_resultado_sla;
	}
	public int getId_lineabase_detalle() {
		return id_lineabase_detalle;
	}
	public void setId_lineabase_detalle(int id_lineabase_detalle) {
		this.id_lineabase_detalle = id_lineabase_detalle;
	}
	public int getResultado() {
		return resultado;
	}
	public void setResultado(int resultado) {
		this.resultado = resultado;
	}
	@Override
	public String toString() {
		return "LineaBaseOnsiteDistribucion [id=" + id + ", id_resultado_sla=" + id_resultado_sla
				+ ", id_lineabase_detalle=" + id_lineabase_detalle + ", resultado=" + resultado + "]";
	}
	
	
}
