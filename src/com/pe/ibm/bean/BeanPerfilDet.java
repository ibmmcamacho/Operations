package com.pe.ibm.bean;

public class BeanPerfilDet {

	

	int iIdPerfilDet;
	int IdPerfil;
	String strDescripcion;
	String url;
	String iconizq;
	String iconder;
	String nivel;
	int orden;
	String datareg;
	String usermod;
	
	
	public BeanPerfilDet(){}
	
	public BeanPerfilDet(int iIdPerfilDet, int idPerfil, String strDescripcion, String url, String iconizq,
			String iconder, String nivel, int orden, String datareg, String usermod) {
		super();
		this.iIdPerfilDet = iIdPerfilDet;
		this.IdPerfil = idPerfil;
		this.strDescripcion = strDescripcion;
		this.url = url;
		this.iconizq = iconizq;
		this.iconder = iconder;
		this.nivel = nivel;
		this.orden = orden;
		this.datareg = datareg;
		this.usermod = usermod;
	}
	
	public int getiIdPerfilDet() {
		return iIdPerfilDet;
	}
	public void setiIdPerfilDet(int iIdPerfilDet) {
		this.iIdPerfilDet = iIdPerfilDet;
	}
	public int getIdPerfil() {
		return IdPerfil;
	}
	public void setIdPerfil(int idPerfil) {
		IdPerfil = idPerfil;
	}
	public String getStrDescripcion() {
		return strDescripcion;
	}
	public void setStrDescripcion(String strDescripcion) {
		this.strDescripcion = strDescripcion;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getIconizq() {
		return iconizq;
	}
	public void setIconizq(String iconizq) {
		this.iconizq = iconizq;
	}
	public String getIconder() {
		return iconder;
	}
	public void setIconder(String iconder) {
		this.iconder = iconder;
	}
	public String getNivel() {
		return nivel;
	}
	public void setNivel(String nivel) {
		this.nivel = nivel;
	}
	public int getOrden() {
		return orden;
	}
	public void setOrden(int orden) {
		this.orden = orden;
	}
	public String getDatareg() {
		return datareg;
	}
	public void setDatareg(String datareg) {
		this.datareg = datareg;
	}
	public String getUsermod() {
		return usermod;
	}
	public void setUsermod(String usermod) {
		this.usermod = usermod;
	}

	
	
	
	
	
}
