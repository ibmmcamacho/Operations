package com.pe.ibm.bean;

//import java.sql.Time;
//import java.util.Date;

public class BeanBlackout {
	
	private int id = 0;
	private String tipo = "";
	private String inicio = "";
	private String suppressend = "";
	private String changenumber = "";
	private String description = "";
	private String customercode = "";
	private String duration = "";
	private String originator = "";
	private String resourceid = "";
	private String component = "";
	private String componenttype = "";
	private String applid = "";
	private String instanceid = "";	
	private String usermod = "";
	private int resultado;
	@Override
	public String toString() {
		return "BeanBlackout [id=" + id + ", tipo=" + tipo + ", inicio=" + inicio + ", suppressend=" + suppressend
				+ ", changenumber=" + changenumber + ", description=" + description + ", customercode=" + customercode
				+ ", duration=" + duration + ", originator=" + originator + ", resourceid=" + resourceid
				+ ", component=" + component + ", componenttype=" + componenttype + ", applid=" + applid
				+ ", instanceid=" + instanceid + ", usermod=" + usermod + ", resultado=" + resultado + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getInicio() {
		return inicio;
	}
	public void setInicio(String inicio) {
		this.inicio = inicio;
	}
	public String getSuppressend() {
		return suppressend;
	}
	public void setSuppressend(String suppressend) {
		this.suppressend = suppressend;
	}
	public String getChangenumber() {
		return changenumber;
	}
	public void setChangenumber(String changenumber) {
		this.changenumber = changenumber;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCustomercode() {
		return customercode;
	}
	public void setCustomercode(String customercode) {
		this.customercode = customercode;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getOriginator() {
		return originator;
	}
	public void setOriginator(String originator) {
		this.originator = originator;
	}
	public String getResourceid() {
		return resourceid;
	}
	public void setResourceid(String resourceid) {
		this.resourceid = resourceid;
	}
	public String getComponent() {
		return component;
	}
	public void setComponent(String component) {
		this.component = component;
	}
	public String getComponenttype() {
		return componenttype;
	}
	public void setComponenttype(String componenttype) {
		this.componenttype = componenttype;
	}
	public String getApplid() {
		return applid;
	}
	public void setApplid(String applid) {
		this.applid = applid;
	}
	public String getInstanceid() {
		return instanceid;
	}
	public void setInstanceid(String instanceid) {
		this.instanceid = instanceid;
	}
	public String getUsermod() {
		return usermod;
	}
	public void setUsermod(String usermod) {
		this.usermod = usermod;
	}
	public int getResultado() {
		return resultado;
	}
	public void setResultado(int resultado) {
		this.resultado = resultado;
	}		
}

