package com.pe.ibm.bean;

public class BeanFeedBack {
	
	private String usuario = "";
	private String team = "";
	private String comentario = "";
	private int puntuacion = 0;
	private String rutaPagina = "";
	private String emailOwner = "";
	private int estado = 0;
	private String respuesta = "";
	
	
	
	@Override
	public String toString() {
		return "BeanFeedBack [usuario=" + usuario + ", team=" + team + ", comentario=" + comentario + ", puntuacion="
				+ puntuacion + ", rutaPagina=" + rutaPagina + ", emailOwner=" + emailOwner + ", estado=" + estado
				+ ", respuesta=" + respuesta + "]";
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	public int getPuntuacion() {
		return puntuacion;
	}
	public void setPuntuacion(int puntuacion) {
		this.puntuacion = puntuacion;
	}
	public String getRutaPagina() {
		return rutaPagina;
	}
	public void setRutaPagina(String rutaPagina) {
		this.rutaPagina = rutaPagina;
	}
	public String getEmailOwner() {
		return emailOwner;
	}
	public void setEmailOwner(String emailOwner) {
		this.emailOwner = emailOwner;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public String getRespuesta() {
		return respuesta;
	}
	public void setRespuesta(String respuesta) {
		this.respuesta = respuesta;
	}
	
	
	
	

}
