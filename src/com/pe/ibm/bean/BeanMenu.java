package com.pe.ibm.bean;

public class BeanMenu {
	private String strDescripcion = "";
	private String strUrl = "";
	private String strIconIzq = "";
	private String strIconDer = "";
	private String strNivel = "";
	private String strUsuario = "";
	private int iOrden = 0;
	
	public BeanMenu(){}

	public BeanMenu(String strDescripcion, String strUrl, String strIconIzq, String strIconDer, String strNivel,
			String strUsuario, int iOrden) {
		super();
		this.strDescripcion = strDescripcion;
		this.strUrl = strUrl;
		this.strIconIzq = strIconIzq;
		this.strIconDer = strIconDer;
		this.strNivel = strNivel;
		this.strUsuario = strUsuario;
		this.iOrden = iOrden;
	}

	public String getStrDescripcion() {
		return strDescripcion;
	}

	public void setStrDescripcion(String strDescripcion) {
		this.strDescripcion = strDescripcion;
	}

	public String getStrUrl() {
		return strUrl;
	}

	public void setStrUrl(String strUrl) {
		this.strUrl = strUrl;
	}

	public String getStrIconIzq() {
		return strIconIzq;
	}

	public void setStrIconIzq(String strIconIzq) {
		this.strIconIzq = strIconIzq;
	}

	public String getStrIconDer() {
		return strIconDer;
	}

	public void setStrIconDer(String strIconDer) {
		this.strIconDer = strIconDer;
	}

	public String getstrNivel() {
		return strNivel;
	}

	public void setstrNivel(String strNivel) {
		this.strNivel = strNivel;
	}

	public String getStrUsuario() {
		return strUsuario;
	}

	public void setStrUsuario(String strUsuario) {
		this.strUsuario = strUsuario;
	}

	public int getiOrden() {
		return iOrden;
	}

	public void setiOrden(int iOrden) {
		this.iOrden = iOrden;
	}
	
}
