package com.pe.ibm.bean;

public class BusquedaTicket {
	
	private String idticket=null;
	private String fechaInicio=null;
	private String fechaFin=null;
	private String nombrefcr=null;
	private String idproyecto=null;
	private String idgruporesolutor=null;
	private String pluscustomer = null;
	private String clase = null;
	private String leveldesc = null;
	private String idgruporesolutorVip=null;
	private int idsla = 0;
	
	
	
	
	public int getIdsla() {
		return idsla;
	}
	public void setIdsla(int idsla) {
		this.idsla = idsla;
	}
	public String getIdgruporesolutorVip() {
		return idgruporesolutorVip;
	}
	public void setIdgruporesolutorVip(String idgruporesolutorVip) {
		this.idgruporesolutorVip = idgruporesolutorVip;
	}
	public String getClase() {
		return clase;
	}
	public void setClase(String clase) {
		this.clase = clase;
	}
	public String getLeveldesc() {
		return leveldesc;
	}
	public void setLeveldesc(String leveldesc) {
		this.leveldesc = leveldesc;
	}
	public String getIdticket() {
		return idticket;
	}
	public void setIdticket(String idticket) {
		this.idticket = idticket;
	}
	public String getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public String getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(String fechaFin) {
		this.fechaFin = fechaFin;
	}
	public String getNombrefcr() {
		return nombrefcr;
	}
	public void setNombrefcr(String nombrefcr) {
		this.nombrefcr = nombrefcr;
	}
	public String getIdproyecto() {
		return idproyecto;
	}
	public void setIdproyecto(String idproyecto) {
		this.idproyecto = idproyecto;
	}
	public String getIdgruporesolutor() {
		return idgruporesolutor;
	}
	public void setIdgruporesolutor(String idgruporesolutor) {
		this.idgruporesolutor = idgruporesolutor;
	}
	public String getPluscustomer() {
		return pluscustomer;
	}
	public void setPluscustomer(String pluscustomer) {
		this.pluscustomer = pluscustomer;
	}
	@Override
	public String toString() {
		return "BusquedaTicket [idticket=" + idticket + ", fechaInicio=" + fechaInicio + ", fechaFin=" + fechaFin
				+ ", nombrefcr=" + nombrefcr + ", idproyecto=" + idproyecto + ", idgruporesolutor=" + idgruporesolutor
				+ ", pluscustomer=" + pluscustomer + ", clase=" + clase + ", leveldesc=" + leveldesc
				+ ", idgruporesolutorVip=" + idgruporesolutorVip + ", idsla=" + idsla + "]";
	}
	
	

}
