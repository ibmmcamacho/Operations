package com.pe.ibm.bean;

public class BeanOptions {
	int iIdOption;
	String strDescripcion;
	String strValor1;
	String strValor2;
	String strValor3;
	int iEstado;
	int iTeam;
	String strTipo;
	String strUser;
	int iValor1;
	
	public BeanOptions(){}

	public BeanOptions(int iIdOption, String strDescripcion, String strValor1, String strValor2, String strValor3,
			int iEstado, int iTeam, String strTipo, String strUser) {
		super();
		this.iIdOption = iIdOption;
		this.strDescripcion = strDescripcion;
		this.strValor1 = strValor1;
		this.strValor2 = strValor2;
		this.strValor3 = strValor3;
		this.iEstado = iEstado;
		this.iTeam = iTeam;
		this.strTipo = strTipo;
		this.strUser = strUser;
	}

	public int getiIdOption() {
		return iIdOption;
	}

	public void setiIdOption(int iIdOption) {
		this.iIdOption = iIdOption;
	}

	public String getStrDescripcion() {
		return strDescripcion;
	}

	public void setStrDescripcion(String strDescripcion) {
		this.strDescripcion = strDescripcion;
	}

	public String getStrValor1() {
		return strValor1;
	}

	public void setStrValor1(String strValor1) {
		this.strValor1 = strValor1;
	}

	public String getStrValor2() {
		return strValor2;
	}

	public void setStrValor2(String strValor2) {
		this.strValor2 = strValor2;
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

	public String getStrTipo() {
		return strTipo;
	}

	public void setStrTipo(String strTipo) {
		this.strTipo = strTipo;
	}

	public String getStrUser() {
		return strUser;
	}

	public void setStrUser(String strUser) {
		this.strUser = strUser;
	}

	public String getStrValor3() {
		return strValor3;
	}

	public void setStrValor3(String strValor3) {
		this.strValor3 = strValor3;
	}

	public int getiValor1() {
		return iValor1;
	}

	public void setiValor1(int iValor1) {
		this.iValor1 = iValor1;
	}
	
}
