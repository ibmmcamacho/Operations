package com.pe.ibm.bean;

import java.sql.Date;
import java.sql.Time;

public class BeanSchedule extends BeanOperacion {

	
	private int idSchedule = 0;
	private String fecha;
	private int estado = 0;
	private String descripcionEstado = "";
	private int idTurno = 0;
	private String descripcionTurno = "";
	private Time horaInicioTurno;
	private Time horaFinTurno;
	private String grupoTurnos = "";	//BG001
	private int idOption = 0;			//BG001
	private String usermod="";
	private int idusermod = 0;
	private int idSede = 0;
	private String descripcionSede = "";
	private String operadorAsignado = "";
	private String cabecera = "";
	
	
	public String getCabecera() {
		return cabecera;
	}
	public void setCabecera(String cabecera) {
		this.cabecera = cabecera;
	}
	public String getDescripcionEstado() {
		return descripcionEstado;
	}
	public void setDescripcionEstado(String descripcionEstado) {
		this.descripcionEstado = descripcionEstado;
	}
	public int getIdSchedule() {
		return idSchedule;
	}
	public void setIdSchedule(int idSchedule) {
		this.idSchedule = idSchedule;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public int getIdTurno() {
		return idTurno;
	}
	public void setIdTurno(int idTurno) {
		this.idTurno = idTurno;
	}
	public String getDescripcionTurno() {
		return descripcionTurno;
	}
	public void setDescripcionTurno(String descripcionTurno) {
		this.descripcionTurno = descripcionTurno;
	}
	public Time getHoraInicioTurno() {
		return horaInicioTurno;
	}
	public void setHoraInicioTurno(Time horaInicioTurno) {
		this.horaInicioTurno = horaInicioTurno;
	}
	public Time getHoraFinTurno() {
		return horaFinTurno;
	}
	public void setHoraFinTurno(Time horaFinTurno) {
		this.horaFinTurno = horaFinTurno;
	}
	public String getUsermod() {
		return usermod;
	}
	public void setUsermod(String usermod) {
		this.usermod = usermod;
	}
	public int getIdusermod() {
		return idusermod;
	}
	public void setIdusermod(int idusermod) {
		this.idusermod = idusermod;
	}
	public int getIdSede() {
		return idSede;
	}
	public void setIdSede(int idSede) {
		this.idSede = idSede;
	}
	public String getDescripcionSede() {
		return descripcionSede;
	}
	public void setDescripcionSede(String descripcionSede) {
		this.descripcionSede = descripcionSede;
	}
	public String getOperadorAsignado() {
		return operadorAsignado;
	}
	public void setOperadorAsignado(String operadorAsignado) {
		this.operadorAsignado = operadorAsignado;
	}
	public String getGrupoTurnos() {
		return grupoTurnos;
	}
	public void setGrupoTurnos(String grupoTurnos) {
		this.grupoTurnos = grupoTurnos;
	}
	public int getIdOption() {
		return idOption;
	}
	public void setIdOption(int idOption) {
		this.idOption = idOption;
	}
	
	
	
}
