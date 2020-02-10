package com.pe.ibm.bean;

public class BeanUsuario {
	
    private int id = 0;
	private String usuario = "";
    private String nombres = "";
    private String apellidos = "";
    private int idEstado = 0; 
    private int idEmpresa = 0; 
    private int idTipoEmpleado = 0; 
    private int idEstadoLogin = 0;
    private int resultado = 0;
    
	@Override
	public String toString() {
		return "BeanUsuario [id=" + id + ", usuario=" + usuario + ", nombres=" + nombres + ", apellidos=" + apellidos
				+ ", idEstado=" + idEstado + ", idEmpresa=" + idEmpresa + ", idTipoEmpleado=" + idTipoEmpleado
				+ ", idEstadoLogin=" + idEstadoLogin + ", resultado=" + resultado + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public int getIdEstado() {
		return idEstado;
	}
	public void setIdEstado(int idEstado) {
		this.idEstado = idEstado;
	}
	public int getIdEmpresa() {
		return idEmpresa;
	}
	public void setIdEmpresa(int idEmpresa) {
		this.idEmpresa = idEmpresa;
	}
	public int getIdTipoEmpleado() {
		return idTipoEmpleado;
	}
	public void setIdTipoEmpleado(int idTipoEmpleado) {
		this.idTipoEmpleado = idTipoEmpleado;
	}
	public int getIdEstadoLogin() {
		return idEstadoLogin;
	}
	public void setIdEstadoLogin(int idEstadoLogin) {
		this.idEstadoLogin = idEstadoLogin;
	}
	public int getResultado() {
		return resultado;
	}
	public void setResultado(int resultado) {
		this.resultado = resultado;
	}
    
    
    
    

}
