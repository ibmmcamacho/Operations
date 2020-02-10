package com.pe.ibm.bean;

import java.sql.Time;
import java.util.Date;

public class BeanActividad extends BeanOperacion{
	
	private Integer idActividad = 0;
	private int idturno = 0;
	private String descripcionTurno ="";
	private int idSede = 0;
	private String descripcionSede ="";
    private Time horaEjecucion;
    private String descripcion ="";
    private Time horaTermino;
    private int idPeriodo = 0;
    private String descripcionPeriodo ="";
    private int idPlataforma = 0;
    private String descripcionPlataforma ="";
    private int idProcedimiento = 0;
    private String descripcionProcedimiento ="";
    private String urlProcedimiento ="";
    private int idServidor = 0;
    private String descripcionServidor ="";
    private int idCliente = 0;
    private String descripcionCliente ="";
    private String jobStream ="";
    private int idTipoActividad = 0;
    private String descripcionTipoActividad =""; 
    private int estado = 0;
    private String accion ="";
    private int idTipoRespaldo = 0;
    private String descripcionTipoRespaldo ="";
    private Time duracion;
    private String comentario ="";
    private Time ventanaMax;
    private int tws = 0;
    private String userMod = "";
    private int team = 0;
    private Date fechaMod;
    private String tipoMod = "";
    private String motivo = "";
    private String descripcionTeam = "";

    @Override
	public String toString() {
		return "BeanActividad [idActividad=" + idActividad + ", idturno=" + idturno + ", descripcionTurno="
				+ descripcionTurno + ", idSede=" + idSede + ", descripcionSede=" + descripcionSede + ", horaEjecucion="
				+ horaEjecucion + ", descripcion=" + descripcion + ", horaTermino=" + horaTermino + ", idPeriodo="
				+ idPeriodo + ", descripcionPeriodo=" + descripcionPeriodo + ", idPlataforma=" + idPlataforma
				+ ", descripcionPlataforma=" + descripcionPlataforma + ", idProcedimiento=" + idProcedimiento
				+ ", descripcionProcedimiento=" + descripcionProcedimiento + ", idServidor=" + idServidor
				+ ", descripcionServidor=" + descripcionServidor + ", idCliente=" + idCliente + ", descripcionCliente="
				+ descripcionCliente + ", jobStream=" + jobStream + ", idTipoActividad=" + idTipoActividad
				+ ", descripcionTipoActividad=" + descripcionTipoActividad + ", estado=" + estado + ", accion=" + accion
				+ ", idTipoRespaldo=" + idTipoRespaldo + ", descripcionTipoRespaldo=" + descripcionTipoRespaldo
				+ ", duracion=" + duracion + ", comentario=" + comentario + ", ventanaMax=" + ventanaMax + ", tws="
				+ tws + ", userMod=" + userMod + ", team=" + team + ", fechaMod=" + fechaMod + ", tipoMod=" + tipoMod
				+ ", motivo=" + motivo + ", descripcionTeam=" + descripcionTeam + "]";
	}

	public Integer getIdActividad() {
		return idActividad;
	}

	public void setIdActividad(Integer idActividad) {
		this.idActividad = idActividad;
	}

	public int getIdturno() {
		return idturno;
	}

	public void setIdturno(int idturno) {
		this.idturno = idturno;
	}

	public String getDescripcionTurno() {
		return descripcionTurno;
	}

