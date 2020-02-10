package com.pe.ibm.bean;

public class LineaBaseOnsiteDetalle {
	
	private int id = 0;
	private int id_sla = 0;
	private String descripcion = null;
	private String formula = null;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_sla() {
		return id_sla;
	}
	public void setId_sla(int id_sla) {
		this.id_sla = id_sla;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getFormula() {
		return formula;
	}
	public void setFormula(String formula) {
		this.formula = formula;
	}
	@Override
	public String toString() {
		return "LineaBaseOnsiteDetalle [id=" + id + ", id_sla=" + id_sla + ", descripcion=" + descripcion + ", formula="
				+ formula + "]";
	}
	
	

}
