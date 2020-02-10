package com.pe.ibm.bean;

import java.util.Map;

public class BeanEmpleado {
	
	private int iIdEmpleado = 0;
	private String strIdLogin;
	private String strNombre;
	private String strApPaterno;
	private String strApMaterno;
	private String strModalidad;
	private String strClave;
	private String strArea;
	private String strCargo;
	private String strPerfil;
	private String strTeam;
	private String strEmail;
	private int iTeam = 0;
	private int iModalidad = 0;
	private int iArea = 0;
	private int iCargo = 0;
	private int iPerfil = 0;
	private int iEstado = 0;
	private String strEstado;
	private String strPhoto;
	private String strCodCliente;
	private String strCodCliente2;
	private String strImbrs;
	
	public BeanEmpleado(){}
	
	

	@Override
	public String toString() {
		return "BeanEmpleado [iIdEmpleado=" + iIdEmpleado + ", strIdLogin=" + strIdLogin + ", strNombre=" + strNombre
				+ ", strApPaterno=" + strApPaterno + ", strApMaterno=" + strApMaterno + ", strModalidad=" + strModalidad
				+ ", strClave=" + strClave + ", strArea=" + strArea + ", strCargo=" + strCargo + ", strPerfil="
				+ strPerfil + ", strTeam=" + strTeam + ", strEmail=" + strEmail + ", iTeam=" + iTeam + ", iModalidad="
				+ iModalidad + ", iArea=" + iArea + ", iCargo=" + iCargo + ", iPerfil=" + iPerfil + ", iEstado="
				+ iEstado + ", strEstado=" + strEstado + ", strPhoto=" + strPhoto + ", strCodCliente=" + strCodCliente
				+ ", strCodCliente2=" + strCodCliente2 + "]";
	}



	public BeanEmpleado(int iIdEmpleado, String strIdLogin, String strNombre, String strApPaterno, String strApMaterno,
			String strModalidad, String strClave, String strArea, String strCargo, String strPerfil, String strTeam,
			String strEmail, int iTeam, int iModalidad, int iArea, int iCargo, int iPerfil, int iEstado,
			String strEstado, String strPhoto, String strCodCliente, String strImbrs) {
		super();
		this.iIdEmpleado = iIdEmpleado;
		this.strIdLogin = strIdLogin;
		this.strNombre = strNombre;
		this.strApPaterno = strApPaterno;
		this.strApMaterno = strApMaterno;
		this.strModalidad = strModalidad;
		this.strClave = strClave;
		this.strArea = strArea;
		this.strCargo = strCargo;
		this.strPerfil = strPerfil;
		this.strTeam = strTeam;
		this.strEmail = strEmail;
		this.iTeam = iTeam;
		this.iModalidad = iModalidad;
		this.iArea = iArea;
		this.iCargo = iCargo;
		this.iPerfil = iPerfil;
		this.iEstado = iEstado;
		this.strEstado = strEstado;
		this.strPhoto = strPhoto;
		this.strCodCliente = strCodCliente;
		this.strImbrs = strImbrs;
	}

	public int getiIdEmpleado() {
		return iIdEmpleado;
	}

	public void setiIdEmpleado(int iIdEmpleado) {
		this.iIdEmpleado = iIdEmpleado;
	}

	public String getStrIdLogin() {
		return strIdLogin;
	}

	public void setStrIdLogin(String strIdLogin) {
		this.strIdLogin = strIdLogin;
	}

	public String getStrNombre() {
		return strNombre;
	}

	public void setStrNombre(String strNombre) {
		this.strNombre = strNombre;
	}

	public String getStrApPaterno() {
		return strApPaterno;
	}

	public void setStrApPaterno(String strApPaterno) {
		this.strApPaterno = strApPaterno;
	}

	public String getStrApMaterno() {
		return strApMaterno;
	}

	public void setStrApMaterno(String strApMaterno) {
		this.strApMaterno = strApMaterno;
	}

	public String getStrModalidad() {
		return strModalidad;
	}

	public void setStrModalidad(String strModalidad) {
		this.strModalidad = strModalidad;
	}

	public String getStrClave() {
		return strClave;
	}

	public void setStrClave(String strClave) {
		this.strClave = strClave;
	}

	public String getStrArea() {
		return strArea;
	}

	public void setStrArea(String strArea) {
		this.strArea = strArea;
	}

	public String getStrCargo() {
		return strCargo;
	}

	public void setStrCargo(String strCargo) {
		this.strCargo = strCargo;
	}

	public String getStrPerfil() {
		return strPerfil;
	}

	public void setStrPerfil(String strPerfil) {
		this.strPerfil = strPerfil;
	}

	public String getStrTeam() {
		return strTeam;
	}

	public void setStrTeam(String strTeam) {
		this.strTeam = strTeam;
	}

	public String getStrEmail() {
		return strEmail;
	}

	public void setStrEmail(String strEmail) {
		this.strEmail = strEmail;
	}

	public int getiTeam() {
		return iTeam;
	}

	public void setiTeam(int iTeam) {
		this.iTeam = iTeam;
	}

	public int getiModalidad() {
		return iModalidad;
	}

	public void setiModalidad(int iModalidad) {
		this.iModalidad = iModalidad;
	}

	public int getiArea() {
		return iArea;
	}

	public void setiArea(int iArea) {
		this.iArea = iArea;
	}

	public int getiCargo() {
		return iCargo;
	}

	public void setiCargo(int iCargo) {
		this.iCargo = iCargo;
	}

	public int getiPerfil() {
		return iPerfil;
	}

	public void setiPerfil(int iPerfil) {
		this.iPerfil = iPerfil;
	}

	public int getiEstado() {
		return iEstado;
	}

	public void setiEstado(int iEstado) {
		this.iEstado = iEstado;
	}

	public String getStrEstado() {
		return strEstado;
	}

	public void setStrEstado(String strEstado) {
		this.strEstado = strEstado;
	}

	public String getStrPhoto() {
		return strPhoto;
	}

	public void setStrPhoto(String strPhoto) {
		this.strPhoto = strPhoto;
	}

	public String getStrCodCliente() {
		return strCodCliente;
	}

	public void setStrCodCliente(String strCodCliente) {
		this.strCodCliente = strCodCliente;
	}

	public String getStrCodCliente2() {
		return strCodCliente2;
	}

	public void setStrCodCliente2(String strCodCliente2) {
		this.strCodCliente2 = strCodCliente2;
	}



	public String getStrImbrs() {
		return strImbrs;
	}



	public void setStrImbrs(String strImbrs) {
		this.strImbrs = strImbrs;
	}
}