package com.pe.ibm.bean;

public class BeanBancoClaves {

	private int iIdBancoClaves;
	private String strCliente;
	private String strServidor;
	private String strIp;
	private String strInstancia;
	private String strMandante;
	private String strSisSubSis;
	private String strUsuario;
	private String strContrasena;
	private String strObservaciones;
	
	public BeanBancoClaves() {}

	public int getiIdBancoClaves() {
		return iIdBancoClaves;
	}

	public void setiIdBancoClaves(int iIdBancoClaves) {
		this.iIdBancoClaves = iIdBancoClaves;
	}

	public String getStrCliente() {
		return strCliente;
	}

	public void setStrCliente(String strCliente) {
		this.strCliente = strCliente;
	}

	public String getStrServidor() {
		return strServidor;
	}

	public void setStrServidor(String strServidor) {
		this.strServidor = strServidor;
	}

	public String getStrIp() {
		return strIp;
	}

	public void setStrIp(String strIp) {
		this.strIp = strIp;
	}

	public String getStrInstancia() {
		return strInstancia;
	}

	public void setStrInstancia(String strInstancia) {
		this.strInstancia = strInstancia;
	}

	public String getStrMandante() {
		return strMandante;
	}

	public void setStrMandante(String strMandante) {
		this.strMandante = strMandante;
	}

	public String getStrSisSubSis() {
		return strSisSubSis;
	}

	public void setStrSisSubSis(String strSisSubSis) {
		this.strSisSubSis = strSisSubSis;
	}

	public String getStrUsuario() {
		return strUsuario;
	}

	public void setStrUsuario(String strUsuario) {
		this.strUsuario = strUsuario;
	}

	public String getStrContrasena() {
		return strContrasena;
	}

	public void setStrContrasena(String strContrasena) {
		this.strContrasena = strContrasena;
	}

	public String getStrObservaciones() {
		return strObservaciones;
	}

	public void setStrObservaciones(String strObservaciones) {
		this.strObservaciones = strObservaciones;
	}

	@Override
	public String toString() {
		return "BeanBancoClaves [iIdBancoClaves=" + iIdBancoClaves + ", strCliente=" + strCliente + ", strServidor="
				+ strServidor + ", strIp=" + strIp + ", strInstancia=" + strInstancia + ", strMandante=" + strMandante
				+ ", strSisSubSis=" + strSisSubSis + ", strUsuario=" + strUsuario + ", strContrasena=" + strContrasena
				+ ", strObservaciones=" + strObservaciones + "]";
	}

}
