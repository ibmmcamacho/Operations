package com.pe.ibm.bean;

public class BeanPerfil {

	int iIdPerfil;
	String strDescripcion;
	int iEstado;
	int iTeam;
	String strUser;
	
	public BeanPerfil(){}

	public BeanPerfil(int iIdPerfil, String strDescripcion, int iEstado, int iTeam, String strUser) {
		super();
		this.iIdPerfil = iIdPerfil;
		this.strDescripcion = strDescripcion;
		this.iEstado = iEstado;
		this.iTeam = iTeam;
		this.strUser = strUser;
	}

	public int getiIdPerfil() {
		return iIdPerfil;
	}

	public void setiIdPerfil(int iIdPerfil) {
		this.iIdPerfil = iIdPerfil;
	}

	public String getStrDescripcion() {
		return strDescripcion;
	}

	public void setStrDescripcion(String strDescripcion) {
		this.strDescripcion = strDescripcion;
	}

	public int getiEstado() {
		return iEstado;
	}

	public void setiEstado(int iEstado) {
		this.iEstado = iEstado;
	}

	public int getiTeam() {
		return iTeam;
	}

	public void setiTeam(int iTeam) {
		this.iTeam = iTeam;
	}

	public String getStrUser() {
		return strUser;
	}

	public void setStrUser(String strUser) {
		this.strUser = strUser;
	}

}
