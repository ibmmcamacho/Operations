package com.pe.ibm.bean;

public class BeanProyecto {
	
	public String idproyecto;
	public String nombreProyecto;
	public String cisco;
	public String idusuario;
	public String usuario;
	public int estadoProyecto;
	
	
	public String getIdproyecto() {
		return idproyecto;
	}
	public void setIdproyecto(String idproyecto) {
		this.idproyecto = idproyecto;
	}
	public String getNombreProyecto() {
		return nombreProyecto;
	}
	public void setNombreProyecto(String nombreProyecto) {
		this.nombreProyecto = nombreProyecto;
	}
	public String getCisco() {
		return cisco;
	}
	public void setCisco(String cisco) {
		this.cisco = cisco;
	}
	public String getIdusuario() {
		return idusuario;
	}
	public void setIdusuario(String idusuario) {
		this.idusuario = idusuario;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public int getEstadoProyecto() {
		return estadoProyecto;
	}
	public void setEstadoProyecto(int estadoProyecto) {
		this.estadoProyecto = estadoProyecto;
	}
	
	@Override
	public String toString() {
		return "BeanProyecto [idproyecto=" + idproyecto + ", nombreProyecto=" + nombreProyecto + ", cisco=" + cisco
				+ ", idusuario=" + idusuario + ", usuario=" + usuario + ", estadoProyecto=" + estadoProyecto + "]";
	}
	
	
	
	
	
	
	

}
