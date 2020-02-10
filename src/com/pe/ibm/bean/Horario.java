package com.pe.ibm.bean;

import java.sql.Timestamp;

public class Horario {
	
	private String proyectoid=null;
	private boolean lunes=false;
	private Timestamp lunes_inicio=null;
	private Timestamp lunes_fin=null;
	private boolean martes=false;
	private Timestamp martes_inicio=null;
	private Timestamp martes_fin=null;
	private boolean miercoles=false;
	private Timestamp miercoles_inicio=null;
	private Timestamp miercoles_fin=null;
	private boolean jueves=false;
	private Timestamp jueves_inicio=null;
	private Timestamp jueves_fin=null;
	private boolean viernes=false;
	private Timestamp viernes_inicio=null;
	private Timestamp viernes_fin=null;
	private boolean sabado=false;
	private Timestamp sabado_inicio=null;
	private Timestamp sabado_fin=null;
	private boolean domingo=false;
	private Timestamp domingo_inicio=null;
	private Timestamp domingo_fin=null;
	private boolean feriado=false;
	
	
	
	
	public boolean isFeriado() {
		return feriado;
	}
	public void setFeriado(boolean feriado) {
		this.feriado = feriado;
	}
	public String getProyectoid() {
		return proyectoid;
	}
	public void setProyectoid(String proyectoid) {
		this.proyectoid = proyectoid;
	}
	public boolean isLunes() {
		return lunes;
	}
	public void setLunes(boolean lunes) {
		this.lunes = lunes;
	}
	public Timestamp getLunes_inicio() {
		return lunes_inicio;
	}
	public void setLunes_inicio(Timestamp lunes_inicio) {
		this.lunes_inicio = lunes_inicio;
	}
	public Timestamp getLunes_fin() {
		return lunes_fin;
	}
	public void setLunes_fin(Timestamp lunes_fin) {
		this.lunes_fin = lunes_fin;
	}
	public boolean isMartes() {
		return martes;
	}
	public void setMartes(boolean martes) {
		this.martes = martes;
	}
	public Timestamp getMartes_inicio() {
		return martes_inicio;
	}
	public void setMartes_inicio(Timestamp martes_inicio) {
		this.martes_inicio = martes_inicio;
	}
	public Timestamp getMartes_fin() {
		return martes_fin;
	}
	public void setMartes_fin(Timestamp martes_fin) {
		this.martes_fin = martes_fin;
	}
	public boolean isMiercoles() {
		return miercoles;
	}
	public void setMiercoles(boolean miercoles) {
		this.miercoles = miercoles;
	}
	public Timestamp getMiercoles_inicio() {
		return miercoles_inicio;
	}
	public void setMiercoles_inicio(Timestamp miercoles_inicio) {
		this.miercoles_inicio = miercoles_inicio;
	}
	public Timestamp getMiercoles_fin() {
		return miercoles_fin;
	}
	public void setMiercoles_fin(Timestamp miercoles_fin) {
		this.miercoles_fin = miercoles_fin;
	}
	public boolean isJueves() {
		return jueves;
	}
	public void setJueves(boolean jueves) {
		this.jueves = jueves;
	}
	public Timestamp getJueves_inicio() {
		return jueves_inicio;
	}
	public void setJueves_inicio(Timestamp jueves_inicio) {
		this.jueves_inicio = jueves_inicio;
	}
	public Timestamp getJueves_fin() {
		return jueves_fin;
	}
	public void setJueves_fin(Timestamp jueves_fin) {
		this.jueves_fin = jueves_fin;
	}
	public boolean isViernes() {
		return viernes;
	}
	public void setViernes(boolean viernes) {
		this.viernes = viernes;
	}
	public Timestamp getViernes_inicio() {
		return viernes_inicio;
	}
	public void setViernes_inicio(Timestamp viernes_inicio) {
		this.viernes_inicio = viernes_inicio;
	}
	public Timestamp getViernes_fin() {
		return viernes_fin;
	}
	public void setViernes_fin(Timestamp viernes_fin) {
		this.viernes_fin = viernes_fin;
	}
	public boolean isSabado() {
		return sabado;
	}
	public void setSabado(boolean sabado) {
		this.sabado = sabado;
	}
	public Timestamp getSabado_inicio() {
		return sabado_inicio;
	}
	public void setSabado_inicio(Timestamp sabado_inicio) {
		this.sabado_inicio = sabado_inicio;
	}
	public Timestamp getSabado_fin() {
		return sabado_fin;
	}
	public void setSabado_fin(Timestamp sabado_fin) {
		this.sabado_fin = sabado_fin;
	}
	public boolean isDomingo() {
		return domingo;
	}
	public void setDomingo(boolean domingo) {
		this.domingo = domingo;
	}
	public Timestamp getDomingo_inicio() {
		return domingo_inicio;
	}
	public void setDomingo_inicio(Timestamp domingo_inicio) {
		this.domingo_inicio = domingo_inicio;
	}
	public Timestamp getDomingo_fin() {
		return domingo_fin;
	}
	public void setDomingo_fin(Timestamp domingo_fin) {
		this.domingo_fin = domingo_fin;
	}
	@Override
	public String toString() {
		return "Horario [proyectoid=" + proyectoid + ", lunes=" + lunes + ", lunes_inicio=" + lunes_inicio
				+ ", lunes_fin=" + lunes_fin + ", martes=" + martes + ", martes_inicio=" + martes_inicio
				+ ", martes_fin=" + martes_fin + ", miercoles=" + miercoles + ", miercoles_inicio=" + miercoles_inicio
				+ ", miercoles_fin=" + miercoles_fin + ", jueves=" + jueves + ", jueves_inicio=" + jueves_inicio
				+ ", jueves_fin=" + jueves_fin + ", viernes=" + viernes + ", viernes_inicio=" + viernes_inicio
				+ ", viernes_fin=" + viernes_fin + ", sabado=" + sabado + ", sabado_inicio=" + sabado_inicio
				+ ", sabado_fin=" + sabado_fin + ", domingo=" + domingo + ", domingo_inicio=" + domingo_inicio
				+ ", domingo_fin=" + domingo_fin + ", feriado=" + feriado + ", isFeriado()=" + isFeriado()
				+ ", getProyectoid()=" + getProyectoid() + ", isLunes()=" + isLunes() + ", getLunes_inicio()="
				+ getLunes_inicio() + ", getLunes_fin()=" + getLunes_fin() + ", isMartes()=" + isMartes()
				+ ", getMartes_inicio()=" + getMartes_inicio() + ", getMartes_fin()=" + getMartes_fin()
				+ ", isMiercoles()=" + isMiercoles() + ", getMiercoles_inicio()=" + getMiercoles_inicio()
				+ ", getMiercoles_fin()=" + getMiercoles_fin() + ", isJueves()=" + isJueves() + ", getJueves_inicio()="
				+ getJueves_inicio() + ", getJueves_fin()=" + getJueves_fin() + ", isViernes()=" + isViernes()
				+ ", getViernes_inicio()=" + getViernes_inicio() + ", getViernes_fin()=" + getViernes_fin()
				+ ", isSabado()=" + isSabado() + ", getSabado_inicio()=" + getSabado_inicio() + ", getSabado_fin()="
				+ getSabado_fin() + ", isDomingo()=" + isDomingo() + ", getDomingo_inicio()=" + getDomingo_inicio()
				+ ", getDomingo_fin()=" + getDomingo_fin() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}


	
	
	

}
