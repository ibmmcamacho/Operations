package com.pe.ibm.bean;

public class BeanTimeLine {

	int iSumaMinutosInicio;
	int iSumaMinutosTarea;
	String strMensaje;
	String strEtiqueta;
	
	public BeanTimeLine(){}

	public BeanTimeLine(int iSumaMinutosInicio, int iSumaMinutosTarea, String strMensaje, String strEtiqueta) {
		super();
		this.iSumaMinutosInicio = iSumaMinutosInicio;
		this.iSumaMinutosTarea = iSumaMinutosTarea;
		this.strMensaje = strMensaje;
		this.strEtiqueta = strEtiqueta;
	}

	public int getiSumaMinutosInicio() {
		return iSumaMinutosInicio;
	}

	public void setiSumaMinutosInicio(int iSumaMinutosInicio) {
		this.iSumaMinutosInicio = iSumaMinutosInicio;
	}

	public int getiSumaMinutosTarea() {
		return iSumaMinutosTarea;
	}

	public void setiSumaMinutosTarea(int iSumaMinutosTarea) {
		this.iSumaMinutosTarea = iSumaMinutosTarea;
	}

	public String getStrMensaje() {
		return strMensaje;
	}

	public void setStrMensaje(String strMensaje) {
		this.strMensaje = strMensaje;
	}

	public String getStrEtiqueta() {
		return strEtiqueta;
	}

	public void setStrEtiqueta(String strEtiqueta) {
		this.strEtiqueta = strEtiqueta;
	}
	
}