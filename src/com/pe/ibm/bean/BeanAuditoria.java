package com.pe.ibm.bean;

public class BeanAuditoria {
	
	private String hostname = "";
	private String url = "";
	private String ip = "";
	private String so = "";
	private String browser = "";
	private String usuario = "";
	private int idUsuario = 0;
	private String modulo = "";
	private String accion = "";
	private String resultado = "";
	private String bean = "";
	
	public BeanAuditoria() {}

	public String getHostname() {
		return hostname;
	}

	public void setHostname(String hostname) {
		this.hostname = hostname;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getSo() {
		return so;
	}

	public void setSo(String so) {
		this.so = so;
	}

	public String getBrowser() {
		return browser;
	}

	public void setBrowser(String browser) {
		this.browser = browser;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getModulo() {
		return modulo;
	}

	public void setModulo(String modulo) {
		this.modulo = modulo;
	}

	public String getAccion() {
		return accion;
	}

	public void setAccion(String accion) {
		this.accion = accion;
	}

	public String getResultado() {
		return resultado;
	}

	public void setResultado(String resultado) {
		this.resultado = resultado;
	}

	public String getBean() {
		return bean;
	}

	public void setBean(String bean) {
		this.bean = bean;
	}

	@Override
	public String toString() {
		return "BeanAuditoria [hostname=" + hostname + ", url=" + url + ", ip=" + ip + ", so=" + so + ", browser="
				+ browser + ", usuario=" + usuario + ", idUsuario=" + idUsuario + ", modulo=" + modulo + ", accion="
				+ accion + ", resultado=" + resultado + ", bean=" + bean + "]";
	}

}
