package com.pe.ibm.bean;

public class BeanTeam {

	int iIdTeam;
	String strDescripcion;
	
	public BeanTeam(){}

	public BeanTeam(int iIdTeam, String strDescripcion) {
		super();
		this.iIdTeam = iIdTeam;
		this.strDescripcion = strDescripcion;
	}

	public int getiIdTeam() {
		return iIdTeam;
	}

	public void setiIdTeam(int iIdTeam) {
		this.iIdTeam = iIdTeam;
	}

	public String getStrDescripcion() {
		return strDescripcion;
	}

	public void setStrDescripcion(String strDescripcion) {
		this.strDescripcion = strDescripcion;
	}
	
}
