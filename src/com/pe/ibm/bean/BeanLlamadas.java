package com.pe.ibm.bean;

public class BeanLlamadas extends BeanBusqueda{
	
	private String idllamada="";
	private String fechainicio="";
	private Integer tiempocola=0;
	private Integer tiempoconversacion=0;
	private String agente="";
	private int central=0;
	private String tipollamada="";
	private String idproyecto="";
	private String proyectocisco="";
	private String llamadasMayores;
	private String llamadasMenores;
	private String llamadasContestadas;
	private int numerodiaSemana = 0;
	private String nombrediaSemana;
	private int numerodiaMes = 0;
	private int numerohoraDia;
	private String strhoraDia;
	private int numeroSemana;
	private String strnumeroSemana;
	private String tipo;
	private double tasaAbandono = 0.0;
	private int umbral;
	
	
	public int getNumerodiaMes() {
		return numerodiaMes;
	}
	public void setNumerodiaMes(int numerodiaMes) {
		this.numerodiaMes = numerodiaMes;
	}
	public int getUmbral() {
		return umbral;
	}
	public void setUmbral(int umbral) {
		this.umbral = umbral;
	}
	public double getTasaAbandono() {
		return tasaAbandono;
	}
	public void setTasaAbandono(double tasaAbandono) {
		this.tasaAbandono = tasaAbandono;
	}
	public int getNumerodiaSemana() {
		return numerodiaSemana;
	}
	public void setNumerodiaSemana(int numerodiaSemana) {
		this.numerodiaSemana = numerodiaSemana;
	}
	public String getNombrediaSemana() {
		return nombrediaSemana;
	}
	public void setNombrediaSemana(String nombrediaSemana) {
		this.nombrediaSemana = nombrediaSemana;
	}
	public int getNumerohoraDia() {
		return numerohoraDia;
	}
	public void setNumerohoraDia(int numerohoraDia) {
		this.numerohoraDia = numerohoraDia;
	}
	public String getStrhoraDia() {
		return strhoraDia;
	}
	public void setStrhoraDia(String strhoraDia) {
		this.strhoraDia = strhoraDia;
	}
	public int getNumeroSemana() {
		return numeroSemana;
	}
	public void setNumeroSemana(int numeroSemana) {
		this.numeroSemana = numeroSemana;
	}
	public String getStrnumeroSemana() {
		return strnumeroSemana;
	}
	public void setStrnumeroSemana(String strnumeroSemana) {
		this.strnumeroSemana = strnumeroSemana;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getLlamadasMayores() {
		return llamadasMayores;
	}
	public void setLlamadasMayores(String llamadasMayores) {
		this.llamadasMayores = llamadasMayores;
	}
	public String getLlamadasMenores() {
		return llamadasMenores;
	}
	public void setLlamadasMenores(String llamadasMenores) {
		this.llamadasMenores = llamadasMenores;
	}
	public String getLlamadasContestadas() {
		return llamadasContestadas;
	}
	public void setLlamadasContestadas(String llamadasContestadas) {
		this.llamadasContestadas = llamadasContestadas;
	}
	
	public String getIdllamada() {
		return idllamada;
	}
	public void setIdllamada(String idllamada) {
		this.idllamada = idllamada;
	}
	public String getFechainicio() {
		return fechainicio;
	}
	public void setFechainicio(String fechainicio) {
		this.fechainicio = fechainicio;
	}
	public Integer getTiempocola() {
		return tiempocola;
	}
	public void setTiempocola(Integer tiempocola) {
		this.tiempocola = tiempocola;
	}
	public Integer getTiempoconversacion() {
		return tiempoconversacion;
	}
	public void setTiempoconversacion(Integer tiempoconversacion) {
		this.tiempoconversacion = tiempoconversacion;
	}
	public String getAgente() {
		return agente;
	}
	public void setAgente(String agente) {
		this.agente = agente;
	}
	public int getCentral() {
		return central;
	}
	public void setCentral(int central) {
		this.central = central;
	}
	public String getTipollamada() {
		return tipollamada;
	}
	public void setTipollamada(String tipollamada) {
		this.tipollamada = tipollamada;
	}
	public String getIdproyecto() {
		return idproyecto;
	}
	public void setIdproyecto(String idproyecto) {
		this.idproyecto = idproyecto;
	}
	public String getProyectocisco() {
		return proyectocisco;
	}
	public void setProyectocisco(String proyectocisco) {
		this.proyectocisco = proyectocisco;
	}
	@Override
	public String toString() {
		return "BeanLlamadas [idllamada=" + idllamada + ", fechainicio=" + fechainicio + ", tiempocola=" + tiempocola
				+ ", tiempoconversacion=" + tiempoconversacion + ", agente=" + agente + ", central=" + central
				+ ", tipollamada=" + tipollamada + ", idproyecto=" + idproyecto + ", proyectocisco=" + proyectocisco
				+ ", llamadasMayores=" + llamadasMayores + ", llamadasMenores=" + llamadasMenores
				+ ", llamadasContestadas=" + llamadasContestadas + ", numerodiaSemana=" + numerodiaSemana
				+ ", nombrediaSemana=" + nombrediaSemana + ", numerodiaMes=" + numerodiaMes + ", numerohoraDia="
				+ numerohoraDia + ", strhoraDia=" + strhoraDia + ", numeroSemana=" + numeroSemana + ", strnumeroSemana="
				+ strnumeroSemana + ", tipo=" + tipo + ", tasaAbandono=" + tasaAbandono + ", umbral=" + umbral + "]";
	}

	
	
	
	
	
	

}
