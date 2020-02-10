package com.pe.ibm.bean;

import java.sql.Timestamp;

public class BeanTareaAsignada extends BeanTarea {
	
	private Timestamp fechaGenerada;
	private Timestamp fechaRealizada;
	private Timestamp fechaAprobada;
	private Timestamp fechaReprogramada;
	private Timestamp fechaCancelada;
	private Timestamp fechaPeriodo;
	private String nuevaFecha;
	private String observaciones;
	private String usuarioRealizador = "";
	private String usuarioAprobador = "";
	private String usuario = ""; 
	private String archivo = "";
	private String archivoNombre = "";
	private int idEmpleado = 0;
	private int idTareaGenerada = 0;
	private int idTeam = 0;
	private String strEstado;
	
	
	
	public Timestamp getFechaPeriodo() {
		return fechaPeriodo;
	}
	public void setFechaPeriodo(Timestamp fechaPeriodo) {
		this.fechaPeriodo = fechaPeriodo;
	}
	public Timestamp getFechaGenerada() {
		return fechaGenerada;
	}
	public void setFechaGenerada(Timestamp fechaGenerada) {
		this.fechaGenerada = fechaGenerada;
	}
	public Timestamp getFechaRealizada() {
		return fechaRealizada;
	}
	public void setFechaRealizada(Timestamp fechaRealizada) {
		this.fechaRealizada = fechaRealizada;
	}
	public Timestamp getFechaAprobada() {
		return fechaAprobada;
	}
	public void setFechaAprobada(Timestamp fechaAprobada) {
		this.fechaAprobada = fechaAprobada;
	}
	public Timestamp getFechaReprogramada() {
		return fechaReprogramada;
	}
	public void setFechaReprogramada(Timestamp fechaReprogramada) {
		this.fechaReprogramada = fechaReprogramada;
	}
	public Timestamp getFechaCancelada() {
		return fechaCancelada;
	}
	public void setFechaCancelada(Timestamp fechaCancelada) {
		this.fechaCancelada = fechaCancelada;
	}
	public String getNuevaFecha() {
		return nuevaFecha;
	}
	public void setNuevaFecha(String nuevaFecha) {
		this.nuevaFecha = nuevaFecha;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public String getUsuarioRealizador() {
		return usuarioRealizador;
	}
	public void setUsuarioRealizador(String usuarioRealizador) {
		this.usuarioRealizador = usuarioRealizador;
	}
	public String getUsuarioAprobador() {
		return usuarioAprobador;
	}
	public void setUsuarioAprobador(String usuarioAprobador) {
		this.usuarioAprobador = usuarioAprobador;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getArchivo() {
		return archivo;
	}
	public void setArchivo(String archivo) {
		this.archivo = archivo;
	}
	public String getArchivoNombre() {
		return archivoNombre;
	}
	public void setArchivoNombre(String archivoNombre) {
		this.archivoNombre = archivoNombre;
	}
	public int getIdEmpleado() {
		return idEmpleado;
	}
	public void setIdEmpleado(int idEmpleado) {
		this.idEmpleado = idEmpleado;
	}
	public int getIdTareaGenerada() {
		return idTareaGenerada;
	}
	public void setIdTareaGenerada(int idTareaGenerada) {
		this.idTareaGenerada = idTareaGenerada;
	}
	public int getIdTeam() {
		return idTeam;
	}
	public void setIdTeam(int idTeam) {
		this.idTeam = idTeam;
	}
	public String getStrEstado() {
		return strEstado;
	}
	public void setStrEstado(String strEstado) {
		this.strEstado = strEstado;
	}
	@Override
	public String toString() {
		return "BeanTareaAsignada [fechaGenerada=" + fechaGenerada + ", fechaRealizada=" + fechaRealizada
				+ ", fechaAprobada=" + fechaAprobada + ", fechaReprogramada=" + fechaReprogramada + ", fechaCancelada="
				+ fechaCancelada + ", nuevaFecha=" + nuevaFecha + ", observaciones=" + observaciones
				+ ", usuarioRealizador=" + usuarioRealizador + ", usuarioAprobador=" + usuarioAprobador + ", usuario="
				+ usuario + ", archivo=" + archivo + ", archivoNombre=" + archivoNombre + ", idEmpleado=" + idEmpleado
				+ ", idTareaGenerada=" + idTareaGenerada + ", idTeam=" + idTeam + ", strEstado=" + strEstado + "]";
	}


}
