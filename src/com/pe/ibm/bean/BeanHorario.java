package com.pe.ibm.bean;

public class BeanHorario {

	int iIdHoras;
	String strHoras;
	int iEstado;
	String strUsuario;
	int iTeam;
	
	public BeanHorario(){}
	
	public BeanHorario(int iIdHoras, String strHoras, int iEstado, String strUsuario, int iTeam) {
		super();
		this.iIdHoras = iIdHoras;
		this.strHoras = strHoras;
		this.iEstado = iEstado;
		this.strUsuario = strUsuario;
		this.iTeam = iTeam;
	}
	
	public int getiIdHoras() {
		return iIdHoras;
	}
	public void setiIdHoras(int iIdHoras) {
		this.iIdHoras = iIdHoras;
	}
	public String getStrHoras() {
		return strHoras;
	}
	public void setStrHoras(String strHoras) {
		this.strHoras = strHoras;
	}
	public int getiEstado() {
		return iEstado;
	}
	public void setiEstado(int iEstado) {
		this.iEstado = iEstado;
	}
	public String getStrUsuario() {
		return strUsuario;
	}
	public void setStrUsuario(String strUsuario) {
		this.strUsuario = strUsuario;
	}
	public int getiTeam() {
		return iTeam;
	}
	public void setiTeam(int iTeam) {
		this.iTeam = iTeam;
	}

	@Override
	public String toString() {
		return "BeanHorario [iIdHoras=" + iIdHoras + ", strHoras=" + strHoras + ", iEstado=" + iEstado + ", strUsuario="
				+ strUsuario + ", iTeam=" + iTeam + "]";
	}
	
}
