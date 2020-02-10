package com.pe.ibm.bean;

public class BeanGrupo {

	int iIdGrupo;
	int iIdGrupoDetalle;
	String strDescripcion;
	int iEstado;
	int iTeam;
	int iEmpleado;

	public BeanGrupo(){}

	public BeanGrupo(int iIdGrupo, int iIdGrupoDetalle, String strDescripcion, int iEstado, int iTeam, int iEmpleado) {
		super();
		this.iIdGrupo = iIdGrupo;
		this.iIdGrupoDetalle = iIdGrupoDetalle;
		this.strDescripcion = strDescripcion;
		this.iEstado = iEstado;
		this.iTeam = iTeam;
		this.iEmpleado = iEmpleado;
	}
	
	public int getiIdGrupo() {
		return iIdGrupo;
	}

	public void setiIdGrupo(int iIdGrupo) {
		this.iIdGrupo = iIdGrupo;
	}

	public int getiIdGrupoDetalle() {
		return iIdGrupoDetalle;
	}

	public void setiIdGrupoDetalle(int iIdGrupoDetalle) {
		this.iIdGrupoDetalle = iIdGrupoDetalle;
	}

	public String getStrDescripcion() {
		return strDescripcion;
	}

	public void setStrDescripcion(String strDescripcion) {
		this.strDescripcion = strDescripcion;
	}

	public int getiEstado() {
		return iEstado;
	}

	public void setiEstado(int iEstado) {
		this.iEstado = iEstado;
	}

	public int getiTeam() {
		return iTeam;
	}

	public void setiTeam(int iTeam) {
		this.iTeam = iTeam;
	}

	public int getiEmpleado() {
		return iEmpleado;
	}

	public void setiEmpleado(int iEmpleado) {
		this.iEmpleado = iEmpleado;
	}
}
