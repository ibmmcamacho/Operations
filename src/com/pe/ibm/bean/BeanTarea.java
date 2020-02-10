package com.pe.ibm.bean;
import java.util.Date;

public class BeanTarea {
	
	private int idTarea = 0;
	private int idTipoTarea = 0;
	private String tipoTarea = "";
	private String tarea = "";
	private int idOwner = 0;
	private String owner = "";
	private int idAprobador = 0;
	private String aprobador = "";
	private String frecuencia = "";
	private String programacion = "";
	private int idPeriodo = 0;
	private String periodo = "";
	private int avisoIn = 0;
	private int avisoFin = 0;
	private int estado = 0;
	private int resultado = 0;
	private String userMod = "";
	private String operacion= "";
	private int idOperacion = 0;
	private int iTeam = 0;
	private String selPeriodo = "";
	private String fecha = "";
	private Date rangoI;
	private Date rangoF;
	private int tipo=0;
	private int idEmpleado=0;
	
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public int getIdEmpleado() {
		return idEmpleado;
	}
	public void setIdEmpleado(int idEmpleado) {
		this.idEmpleado = idEmpleado;
	}
	
	public int getIdTarea() {
		return idTarea;
	}
	public void setIdTarea(int idTarea) {
		this.idTarea = idTarea;
	}
	public int getIdTipoTarea() {
		return idTipoTarea;
	}
	public void setIdTipoTarea(int idTipoTarea) {
		this.idTipoTarea = idTipoTarea;
	}
	public String getTipoTarea() {
		return tipoTarea;
	}
	public void setTipoTarea(String tipoTarea) {
		this.tipoTarea = tipoTarea;
	}
	public String getTarea() {
		return tarea;
	}
	public void setTarea(String tarea) {
		this.tarea = tarea;
	}
	public int getIdOwner() {
		return idOwner;
	}
	public void setIdOwner(int idOwner) {
		this.idOwner = idOwner;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public int getIdAprobador() {
		return idAprobador;
	}
	public void setIdAprobador(int idAprobador) {
		this.idAprobador = idAprobador;
	}
	public String getAprobador() {
		return aprobador;
	}
	public void setAprobador(String aprobador) {
		this.aprobador = aprobador;
	}
	public String getFrecuencia() {
		return frecuencia;
	}
	public void setFrecuencia(String frecuencia) {
		this.frecuencia = frecuencia;
	}
	public String getProgramacion() {
		return programacion;
	}
	public void setProgramacion(String programacion) {
		this.programacion = programacion;
	}
	public int getIdPeriodo() {
		return idPeriodo;
	}
	public void setIdPeriodo(int idPeriodo) {
		this.idPeriodo = idPeriodo;
	}
	public String getPeriodo() {
		return periodo;
	}
	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}
	public int getAvisoIn() {
		return avisoIn;
	}
	public void setAvisoIn(int avisoIn) {
		this.avisoIn = avisoIn;
	}
	public int getAvisoFin() {
		return avisoFin;
	}
	public void setAvisoFin(int avisoFin) {
		this.avisoFin = avisoFin;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
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
	public String getOperacion() {
		return operacion;
	}
	public void setOperacion(String operacion) {
		this.operacion = operacion;
	}
	public int getIdOperacion() {
		return idOperacion;
	}
	public void setIdOperacion(int idOperacion) {
		this.idOperacion = idOperacion;
	}
	public int getiTeam() {
		return iTeam;
	}
	public void setiTeam(int iTeam) {
		this.iTeam = iTeam;
	}
	public String getSelPeriodo() {
		return selPeriodo;
	}
	public void setSelPeriodo(String selPeriodo) {
		this.selPeriodo = selPeriodo;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public Date getRangoI() {
		return rangoI;
	}
	public void setRangoI(Date rangoI) {
		this.rangoI = rangoI;
	}
	public Date getRangoF() {
		return rangoF;
	}
	public void setRangoF(Date rangoF) {
		this.rangoF = rangoF;
	}
	@Override
	public String toString() {
		return "BeanTarea [idTarea=" + idTarea + ", idTipoTarea=" + idTipoTarea + ", tipoTarea=" + tipoTarea
				+ ", tarea=" + tarea + ", idOwner=" + idOwner + ", owner=" + owner + ", idAprobador=" + idAprobador
				+ ", aprobador=" + aprobador + ", frecuencia=" + frecuencia + ", programacion=" + programacion
				+ ", idPeriodo=" + idPeriodo + ", periodo=" + periodo + ", avisoIn=" + avisoIn + ", avisoFin="
				+ avisoFin + ", estado=" + estado + ", resultado=" + resultado + ", userMod=" + userMod + ", operacion="
				+ operacion + ", idOperacion=" + idOperacion + ", iTeam=" + iTeam + ", selPeriodo=" + selPeriodo
				+ ", fecha=" + fecha + ", rangoI=" + rangoI + ", rangoF=" + rangoF + ", tipo=" + tipo + ", idEmpleado=" + idEmpleado +"]";
	}
	
}
