package com.pe.ibm.bean;

import java.util.Date;
import java.sql.Time;

public class BeanScheduleActividad extends BeanActividad{
 
	private int idScheact = 0;
	private int idSchedule = 0;
	private String ip ="";
	private int estadoschedact = 0;
	private Time horaInicio; 
	private Time horaFin;
	private Time duracion;
	private String comentariosched ="";
	private String usermod="";
	private int estadotar = 0;
	private int idusermod = 0;
	private Date fecha;
	
	

	

	

	@Override
	public String toString() {
		return "BeanScheduleActividad [idScheact=" + idScheact + ", idSchedule=" + idSchedule + ", ip=" + ip
				+ ", estadoschedact=" + estadoschedact + ", horaInicio=" + horaInicio + ", horaFin=" + horaFin
				+ ", duracion=" + duracion + ", comentariosched=" + comentariosched + ", usermod=" + usermod
				+ ", estadotar=" + estadotar + ", idusermod=" + idusermod + ", fecha=" + fecha + ", getIdActividad()=" + getIdActividad()
				+ ", getIdturno()=" + getIdturno() + ", getDescripcionTurno()=" + getDescripcionTurno()
				+ ", getIdSede()=" + getIdSede() + ", getDescripcionSede()=" + getDescripcionSede()
				+ ", getHoraEjecucion()=" + getHoraEjecucion() + ", getDescripcion()=" + getDescripcion()
				+ ", getHoraTermino()=" + getHoraTermino() + ", getIdPeriodo()=" + getIdPeriodo()
				+ ", getDescripcionPeriodo()=" + getDescripcionPeriodo() + ", getIdPlataforma()=" + getIdPlataforma()
				+ ", getDescripcionPlataforma()=" + getDescripcionPlataforma() + ", getIdProcedimiento()="
				+ getIdProcedimiento() + ", getDescripcionProcedimiento()=" + getDescripcionProcedimiento()
				+ ", getIdServidor()=" + getIdServidor() + ", getDescripcionServidor()=" + getDescripcionServidor()
				+ ", getIdCliente()=" + getIdCliente() + ", getDescripcionCliente()=" + getDescripcionCliente()
				+ ", getJobStream()=" + getJobStream() + ", getIdTipoActividad()=" + getIdTipoActividad()
				+ ", getDescripcionTipoActividad()=" + getDescripcionTipoActividad() + ", getEstado()=" + getEstado()
				+ ", getAccion()=" + getAccion() + ", getIdTipoRespaldo()=" + getIdTipoRespaldo()
				+ ", getDescripcionTipoRespaldo()=" + getDescripcionTipoRespaldo() + ", getComentario()="
				+ getComentario() + ", getVentanaMax()=" + getVentanaMax() + ", getTws()=" + getTws()
				+ ", getIdOperacion()=" + getIdOperacion() + ", getOperacion()=" + getOperacion() + ", getResultado()="
				+ getResultado() + "]";
	}

	public int getIdusermod() {
		return idusermod;
	}

	public void setIdusermod(int idusermod) {
		this.idusermod = idusermod;
	}

	public int getIdScheact() {
		return idScheact;
	}

	public void setIdScheact(int idScheact) {
		this.idScheact = idScheact;
	}

	public int getIdSchedule() {
		return idSchedule;
	}

	public void setIdSchedule(int idSchedule) {
		this.idSchedule = idSchedule;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getEstadoschedact() {
		return estadoschedact;
	}

	public void setEstadoschedact(int estadoschedact) {
		this.estadoschedact = estadoschedact;
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

	public Time getDuracion() {
		return duracion;
	}

	public void setDuracion(Time duracion) {
		this.duracion = duracion;
	}

	public String getComentariosched() {
		return comentariosched;
	}

	public void setComentariosched(String comentariosched) {
		this.comentariosched = comentariosched;
	}

	public String getUsermod() {
		return usermod;
	}

	public void setUsermod(String usermod) {
		this.usermod = usermod;
	}

	public int getEstadotar() {
		return estadotar;
	}

	public void setEstadotar(int estadotar) {
		this.estadotar = estadotar;
	}
	
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	
	
	
	
}