	public void setDescripcionTurno(String descripcionTurno) {
		this.descripcionTurno = descripcionTurno;
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

	public Time getHoraEjecucion() {
		return horaEjecucion;
	}

	public void setHoraEjecucion(Time horaEjecucion) {
		this.horaEjecucion = horaEjecucion;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Time getHoraTermino() {
		return horaTermino;
	}

	public void setHoraTermino(Time horaTermino) {
		this.horaTermino = horaTermino;
	}

	public int getIdPeriodo() {
		return idPeriodo;
	}

	public void setIdPeriodo(int idPeriodo) {
		this.idPeriodo = idPeriodo;
	}

	public String getDescripcionPeriodo() {
		return descripcionPeriodo;
	}

	public void setDescripcionPeriodo(String descripcionPeriodo) {
		this.descripcionPeriodo = descripcionPeriodo;
	}

	public int getIdPlataforma() {
		return idPlataforma;
	}

	public void setIdPlataforma(int idPlataforma) {
		this.idPlataforma = idPlataforma;
	}

	public String getDescripcionPlataforma() {
		return descripcionPlataforma;
	}

	public void setDescripcionPlataforma(String descripcionPlataforma) {
		this.descripcionPlataforma = descripcionPlataforma;
	}

	public int getIdProcedimiento() {
		return idProcedimiento;
	}

	public void setIdProcedimiento(int idProcedimiento) {
		this.idProcedimiento = idProcedimiento;
	}

	public String getDescripcionProcedimiento() {
		return descripcionProcedimiento;
	}

	public void setDescripcionProcedimiento(String descripcionProcedimiento) {
		this.descripcionProcedimiento = descripcionProcedimiento;
	}

	public int getIdServidor() {
		return idServidor;
	}

	public void setIdServidor(int idServidor) {
		this.idServidor = idServidor;
	}

	public String getDescripcionServidor() {
		return descripcionServidor;
	}

	public void setDescripcionServidor(String descripcionServidor) {
		this.descripcionServidor = descripcionServidor;
	}

	public int getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

	public String getDescripcionCliente() {
		return descripcionCliente;
	}

	public void setDescripcionCliente(String descripcionCliente) {
		this.descripcionCliente = descripcionCliente;
	}

	public String getJobStream() {
		return jobStream;
	}

	public void setJobStream(String jobStream) {
		this.jobStream = jobStream;
	}

	public int getIdTipoActividad() {
		return idTipoActividad;
	}

	public void setIdTipoActividad(int idTipoActividad) {
		this.idTipoActividad = idTipoActividad;
	}

	public String getDescripcionTipoActividad() {
		return descripcionTipoActividad;
	}

	public void setDescripcionTipoActividad(String descripcionTipoActividad) {
		this.descripcionTipoActividad = descripcionTipoActividad;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	public String getAccion() {
		return accion;
	}

	public void setAccion(String accion) {
		this.accion = accion;
	}

	public int getIdTipoRespaldo() {
		return idTipoRespaldo;
	}

	public void setIdTipoRespaldo(int idTipoRespaldo) {
		this.idTipoRespaldo = idTipoRespaldo;
	}

	public String getDescripcionTipoRespaldo() {
		return descripcionTipoRespaldo;
	}

	public void setDescripcionTipoRespaldo(String descripcionTipoRespaldo) {
		this.descripcionTipoRespaldo = descripcionTipoRespaldo;
	}

	public Time getDuracion() {
		return duracion;
	}

	public void setDuracion(Time duracion) {
		this.duracion = duracion;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public Time getVentanaMax() {
		return ventanaMax;
	}

	public void setVentanaMax(Time ventanaMax) {
		this.ventanaMax = ventanaMax;
	}

	public int getTws() {
		return tws;
	}

	public void setTws(int tws) {
		this.tws = tws;
	}

	public String getUserMod() {
		return userMod;
	}

	public void setUserMod(String userMod) {
		this.userMod = userMod;
	}

	public int getTeam() {
		return team;
	}

	public void setTeam(int team) {
		this.team = team;
	}

	public Date getFechaMod() {
		return fechaMod;
	}

	public void setFechaMod(Date fechaMod) {
		this.fechaMod = fechaMod;
	}

	public String getTipoMod() {
		return tipoMod;
	}

	public void setTipoMod(String tipoMod) {
		this.tipoMod = tipoMod;
	}

	public String getMotivo() {
		return motivo;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}

	public String getDescripcionTeam() {
		return descripcionTeam;
	}

	public void setDescripcionTeam(String descripcionTeam) {
		this.descripcionTeam = descripcionTeam;
	}

	public String getUrlProcedimiento() {
		return urlProcedimiento;
	}

	public void setUrlProcedimiento(String urlProcedimiento) {
		this.urlProcedimiento = urlProcedimiento;
	}
	
	

}

