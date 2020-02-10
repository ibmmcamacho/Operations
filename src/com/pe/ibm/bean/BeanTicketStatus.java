package com.pe.ibm.bean;

import java.sql.Timestamp;

public class BeanTicketStatus {
	
	private String ticketid = null;
	private String clase = null;
	private String estado = null;
	private String ownergroup = null;
	private Timestamp changedate = null;
	
	public String getTicketid() {
		return ticketid;
	}
	public void setTicketid(String ticketid) {
		this.ticketid = ticketid;
	}
	public String getClase() {
		return clase;
	}
	public void setClase(String clase) {
		this.clase = clase;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getOwnergroup() {
		return ownergroup;
	}
	public void setOwnergroup(String ownergroup) {
		this.ownergroup = ownergroup;
	}
	public Timestamp getChangedate() {
		return changedate;
	}
	public void setChangedate(Timestamp changedate) {
		this.changedate = changedate;
	}
	@Override
	public String toString() {
		return "BeanTicketStatus [ticketid=" + ticketid + ", clase=" + clase + ", estado=" + estado + ", ownergroup="
				+ ownergroup + ", changedate=" + changedate + "]";
	}
	
	
	

}
