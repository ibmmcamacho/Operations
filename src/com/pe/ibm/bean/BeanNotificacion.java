package com.pe.ibm.bean;

public class BeanNotificacion {

	int iIdNotificacion;
	String strTitulo;
	String strContenido;
	String strImg;
	String strTipo;
	int iOwner;
	int iEstado;
	int iEnviado;
	String strDateReg;
	String strDateLectura;
	
	public BeanNotificacion(){}

	public BeanNotificacion(int iIdNotificacion, String strTitulo, String strContenido, String strImg, int iOwner,
			int iEstado, int iEnviado, String strDateReg, String strDateLectura) {
		super();
		this.iIdNotificacion = iIdNotificacion;
		this.strTitulo = strTitulo;
		this.strContenido = strContenido;
		this.strImg = strImg;
		this.iOwner = iOwner;
		this.iEstado = iEstado;
		this.iEnviado = iEnviado;
		this.strDateReg = strDateReg;
		this.strDateLectura = strDateLectura;
	}

	public int getiIdNotificacion() {
		return iIdNotificacion;
	}

	public void setiIdNotificacion(int iIdNotificacion) {
		this.iIdNotificacion = iIdNotificacion;
	}

	public String getStrTitulo() {
		return strTitulo;
	}

	public void setStrTitulo(String strTitulo) {
		this.strTitulo = strTitulo;
	}

	public String getStrContenido() {
		return strContenido;
	}

	public void setStrContenido(String strContenido) {
		this.strContenido = strContenido;
	}

	public String getStrImg() {
		return strImg;
	}

	public void setStrImg(String strImg) {
		this.strImg = strImg;
	}

	public String getStrTipo() {
		return strTipo;
	}

	public void setStrTipo(String strTipo) {
		this.strTipo = strTipo;
	}

	public int getiOwner() {
		return iOwner;
	}

	public void setiOwner(int iOwner) {
		this.iOwner = iOwner;
	}

	public int getiEstado() {
		return iEstado;
	}

	public void setiEstado(int iEstado) {
		this.iEstado = iEstado;
	}

	public int getiEnviado() {
		return iEnviado;
	}

	public void setiEnviado(int iEnviado) {
		this.iEnviado = iEnviado;
	}

	public String getStrDateReg() {
		return strDateReg;
	}

	public void setStrDateReg(String strDateReg) {
		this.strDateReg = strDateReg;
	}

	public String getStrDateLectura() {
		return strDateLectura;
	}

	public void setStrDateLectura(String strDateLectura) {
		this.strDateLectura = strDateLectura;
	}

}
