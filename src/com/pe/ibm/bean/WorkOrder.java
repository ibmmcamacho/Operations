package com.pe.ibm.bean;

import java.sql.Timestamp;

public class WorkOrder {
	private int id = 0;
	private String wogroupwa = null;
	private int taskidwa = 0;
	private String descriptionwa = null;
	private String pluspcustomerwa = null;
	private String estadowa = null;
	private int woprioritywa = 0;
	private Timestamp actstartwa = null;
	private String changebywa = null;
	private String cinum = null;
	private String serviceline = null;
	private String ownerwa = null;
	private String ownergroupwa = null;
	private Timestamp reportdatewa = null;
	private String reportedbywa = null;
	private Timestamp statusdatewa = null;
	private String woclasswa = null;
	private String tarea = null;
	private String jpnum = null;
	private String jpdescription = null;
	private Timestamp actfinish = null; 
	private Timestamp woactualfin = null;
	private String wonumwa = null;
	private int habPuestoTrabajo = 0;
	private String strhabPuestoTrabajo = null;
	private String wo_acta = null;
	
	
	public String getWo_acta() {
		return wo_acta;
	}
	public void setWo_acta(String wo_acta) {
		this.wo_acta = wo_acta;
	}
	public String getStrhabPuestoTrabajo() {
		return strhabPuestoTrabajo;
	}
	public void setStrhabPuestoTrabajo(String strhabPuestoTrabajo) {
		this.strhabPuestoTrabajo = strhabPuestoTrabajo;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWogroupwa() {
		return wogroupwa;
	}
	public void setWogroupwa(String wogroupwa) {
		this.wogroupwa = wogroupwa;
	}
	public int getTaskidwa() {
		return taskidwa;
	}
	public void setTaskidwa(int taskidwa) {
		this.taskidwa = taskidwa;
	}
	public String getDescriptionwa() {
		return descriptionwa;
	}
	public void setDescriptionwa(String descriptionwa) {
		this.descriptionwa = descriptionwa;
	}
	public String getPluspcustomerwa() {
		return pluspcustomerwa;
	}
	public void setPluspcustomerwa(String pluspcustomerwa) {
		this.pluspcustomerwa = pluspcustomerwa;
	}
	public String getEstadowa() {
		return estadowa;
	}
	public void setEstadowa(String estadowa) {
		this.estadowa = estadowa;
	}
	public int getWoprioritywa() {
		return woprioritywa;
	}
	public void setWoprioritywa(int woprioritywa) {
		this.woprioritywa = woprioritywa;
	}
	public Timestamp getActstartwa() {
		return actstartwa;
	}
	public void setActstartwa(Timestamp actstartwa) {
		this.actstartwa = actstartwa;
	}
	public String getChangebywa() {
		return changebywa;
	}
	public void setChangebywa(String changebywa) {
		this.changebywa = changebywa;
	}
	public String getCinum() {
		return cinum;
	}
	public void setCinum(String cinum) {
		this.cinum = cinum;
	}
	public String getServiceline() {
		return serviceline;
	}
	public void setServiceline(String serviceline) {
		this.serviceline = serviceline;
	}
	public String getOwnerwa() {
		return ownerwa;
	}
	public void setOwnerwa(String ownerwa) {
		this.ownerwa = ownerwa;
	}
	public String getOwnergroupwa() {
		return ownergroupwa;
	}
	public void setOwnergroupwa(String ownergroupwa) {
		this.ownergroupwa = ownergroupwa;
	}
	public Timestamp getReportdatewa() {
		return reportdatewa;
	}
	public void setReportdatewa(Timestamp reportdatewa) {
		this.reportdatewa = reportdatewa;
	}
	public String getReportedbywa() {
		return reportedbywa;
	}
	public void setReportedbywa(String reportedbywa) {
		this.reportedbywa = reportedbywa;
	}
	public Timestamp getStatusdatewa() {
		return statusdatewa;
	}
	public void setStatusdatewa(Timestamp statusdatewa) {
		this.statusdatewa = statusdatewa;
	}
	public String getWoclasswa() {
		return woclasswa;
	}
	public void setWoclasswa(String woclasswa) {
		this.woclasswa = woclasswa;
	}
	public String getTarea() {
		return tarea;
	}
	public void setTarea(String tarea) {
		this.tarea = tarea;
	}
	public String getJpnum() {
		return jpnum;
	}
	public void setJpnum(String jpnum) {
		this.jpnum = jpnum;
	}
	public String getJpdescription() {
		return jpdescription;
	}
	public void setJpdescription(String jpdescription) {
		this.jpdescription = jpdescription;
	}
	public Timestamp getActfinish() {
		return actfinish;
	}
	public void setActfinish(Timestamp actfinish) {
		this.actfinish = actfinish;
	}
	public Timestamp getWoactualfin() {
		return woactualfin;
	}
	public void setWoactualfin(Timestamp woactualfin) {
		this.woactualfin = woactualfin;
	}
	public String getWonumwa() {
		return wonumwa;
	}
	public void setWonumwa(String wonumwa) {
		this.wonumwa = wonumwa;
	}
	public int getHabPuestoTrabajo() {
		return habPuestoTrabajo;
	}
	public void setHabPuestoTrabajo(int habPuestoTrabajo) {
		this.habPuestoTrabajo = habPuestoTrabajo;
	}
	@Override
	public String toString() {
		return "WorkOrder [id=" + id + ", wogroupwa=" + wogroupwa + ", taskidwa=" + taskidwa + ", descriptionwa="
				+ descriptionwa + ", pluspcustomerwa=" + pluspcustomerwa + ", estadowa=" + estadowa + ", woprioritywa="
				+ woprioritywa + ", actstartwa=" + actstartwa + ", changebywa=" + changebywa + ", cinum=" + cinum
				+ ", serviceline=" + serviceline + ", ownerwa=" + ownerwa + ", ownergroupwa=" + ownergroupwa
				+ ", reportdatewa=" + reportdatewa + ", reportedbywa=" + reportedbywa + ", statusdatewa=" + statusdatewa
				+ ", woclasswa=" + woclasswa + ", tarea=" + tarea + ", jpnum=" + jpnum + ", jpdescription="
				+ jpdescription + ", actfinish=" + actfinish + ", woactualfin=" + woactualfin + ", wonumwa=" + wonumwa
				+ ", habPuestoTrabajo=" + habPuestoTrabajo + "]";
	}
	

}
