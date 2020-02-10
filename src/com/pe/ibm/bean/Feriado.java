package com.pe.ibm.bean;

import java.sql.Timestamp;

public class Feriado {
	private Timestamp fecha=null;
	private String descripcion=null;
	
	
	@Override
	public String toString() {
		return "Feriado [fecha=" + fecha + ", descripcion=" + descripcion + "]";
	}
	public Timestamp getFecha() {
		return fecha;
	}
	public void setFecha(Timestamp fecha) {
		this.fecha = fecha;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
}
