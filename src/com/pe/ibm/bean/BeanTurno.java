package com.pe.ibm.bean;

import java.sql.Time;

public class BeanTurno extends BeanOperacion{

	private int idTurno = 0;
	private String descripcion = "";
	private Time horaInicio;
	private Time horaFin;
	private int estado = 0;
	private int team = 0;
	private int opcion = 0;
	private int vfecha = 0;  //Valida fecha? || Usa función fecha?
	private String gturnos = "";
	
	public int getIdTurno() {
		return idTurno;
	}
	public void setIdTurno(int idTurno) {
		this.idTurno = idTurno;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Time getHoraInicio() {
		return horaInicio;
	}
	public void setHoraInicio(Time horaInicio) {
		this.horaInicio = horaInicio;
	}
	public Time getHoraFin() {
		return horaFin;
	}
	public void setHoraFin(Time horaFin) {
		this.horaFin = horaFin;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	
	public int getTeam() {
		return team;
	}
	public void setTeam(int team) {
		this.team = team;
	}
	public int getOpcion() {
		return opcion;
	}
	public void setOpcion(int opcion) {
		this.opcion = opcion;
	}
	public String getGturnos() {
		return gturnos;
	}
	public void setGturnos(String gturnos) {
		this.gturnos = gturnos;
	}
	
	public int getVfecha() {
		return vfecha;
	}
	public void setVfecha(int vfecha) {
		this.vfecha = vfecha;
	}
	@Override
	public String toString() {
		return "BeanTurno [idTurno=" + idTurno + ", descripcion=" + descripcion + ", horaInicio=" + horaInicio
				+ ", horaFin=" + horaFin + ", estado=" + estado + ", getOperacion()=" + getOperacion()
				+ ", getResultado()=" + getResultado() + "]";
	}
	
	
	
    
    
}
