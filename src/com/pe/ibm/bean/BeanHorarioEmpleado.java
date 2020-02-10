package com.pe.ibm.bean;

public class BeanHorarioEmpleado {

	int id;
	int idempleado;
	String empleado;
	String fechainicio;
	String horainicio;
	String fechayhorainicio;
	String fechafin;
	String horafin;
	String fechayhorafin;
	String observaciones;
	int duplicar;
	String fechaDuplicar;
	int idteam;
	int idRegistrador;
	
	public BeanHorarioEmpleado() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdempleado() {
		return idempleado;
	}

	public void setIdempleado(int idempleado) {
		this.idempleado = idempleado;
	}

	public String getEmpleado() {
		return empleado;
	}

	public void setEmpleado(String empleado) {
		this.empleado = empleado;
	}

	public String getFechainicio() {
		return fechainicio;
	}

	public void setFechainicio(String fechainicio) {
		this.fechainicio = fechainicio;
	}

	public String getHorainicio() {
		return horainicio;
	}

	public void setHorainicio(String horainicio) {
		this.horainicio = horainicio;
	}

	public String getFechayhorainicio() {
		return fechayhorainicio;
	}

	public void setFechayhorainicio(String fechayhorainicio) {
		this.fechayhorainicio = fechayhorainicio;
	}

	public String getFechafin() {
		return fechafin;
	}

	public void setFechafin(String fechafin) {
		this.fechafin = fechafin;
	}

	public String getHorafin() {
		return horafin;
	}

	public void setHorafin(String horafin) {
		this.horafin = horafin;
	}

	public String getFechayhorafin() {
		return fechayhorafin;
	}

	public void setFechayhorafin(String fechayhorafin) {
		this.fechayhorafin = fechayhorafin;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public int getIdteam() {
		return idteam;
	}

	public void setIdteam(int idteam) {
		this.idteam = idteam;
	}

	public int getIdRegistrador() {
		return idRegistrador;
	}

	public void setIdRegistrador(int idRegistrador) {
		this.idRegistrador = idRegistrador;
	}
	
	
	public int getDuplicar() {
		return duplicar;
	}

	public void setDuplicar(int duplicar) {
		this.duplicar = duplicar;
	}

	public String getFechaDuplicar() {
		return fechaDuplicar;
	}

	public void setFechaDuplicar(String fechaDuplicar) {
		this.fechaDuplicar = fechaDuplicar;
	}

	public void setConcatHorarioInicio() {
		this.horainicio = (this.horainicio.length() == 5 ? this.horainicio + ":00" : this.horainicio);
		this.fechayhorainicio = this.fechainicio + " " + this.horainicio;
	}
	
	public void setConcatHorarioFin() {
		this.horafin = (this.horafin.length() == 5 ? this.horafin + ":00" : this.horafin);
		this.fechayhorafin = this.fechafin + " " + this.horafin;
	}

	@Override
	public String toString() {
		return "BeanHorarioEmpleado [id=" + id + ", idempleado=" + idempleado + ", empleado=" + empleado
				+ ", fechainicio=" + fechainicio + ", horainicio=" + horainicio + ", fechayhorainicio="
				+ fechayhorainicio + ", fechafin=" + fechafin + ", horafin=" + horafin + ", fechayhorafin="
				+ fechayhorafin + ", observaciones=" + observaciones + ", duplicar=" + duplicar + ", fechaDuplicar="
				+ fechaDuplicar + ", idteam=" + idteam + ", idRegistrador=" + idRegistrador + "]";
	}
	
	
}
