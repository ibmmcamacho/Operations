package com.pe.ibm.bean;

public class BeanReporteLlamadas {
	

	private String codigo="";
	private String fechainicio="";
	private String tiempocola="";
	private String tiempoconversacion="";
	private String agente="";
	private String analista="";
	private String tipollamada="";
	private int slacola=0;
	private int tiempocolan=0;
	private String cliente="";
	private int idProyecto=0;
	private String str1="";
	private int semana = 0;
	private int tipoVista = 0;
	
	
	
	@Override
	public String toString() {
		return "BeanReporteLlamadas [codigo=" + codigo + ", fechainicio=" + fechainicio + ", tiempocola=" + tiempocola
				+ ", tiempoconversacion=" + tiempoconversacion + ", agente=" + agente + ", analista=" + analista
				+ ", tipollamada=" + tipollamada + ", slacola=" + slacola + ", tiempocolan=" + tiempocolan
				+ ", cliente=" + cliente + ", idProyecto=" + idProyecto + ", str1=" + str1 + ", semana=" + semana
				+ ", tipoVista=" + tipoVista + "]";
	}
	
	
	public int getTipoVista() {
		return tipoVista;
	}
	public void setTipoVista(int tipoVista) {
		this.tipoVista = tipoVista;
	}
	public int getSemana() {
		return semana;
	}
	public void setSemana(int semana) {
		this.semana = semana;
	}
	public String getStr1() {
		return str1;
	}
	public void setStr1(String str1) {
		this.str1 = str1;
	}
	public int getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(int idProyecto) {
		this.idProyecto = idProyecto;
	}
	public int getTiempocolan() {
		return tiempocolan;
	}
	public void setTiempocolan(int tiempocolan) {
		this.tiempocolan = tiempocolan;
	}
	public String getCliente() {
		return cliente;
	}
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getFechainicio() {
		return fechainicio;
	}
	public void setFechainicio(String fechainicio) {
		
		if(fechainicio.equals(" ")||fechainicio.equals(null)||fechainicio.equals("0")){
			this.fechainicio =" ";
		}else{
			this.fechainicio = fechainicio.substring(0, 19);	
		}
		
	}

	public String getTiempocola() {
		return tiempocola;
	}
	public void setTiempocola(String tiempocola) {
		
		if(tiempocola.equals(" ")||tiempocola.equals(null)||tiempocola.equals("0") ){
			this.tiempocola =" ";
		}else {
			this.tiempocolan=Integer.parseInt(tiempocola);
			this.tiempocola = formatoTiempo(tiempocola);
		}
		
		
	}
	
	public int getSlacola() {
		return slacola;
	}
	public void setSlacola(int slacola) {
		if(slacola>0){
		if(this.tiempocolan>slacola){
			setTipollamada("Abandonada Mayor");
		}else{
			setTipollamada("Abandonada Menor");
		}
		
		}else{ this.slacola=slacola;}
	}
	
	
	public String getTiempoconversacion() {
		return tiempoconversacion;
	}
	public void setTiempoconversacion(String tiempoconversacion) {
		if(tiempoconversacion.equals(" ")||tiempoconversacion.equals(null)||tiempoconversacion.equals("0")){
			this.tiempoconversacion =" ";
		}else{
			this.tiempoconversacion = formatoTiempo(tiempoconversacion);	
		}

	}
	public String getAgente() {
		return agente;
	}
	public void setAgente(String agente) {
		this.agente = agente;
	}
	public String getAnalista() {
		return analista;
	}
	public void setAnalista(String analista) {
		this.analista = analista;
	}
	public String getTipollamada() {
		return tipollamada;
	}
	public void setTipollamada(String tipollamada) {
		this.tipollamada = tipollamada;
	}



	public String formatoTiempo(String promediollamadas){
		int num,hor,min,seg;
		num=Integer.parseInt(promediollamadas);
      
		 	hor=num/3600;
	        min=(num-(3600*hor))/60;
	        seg=num-((hor*3600)+(min*60));
	        
          String shora="",smin="",sseg="";
        
        if(hor<10){shora="0"+String.valueOf(hor);}else{shora=String.valueOf(hor);}
        if(min<10){smin="0"+String.valueOf(min);}else{smin=String.valueOf(min);}
        if(seg<10){sseg="0"+String.valueOf(seg);}else{sseg=String.valueOf(seg);}
        
		String nuevoformato=shora+":"+smin+":"+sseg;
		return nuevoformato;
	}
	
	

}
