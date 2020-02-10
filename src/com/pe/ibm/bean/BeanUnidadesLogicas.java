package com.pe.ibm.bean;

//import java.sql.Time;
//import java.util.Date;

public class BeanUnidadesLogicas {
	
	private int id = 0;
	private String resourceid;
	private String ip = "";
	private String tower = "";
	private String towerdesc = "";
	private String disk = "";
	private String operacion = "";
	private int resultado;
	private String userMod = "";
	private String customercode="";
	private String customer="";
	@Override
	public String toString() {
		return "BeanUnidadesLogicas [id=" + id + ", resourceid=" + resourceid + ", ip=" + ip + ", tower=" + tower
				+ ", towerdesc=" + towerdesc + ", disk=" + disk + ", operacion=" + operacion + ", resultado="
				+ resultado + ", userMod=" + userMod + ", customercode=" + customercode + ", customer=" + customer
				+ "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getResourceid() {
		return resourceid;
	}
	public void setResourceid(String resourceid) {
		this.resourceid = resourceid;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getTower() {
		return tower;
	}
	public void setTower(String tower) {
		this.tower = tower;
	}
	public String getTowerdesc() {
		return towerdesc;
	}
	public void setTowerdesc(String towerdesc) {
		this.towerdesc = towerdesc;
	}
	public String getDisk() {
		return disk;
	}
	public void setDisk(String disk) {
		this.disk = disk;
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
	public String getUserMod() {
		return userMod;
	}
	public void setUserMod(String userMod) {
		this.userMod = userMod;
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

