package com.pe.ibm.bean;

import java.util.Date;

public class BeanSlaMDA {
	
	private int id = 0;
	private int idProyecto = 0;
	private Date fechaSla = null;
	private int cont = 0;
	private int ab = 0;
	private int totLlam= 0;
	private double tasAb = 0.0;
	private int promLlam;
	private int correoRecibido = -1;
	private String abUm = "";
	private double tasResp = 0.0;
	private String periodo = "";
	private String strFechaSla = "";
	private int idColor = 0;
	private int totalTicket = 0;
	private int ticketPrimerNivel = 0;
	private int ticketOtroNivel = 0;
	private double tasaResolucion = 0.0;
	
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
	public int getTicketOtroNivel() {
		return ticketOtroNivel;
	}
	public void setTicketOtroNivel(int ticketOtroNivel) {
		this.ticketOtroNivel = ticketOtroNivel;
	}
	public double getTasaResolucion() {
		return tasaResolucion;
	}
	public void setTasaResolucion(double tasaResolucion) {
		this.tasaResolucion = tasaResolucion;
	}
	public int getPromLlam() {
		return promLlam;
	}
	public void setPromLlam(int promLlam) {
		this.promLlam = promLlam;
	}
	public String getStrFechaSla() {
		return strFechaSla;
	}
	public void setStrFechaSla(String strFechaSla) {
		this.strFechaSla = strFechaSla;
	}
	public double getTasResp() {
		if(this.totLlam + this.correoRecibido > 0) {
			this.tasResp = (double)(this.cont + this.correoRecibido)/(double)(this.cont+this.ab+this.correoRecibido);	
		}

		return tasResp;
	}
	public void setTasResp(double tasResp) {
		this.tasResp = tasResp;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(int idProyecto) {
		this.idProyecto = idProyecto;
	}
	public Date getFechaSla() {
		return fechaSla;
	}
	public void setFechaSla(Date fechaSla) {
		this.fechaSla = fechaSla;
	}
	public int getCont() {
		return cont;
	}
	public void setCont(int cont) {
		this.cont = cont;
	}
	public int getAb() {
		return ab;
	}
	public void setAb(int ab) {
		this.ab = ab;
	}
	public int getTotLlam() {
		return totLlam;
	}
	public void setTotLlam(int totLlam) {
		this.totLlam = totLlam;
	}
	public double getTasAb() {
		return tasAb;
	}
	public void setTasAb(double tasAb) {
		this.tasAb = tasAb;
	}
	
	public int getCorreoRecibido() {
		return correoRecibido;
	}
	public void setCorreoRecibido(int correoRecibido) {
		this.correoRecibido = correoRecibido;
	}
	public String getAbUm() {
		return abUm;
	}
	public void setAbUm(String abUm) {
		this.abUm = abUm;
	}
	public String getPeriodo() {
		return periodo;
	}
	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}
	public int getIdColor() {
		return idColor;
	}
	public void setIdColor(int idColor) {
		this.idColor = idColor;
	}
	@Override
	public String toString() {
		return "BeanSlaMDA [id=" + id + ", idProyecto=" + idProyecto + ", fechaSla=" + fechaSla + ", cont=" + cont
				+ ", ab=" + ab + ", totLlam=" + totLlam + ", tasAb=" + tasAb + ", promLlam=" + promLlam
				+ ", correoRecibido=" + correoRecibido + ", abUm=" + abUm + ", tasResp=" + tasResp + ", periodo="
				+ periodo + ", strFechaSla=" + strFechaSla + ", idColor=" + idColor + ", totalTicket=" + totalTicket
				+ ", ticketPrimerNivel=" + ticketPrimerNivel + ", ticketOtroNivel=" + ticketOtroNivel
				+ ", tasaResolucion=" + tasaResolucion + "]";
	}
	
	
	



}
