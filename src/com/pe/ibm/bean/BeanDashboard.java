package com.pe.ibm.bean;

public class BeanDashboard {

	private double valor = 0.0;
	private String estado = "";
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	@Override
	public String toString() {
		return "BeanDashboard [valor=" + valor + ", estado=" + estado + "]";
	}
	
	
	
}
