package com.pe.ibm.bean;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class ResultadoNivelServicio {
	private String id_resultado_sla=null;
	private String id_sla=null;
	private String mes=null;
	private String anio=null;
	private String valornum=null;
	private String valorletra=null;
	private String id_colormes=null;
	private String fecha=null;
	private Timestamp fecha1 = null;
	BigDecimal resultado = new BigDecimal(0); 
	int valor1 = 0; //Numerador
	int valor2 = 0; //Denominador
	public String getId_resultado_sla() {
		return id_resultado_sla;
	}
	public void setId_resultado_sla(String id_resultado_sla) {
		this.id_resultado_sla = id_resultado_sla;
	}
	public String getId_sla() {
		return id_sla;
	}
	public void setId_sla(String id_sla) {
		this.id_sla = id_sla;
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
	public String getValornum() {
		return valornum;
	}
	public void setValornum(String valornum) {
		this.valornum = valornum;
	}
	public String getValorletra() {
		return valorletra;
	}
	public void setValorletra(String valorletra) {
		this.valorletra = valorletra;
	}
	public String getId_colormes() {
		return id_colormes;
	}
	public void setId_colormes(String id_colormes) {
		this.id_colormes = id_colormes;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public Timestamp getFecha1() {
		return fecha1;
	}
	public void setFecha1(Timestamp fecha1) {
		this.fecha1 = fecha1;
	}
	public BigDecimal getResultado() {
		return resultado;
	}
	public void setResultado(BigDecimal resultado) {
		this.resultado = resultado;
	}
	public int getValor1() {
		return valor1;
	}
	public void setValor1(int valor1) {
		this.valor1 = valor1;
	}
	public int getValor2() {
		return valor2;
	}
	public void setValor2(int valor2) {
		this.valor2 = valor2;
	}
	@Override
	public String toString() {
		return "ResultadoNivelServicio [id_resultado_sla=" + id_resultado_sla + ", id_sla=" + id_sla + ", mes=" + mes
				+ ", anio=" + anio + ", valornum=" + valornum + ", valorletra=" + valorletra + ", id_colormes="
				+ id_colormes + ", fecha=" + fecha + ", fecha1=" + fecha1 + ", resultado=" + resultado + ", valor1="
				+ valor1 + ", valor2=" + valor2 + "]";
	}
	
	
	
	
	
}
