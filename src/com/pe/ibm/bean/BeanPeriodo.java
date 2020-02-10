package com.pe.ibm.bean;

public class BeanPeriodo {
	
	private int idPeriodo;
	private String descripcion;
	private int estado;	
	//Nueva Implementación
//	private int id_Periodo;
	private String titulo;
	private String fecha_reg;
	private String usuario_reg;
//	private int estado;
	private int id_tipo_periodo;
	private String tipo_periodo;
	private String usu_update;
	private String fecha_update;
	private String fecha_Ini;
	private String fecha_Fin;
	private int intervalo;	
	private int  dia_habil;
	private int dia_feriado;
	
	public BeanPeriodo() {
		//Constructor vacio
	}
	
	public BeanPeriodo(int idPeriodo, String descripcion, String titulo, String fecha_reg, String usuario_reg, int estado, int id_tipo_periodo, String tipo_periodo, String usu_update, String fecha_update, String fecha_Ini, 
					   String fecha_Fin, int intervalo, int dia_habil, int dia_feriado) {
		this.idPeriodo = idPeriodo;
		this.descripcion = descripcion;
		//Nueva Implementación 
		this.titulo = titulo;
		this.fecha_reg = fecha_reg;
		this.usuario_reg = usuario_reg;
		this.estado = estado;
		this.id_tipo_periodo = id_tipo_periodo;
		this.tipo_periodo = tipo_periodo;
		this.usu_update = usu_update;
		this.fecha_update = fecha_update;
		this.fecha_Ini = fecha_Ini;
		this.fecha_Fin = fecha_Fin;
		this.intervalo = intervalo;
		this.dia_habil = dia_habil;
		this.dia_feriado = dia_habil;
	}
	
	
	public int getIdPeriodo() {
		return idPeriodo;
	}
	public void setIdPeriodo(int idPeriodo) {
		this.idPeriodo = idPeriodo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	//Nueva Implementación 
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getFecha_reg() {
		return fecha_reg;
	}
	public void setFecha_reg(String fecha_reg) {
		this.fecha_reg = fecha_reg;
	}
	public String getUsuario_reg() {
		return usuario_reg;
	}
	public void setUsuario_reg(String usuario_reg) {
		this.usuario_reg = usuario_reg;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public int getId_tipo_periodo() {
		return id_tipo_periodo;
	}
	public void setId_tipo_periodo(int id_tipo_periodo) {
		this.id_tipo_periodo = id_tipo_periodo;
	}
	public String getTipo_periodo() {
		return tipo_periodo;
	}
	public void setTipo_periodo(String tipo_periodo) {
		this.tipo_periodo = tipo_periodo;
	}
	public String getUsu_update() {
		return usu_update;
	}
	public void setUsu_update(String usu_update) {
		this.usu_update = usu_update;
	}
	public String getFecha_update() {
		return fecha_update;
	}
	public void setFecha_update(String fecha_update) {
		this.fecha_update = fecha_update;
	}
	public String getFecha_Ini() {
		return fecha_Ini;
	}
	public void setFecha_Ini(String fecha_Ini) {
		this.fecha_Ini = fecha_Ini;
	}
	public String getFecha_Fin() {
		return fecha_Fin;
	}
	public void setFecha_Fin(String fecha_Fin) {
		this.fecha_Fin = fecha_Fin;
	}
	public int getIntervalo() {
		return intervalo;
	}
	public void setIntervalo(int intervalo) {
		this.intervalo = intervalo;
	}
	public int getDia_habil() {
		return dia_habil;
	}
	public void setDia_habil(int dia_habil) {
		this.dia_habil = dia_habil;
	}
	public int getDia_feriado() {
		return dia_feriado;
	}
	public void setDia_feriado(int dia_feriado) {
		this.dia_feriado = dia_feriado;
	}
	
	
	@Override
	public String toString() {
		return "BeanPeriodo ["
				+ "idPeriodo=" + idPeriodo 				
				+ ", descripcion=" + descripcion
				+ ", titulo=" + titulo 			
				+ ", fecha_reg=" + fecha_reg
				+ ", usuario_reg=" + usuario_reg	
				+ ", estado=" + estado	
				+ ", id_tipo_periodo=" + id_tipo_periodo
				+ ", tipo_periodo=" + tipo_periodo	
				+ ", usu_update=" + usu_update	
				+ ", fecha_update=" + fecha_update	
				+ ", fecha_Ini=" + fecha_Ini	
				+ ", fecha_Fin=" + fecha_Fin	
				+ ", intervalo=" + intervalo	
				+ ", dia_habil=" + dia_habil
				+ ", dia_feriado=" + dia_feriado				
				+ "]";
	}
	
	
}
