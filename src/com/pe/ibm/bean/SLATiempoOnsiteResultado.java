package com.pe.ibm.bean;

import com.pe.ibm.bean.SLATiempoOnsite;
public class SLATiempoOnsiteResultado extends SLATiempoOnsite{
	
	private int id = 0;
	private String id_sla_resultado_mensual = null;
	private int vip_cant = 0;
	private int vip_en_sla = 0;
	private double vip_res_sla = 0;
	private int alta_cant = 0;
	private int alta_en_sla = 0;
	private double alta_res_sla = 0;
	private int media_cant = 0;
	private int media_en_sla = 0;
	private double mediq_res_sla = 0;
	private int baja_cant = 0;
	private int baja_en_sla = 0;
	private double baja_res_sla = 0;
	private int ptrabajo_cant = 0;
	private int ptrabajo_en_sla = 0;
	private double ptrabajo_res_sla = 0;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getId_sla_resultado_mensual() {
		return id_sla_resultado_mensual;
	}
	public void setId_sla_resultado_mensual(String id_sla_resultado_mensual) {
		this.id_sla_resultado_mensual = id_sla_resultado_mensual;
	}
	public int getVip_cant() {
		return vip_cant;
	}
	public void setVip_cant(int vip_cant) {
		this.vip_cant = vip_cant;
	}
	public int getVip_en_sla() {
		return vip_en_sla;
	}
	public void setVip_en_sla(int vip_en_sla) {
		this.vip_en_sla = vip_en_sla;
	}
	public double getVip_res_sla() {
		return vip_res_sla;
	}
	public void setVip_res_sla(double vip_res_sla) {
		this.vip_res_sla = vip_res_sla;
	}
	public int getAlta_cant() {
		return alta_cant;
	}
	public void setAlta_cant(int alta_cant) {
		this.alta_cant = alta_cant;
	}
	public int getAlta_en_sla() {
		return alta_en_sla;
	}
	public void setAlta_en_sla(int alta_en_sla) {
		this.alta_en_sla = alta_en_sla;
	}
	public double getAlta_res_sla() {
		return alta_res_sla;
	}
	public void setAlta_res_sla(double alta_res_sla) {
		this.alta_res_sla = alta_res_sla;
	}
	public int getMedia_cant() {
		return media_cant;
	}
	public void setMedia_cant(int media_cant) {
		this.media_cant = media_cant;
	}
	public int getMedia_en_sla() {
		return media_en_sla;
	}
	public void setMedia_en_sla(int media_en_sla) {
		this.media_en_sla = media_en_sla;
	}
	public double getMediq_res_sla() {
		return mediq_res_sla;
	}
	public void setMediq_res_sla(double mediq_res_sla) {
		this.mediq_res_sla = mediq_res_sla;
	}
	public int getBaja_cant() {
		return baja_cant;
	}
	public void setBaja_cant(int baja_cant) {
		this.baja_cant = baja_cant;
	}
	public int getBaja_en_sla() {
		return baja_en_sla;
	}
	public void setBaja_en_sla(int baja_en_sla) {
		this.baja_en_sla = baja_en_sla;
	}
	public double getBaja_res_sla() {
		return baja_res_sla;
	}
	public void setBaja_res_sla(double baja_res_sla) {
		this.baja_res_sla = baja_res_sla;
	}
	public int getPtrabajo_cant() {
		return ptrabajo_cant;
	}
	public void setPtrabajo_cant(int ptrabajo_cant) {
		this.ptrabajo_cant = ptrabajo_cant;
	}
	public int getPtrabajo_en_sla() {
		return ptrabajo_en_sla;
	}
	public void setPtrabajo_en_sla(int ptrabajo_en_sla) {
		this.ptrabajo_en_sla = ptrabajo_en_sla;
	}
	public double getPtrabajo_res_sla() {
		return ptrabajo_res_sla;
	}
	public void setPtrabajo_res_sla(double ptrabajo_res_sla) {
		this.ptrabajo_res_sla = ptrabajo_res_sla;
	}
	@Override
	public String toString() {
		return "SLATiempoOnsiteResultado [id=" + id + ", id_sla_resultado_mensual=" + id_sla_resultado_mensual
				+ ", vip_cant=" + vip_cant + ", vip_en_sla=" + vip_en_sla + ", vip_res_sla=" + vip_res_sla
				+ ", alta_cant=" + alta_cant + ", alta_en_sla=" + alta_en_sla + ", alta_res_sla=" + alta_res_sla
				+ ", media_cant=" + media_cant + ", media_en_sla=" + media_en_sla + ", mediq_res_sla=" + mediq_res_sla
				+ ", baja_cant=" + baja_cant + ", baja_en_sla=" + baja_en_sla + ", baja_res_sla=" + baja_res_sla
				+ ", ptrabajo_cant=" + ptrabajo_cant + ", ptrabajo_en_sla=" + ptrabajo_en_sla + ", ptrabajo_res_sla="
				+ ptrabajo_res_sla + "]";
	}
	
	
	
}
