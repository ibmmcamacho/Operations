package com.pe.ibm.bean;

public class BeanDistribucionTickets {
	
	public String nombre;
	public String telefono;
	public String correo;
	public String catalogo;
	public String adicional;
	public String chat;
	public String total;
	public String totalinputs;
	public String correobuzon;
	public String mes;
	public String anio;
	public String fecha;
	
	
	
	public String getTotalinputs() {
		return totalinputs;
	}
	public void setTotalinputs(String totalinputs) {
		this.totalinputs = totalinputs;
	}
	public String getCorreobuzon() {
		return correobuzon;
	}
	public void setCorreobuzon(String correobuzon) {
		this.correobuzon = correobuzon;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getCatalogo() {
		return catalogo;
	}
	public void setCatalogo(String catalogo) {
		this.catalogo = catalogo;
	}
	public String getAdicional() {
		return adicional;
	}
	public void setAdicional(String adicional) {
		this.adicional = adicional;
	}
	public String getChat() {
		return chat;
	}
	public void setChat(String chat) {
		this.chat = chat;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}

	
	
	public String getMes() {
		return mes;
	}
	public void setMes(String mes) {
		this.mes = mes;
	}
	public String getAnio() {
		return anio;
	}
	public void setAnio(String anio) {
		this.anio = anio;
	}
	public BeanDistribucionTickets() {
		super();
	}
	@Override
	public String toString() {
		return "BeanDistribucionTickets [nombre=" + nombre + ", telefono=" + telefono + ", correo=" + correo
				+ ", catalogo=" + catalogo + ", adicional=" + adicional + ", chat=" + chat + ", total=" + total
				+ ", totalinputs=" + totalinputs + ", correobuzon=" + correobuzon + ", mes=" + mes + ", anio=" + anio
				+ ", fecha=" + fecha + "]";
	}
	
	
	
}
