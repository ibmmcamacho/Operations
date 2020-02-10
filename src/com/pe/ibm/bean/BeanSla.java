package com.pe.ibm.bean;

import java.sql.Time;
import java.util.Date;

public class BeanSla {
	
	private String fecha;
	private String hasta;
	private String ejecutado_man = "";
	private String tiempo_man = "";
    private String total_man;
    private String tickets_man = "";
    private String porcentaje_man = "";
    private String resultado_man = "";
    private String ejecutado_tar = "";
	private String tiempo_tar = "";
    private String total_tar;
    private String tickets_tar = "";
    private String porcentaje_tar = "";
    private String resultado_tar = "";
	@Override
	public String toString() {
		return "BeanSla [fecha=" + fecha + ", hasta=" + hasta + ", ejecutado_man=" + ejecutado_man + ", tiempo_man="
				+ tiempo_man + ", total_man=" + total_man + ", tickets_man=" + tickets_man + ", porcentaje_man="
				+ porcentaje_man + ", resultado_man=" + resultado_man + ", ejecutado_tar=" + ejecutado_tar
				+ ", tiempo_tar=" + tiempo_tar + ", total_tar=" + total_tar + ", tickets_tar=" + tickets_tar
				+ ", porcentaje_tar=" + porcentaje_tar + ", resultado_tar=" + resultado_tar + "]";
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getHasta() {
		return hasta;
	}
	public void setHasta(String hasta) {
		this.hasta = hasta;
	}
	public String getEjecutado_man() {
		return ejecutado_man;
	}
	public void setEjecutado_man(String ejecutado_man) {
		this.ejecutado_man = ejecutado_man;
	}
	public String getTiempo_man() {
		return tiempo_man;
	}
	public void setTiempo_man(String tiempo_man) {
		this.tiempo_man = tiempo_man;
	}
	public String getTotal_man() {
		return total_man;
	}
	public void setTotal_man(String total_man) {
		this.total_man = total_man;
	}
	public String getTickets_man() {
		return tickets_man;
	}
	public void setTickets_man(String tickets_man) {
		this.tickets_man = tickets_man;
	}
	public String getPorcentaje_man() {
		return porcentaje_man;
	}
	public void setPorcentaje_man(String porcentaje_man) {
		this.porcentaje_man = porcentaje_man;
	}
	public String getResultado_man() {
		return resultado_man;
	}
	public void setResultado_man(String resultado_man) {
		this.resultado_man = resultado_man;
	}
	public String getEjecutado_tar() {
		return ejecutado_tar;
	}
	public void setEjecutado_tar(String ejecutado_tar) {
		this.ejecutado_tar = ejecutado_tar;
	}
	public String getTiempo_tar() {
		return tiempo_tar;
	}
	public void setTiempo_tar(String tiempo_tar) {
		this.tiempo_tar = tiempo_tar;
	}
	public String getTotal_tar() {
		return total_tar;
	}
	public void setTotal_tar(String total_tar) {
		this.total_tar = total_tar;
	}
	public String getTickets_tar() {
		return tickets_tar;
	}
	public void setTickets_tar(String tickets_tar) {
		this.tickets_tar = tickets_tar;
	}
	public String getPorcentaje_tar() {
		return porcentaje_tar;
	}
	public void setPorcentaje_tar(String porcentaje_tar) {
		this.porcentaje_tar = porcentaje_tar;
	}
	public String getResultado_tar() {
		return resultado_tar;
	}
	public void setResultado_tar(String resultado_tar) {
		this.resultado_tar = resultado_tar;
	}
	
}

