package com.pe.ibm.bean;

import java.sql.Time;
import java.util.Date;

public class BeanRendimiento {
	
	private int idRendimiento = 0;
	private String name ="";
	private String agent = "";
	private String node = "";
	private String exec = "";
	private String start = "";
	private String aplication = "";
	private String breakdown = "";
	private String response = "";
	private String detected = "";
	private String state = "";
	private String tipo = "";
	private Date fecha;
	private String hasta = "";
	
	@Override
	public String toString() {
		return "BeanRendimiento [idRendimiento =" + idRendimiento + ", name=" + name + ", agent="
				+ agent + ", node=" + node + ", exec=" + exec + ", start="
				+ start + ", aplication=" + aplication + ", breakdown=" + breakdown + ", response="
				+ response + ", detected=" + detected + ", state=" + state
				+ ", tipo=" + tipo + ", fecha=" + fecha
				+ ", hasta=" + hasta + "]";
	}

	public int getIdRendimiento() {
		return idRendimiento;
	}

	public void setIdRendimiento(int idRendimiento) {
		this.idRendimiento = idRendimiento;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}

	public String getNode() {
		return node;
	}

	public void setNode(String node) {
		this.node = node;
	}

	public String getExec() {
		return exec;
	}

	public void setExec(String exec) {
		this.exec = exec;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getAplication() {
		return aplication;
	}

	public void setAplication(String aplication) {
		this.aplication = aplication;
	}

	public String getBreakdown() {
		return breakdown;
	}

	public void setBreakdown(String breakdown) {
		this.breakdown = breakdown;
	}

	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public String getDetected() {
		return detected;
	}

	public void setDetected(String detected) {
		this.detected = detected;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}	

	public String getHasta() {
		return hasta;
	}

	public void setHasta(String hasta) {
		this.hasta = hasta;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	

}

