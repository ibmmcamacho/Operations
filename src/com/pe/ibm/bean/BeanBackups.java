package com.pe.ibm.bean;
public class BeanBackups {
	
	private int id = 0;
	private String schedulername;
	private String ipaddress;
	private String resource;
	private int severity;
	private String severidad;
	private String tipo="";
	private String userMod = "";
	private String operacion = "";
	private int resultado;
	private String customercode="";
	private String customer="";
	@Override
	public String toString() {
		return "BeanBackups [id=" + id + ", schedulername=" + schedulername + ", ipaddress=" + ipaddress + ", resource="
				+ resource + ", severity=" + severity + ", severidad=" + severidad + ", tipo=" + tipo + ", userMod="
				+ userMod + ", operacion=" + operacion + ", resultado=" + resultado + ", customercode=" + customercode
				+ ", customer=" + customer + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSchedulername() {
		return schedulername;
	}
	public void setSchedulername(String schedulername) {
		this.schedulername = schedulername;
	}
	public String getIpaddress() {
		return ipaddress;
	}
	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}
	public String getResource() {
		return resource;
	}
	public void setResource(String resource) {
		this.resource = resource;
	}
	public int getSeverity() {
		return severity;
	}
	public void setSeverity(int severity) {
		this.severity = severity;
	}
	public String getSeveridad() {
		return severidad;
	}
	public void setSeveridad(String severidad) {
		this.severidad = severidad;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getUserMod() {
		return userMod;
	}
	public void setUserMod(String userMod) {
		this.userMod = userMod;
	}
	public String getOperacion() {
		return operacion;
	}
	public void setOperacion(String operacion) {
		this.operacion = operacion;
	}
	public int getResultado() {
		return resultado;
	}
	public void setResultado(int resultado) {
		this.resultado = resultado;
	}
	public String getCustomercode() {
		return customercode;
	}
	public void setCustomercode(String customercode) {
		this.customercode = customercode;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}	

}

