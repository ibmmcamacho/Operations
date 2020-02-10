package com.pe.ibm.bean;

public class BeanBusqueda {
	

	public String fechaInicio;
	public String fechaFin;
	public String id_sla;
	public String nombre;
	private String idticket;
	private String nombrefcr;
	private String idproyecto;
	private String idgruporesolutor;
	private String pluscustomer ;
	private String clase ;
	private String leveldesc ;
	private String idgruporesolutorVip;
	private int idsla = 0;
	private int semana;
	
	
	public int getSemana() {
		return semana;
	}
	public void setSemana(int semana) {
		this.semana = semana;
	}
	public String getIdticket() {
		return idticket;
	}
	public void setIdticket(String idticket) {
		this.idticket = idticket;
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
	public String getIdgruporesolutorVip() {
		return idgruporesolutorVip;
	}
	public void setIdgruporesolutorVip(String idgruporesolutorVip) {
		this.idgruporesolutorVip = idgruporesolutorVip;
	}
	public int getIdsla() {
		return idsla;
	}
	public void setIdsla(int idsla) {
		this.idsla = idsla;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
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
	public String getId_sla() {
		return id_sla;
	}
	public void setId_sla(String id_sla) {
		this.id_sla = id_sla;
	}
	@Override
	public String toString() {
		return "BeanBusqueda [fechaInicio=" + fechaInicio + ", fechaFin=" + fechaFin + ", id_sla=" + id_sla
				+ ", nombre=" + nombre + ", idticket=" + idticket + ", nombrefcr=" + nombrefcr + ", idproyecto="
				+ idproyecto + ", idgruporesolutor=" + idgruporesolutor + ", pluscustomer=" + pluscustomer + ", clase="
				+ clase + ", leveldesc=" + leveldesc + ", idgruporesolutorVip=" + idgruporesolutorVip + ", idsla="
				+ idsla + ", semana=" + semana + "]";
	}
	
	
	

}
