package com.pe.ibm.bean;

public class BeanPeriodoDet {

	int iIdPeriodo_Detalle;
	int anio;
	String mes_nombre;
	int mes_numero;
	String dia_nombre;
	int dia_numero;
	String dia_tiempo_nombre;
	int dia_tiempo_numero;
	int id_periodo;
	int ordinales;
	int semana;
	int dia_especial;
	
	
	public BeanPeriodoDet() {}


	public BeanPeriodoDet(int iIdPeriodo_Detalle, int anio, int mes_numero, String mes_nombre, int dia_numero,
			String dia_nombre, String dia_tiempo_nombre, int dia_tiempo_numero, int id_periodo, int ordinales,
			int semana, int dia_especial) {
		super();
		this.iIdPeriodo_Detalle = iIdPeriodo_Detalle;
		this.anio = anio;
		this.mes_nombre = mes_nombre;
		this.mes_numero = mes_numero;
		this.dia_nombre = dia_nombre;
		this.dia_numero = dia_numero;		
		this.dia_tiempo_nombre = dia_tiempo_nombre;
		this.dia_tiempo_numero = dia_tiempo_numero;
		this.id_periodo = id_periodo;
		this.ordinales = ordinales;
		this.semana = semana;
		this.dia_especial = dia_especial;
	}


	public int getiIdPeriodo_Detalle() {
		return iIdPeriodo_Detalle;
	}


	public void setiIdPeriodo_Detalle(int iIdPeriodo_Detalle) {
		this.iIdPeriodo_Detalle = iIdPeriodo_Detalle;
	}


	public int getAnio() {
		return anio;
	}


	public void setAnio(int anio) {
		this.anio = anio;
	}


	public int getMes_numero() {
		return mes_numero;
	}


	public void setMes_numero(int mes_numero) {
		this.mes_numero = mes_numero;
	}


	public String getMes_nombre() {
		return mes_nombre;
	}


	public void setMes_nombre(String mes_nombre) {
		this.mes_nombre = mes_nombre;
	}


	public int getDia_numero() {
		return dia_numero;
	}


	public void setDia_numero(int dia_numero) {
		this.dia_numero = dia_numero;
	}


	public String getDia_nombre() {
		return dia_nombre;
	}


	public void setDia_nombre(String dia_nombre) {
		this.dia_nombre = dia_nombre;
	}


	public String getDia_tiempo_nombre() {
		return dia_tiempo_nombre;
	}


	public void setDia_tiempo_nombre(String dia_tiempo_nombre) {
		this.dia_tiempo_nombre = dia_tiempo_nombre;
	}


	public int getDia_tiempo_numero() {
		return dia_tiempo_numero;
	}


	public void setDia_tiempo_numero(int dia_tiempo_numero) {
		this.dia_tiempo_numero = dia_tiempo_numero;
	}


	public int getId_periodo() {
		return id_periodo;
	}


	public void setId_periodo(int id_periodo) {
		this.id_periodo = id_periodo;
	}


	public int getOrdinales() {
		return ordinales;
	}


	public void setOrdinales(int ordinales) {
		this.ordinales = ordinales;
	}


	public int getSemana() {
		return semana;
	}


	public void setSemana(int semana) {
		this.semana = semana;
	}


	public int getDia_especial() {
		return dia_especial;
	}


	public void setDia_especial(int dia_especial) {
		this.dia_especial = dia_especial;
	}
	
	
	
}
