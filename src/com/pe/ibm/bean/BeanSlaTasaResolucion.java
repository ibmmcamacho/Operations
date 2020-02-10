package com.pe.ibm.bean;

public class BeanSlaTasaResolucion {
	private String strFecha = "";
	private int totalTicket = 0;
	private int ticketPrimerNivel = 0;
	private int ticketOtrosNivel = 0;
	private double tasaResolucion = 0.0;
	private String fechaPeriodo = "";
	private int idProyecto = 0;
	
	
	public int getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(int idProyecto) {
		this.idProyecto = idProyecto;
	}
	public String getFechaPeriodo() {
		return fechaPeriodo;
	}
	public void setFechaPeriodo(String fechaPeriodo) {
		this.fechaPeriodo = fechaPeriodo;
	}
	public String getStrFecha() {
		return strFecha;
	}
	public void setStrFecha(String strFecha) {
		this.strFecha = strFecha;
	}
	public int getTotalTicket() {
		return totalTicket;
	}
	public void setTotalTicket(int totalTicket) {
		this.totalTicket = totalTicket;
	}
	public int getTicketPrimerNivel() {
		return ticketPrimerNivel;
	}
	public void setTicketPrimerNivel(int ticketPrimerNivel) {
		this.ticketPrimerNivel = ticketPrimerNivel;
	}
	public int getTicketOtrosNivel() {
		this.ticketOtrosNivel = this.totalTicket - this.ticketPrimerNivel;
		return ticketOtrosNivel;
	}
	public void setTicketOtrosNivel(int ticketOtrosNivel) {
		this.ticketOtrosNivel = ticketOtrosNivel;
	}
	public double getTasaResolucion() {
		this.tasaResolucion = (double) this.ticketPrimerNivel / (double) this.totalTicket;
		return tasaResolucion;
	}
	public void setTasaResolucion(double tasaResolucion) {
		this.tasaResolucion = tasaResolucion;
	}
	
	
	
	

}
