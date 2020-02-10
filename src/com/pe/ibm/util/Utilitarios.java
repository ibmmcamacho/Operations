package com.pe.ibm.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Utilitarios {

	public String calcularColorEstadoSLA(String redInicio, String redFin,
		String yellowinicio, String yellowFin, String greenInicio, String greenFin, String valor){
		String valorEstado=null;
		double dredInicio= Double.parseDouble(redInicio);
		double dredFin= Double.parseDouble(redFin);
		double dyellowInicio= Double.parseDouble(yellowinicio);
		double dyellowFin= Double.parseDouble(yellowFin);
		double dgreenInicio= Double.parseDouble(greenInicio);
		double dgreenFin= Double.parseDouble(greenFin);
		double dvalor= Double.parseDouble(valor);
		
		if(dvalor>=dgreenInicio && dvalor<=dgreenFin ){
			valorEstado="0";	
		}
		if(dvalor>=dyellowInicio && dvalor<=dyellowFin ){
			valorEstado="1";
		}
		if(dvalor>=dredInicio && dvalor<=dredFin ){
			valorEstado="2";
		}
		
		
		return valorEstado;
	}
	
	
	public String convierteAformatoHHMMSS(double minutos){
		int hor,min,seg;
		double dminutos= minutos;

		 	hor=(int)(dminutos/3600);
	        min=(int)(dminutos);
	        seg=(int)((dminutos-min)*60);
 
          String shora="",smin="",sseg="";
        
        if(hor<10){shora="0"+String.valueOf(hor);}else{shora=String.valueOf(hor);}
        if(min<10){smin="0"+String.valueOf(min);}else{smin=String.valueOf(min);}
        if(seg<10){sseg="0"+String.valueOf(seg);}else{sseg=String.valueOf(seg);}
        
		String nuevoformato=shora+":"+smin+":"+sseg;

		return nuevoformato;
	}
	
	public int convierteAformatoSS(String HHMMSS){
		int hor,min,seg;

		 	hor=(Integer.parseInt(HHMMSS.substring(0,2)))*3600;
	        min=(Integer.parseInt(HHMMSS.substring(3,5)))*60;
	        seg=(Integer.parseInt(HHMMSS.substring(6,8)));

 
	    int totalsegundos= hor+min+seg;

		return totalsegundos;
	}
	
	public String convierteAformatoMMSS(BigDecimal minutos){
		int min,seg;
		double dminutos= minutos.doubleValue();
	        min=(int)(dminutos);
	        
	        
	      BigDecimal bmin = new BigDecimal(min);
	      BigDecimal segundos = new BigDecimal("0.0");
	      BigDecimal base = new BigDecimal("60"); 
	      segundos = minutos.subtract(bmin).multiply(base).setScale(0,RoundingMode.CEILING);
          String smin="",sseg="";
          
           seg=segundos.intValue();
	       smin=String.valueOf(min);
	       sseg=String.valueOf(seg);
        
		String nuevoformato=smin+"m "+sseg+"s";

		return nuevoformato;
	}
	
	public String convierteAformatoSS(BigDecimal segundos){
		int seg = redondeaCeroDecimal(segundos);      
	               
		String nuevoformato=seg+"s";

		return nuevoformato;
	}
	
	
	public BigDecimal convierteASoloMinutos(String FormatoHoraMinutoSegundo){
		int segundos= extraerSegundos(FormatoHoraMinutoSegundo);
		int minutos= extraerMinutos(FormatoHoraMinutoSegundo);
	    int horas= extraerHoras(FormatoHoraMinutoSegundo);
	    
	    BigDecimal numerador = new BigDecimal(segundos);
	    BigDecimal denominador = new BigDecimal("60");
	    BigDecimal division = numerador.divide(denominador,15,RoundingMode.CEILING);
	    BigDecimal bsegundos= division;
	    BigDecimal bminutos= new BigDecimal(minutos);
	    BigDecimal bhoras= new BigDecimal(horas*60);
		BigDecimal totalminutos=new BigDecimal("0.0");
		totalminutos=totalminutos.add(bsegundos).add(bminutos).add(bhoras);

		return totalminutos;
	}
	
	public BigDecimal convierteDeSegundosAMinutos(String Formatosegundos){
	
	    BigDecimal numerador = new BigDecimal(Formatosegundos);
	    BigDecimal denominador = new BigDecimal("60");
	    BigDecimal division = numerador.divide(denominador,15,RoundingMode.CEILING);
	    BigDecimal bminutos= division;
		return bminutos;
	}
	
	public BigDecimal convierteDeSegundosAHoras(String Formatosegundos){
		
	    BigDecimal numerador = new BigDecimal(Formatosegundos);
	    BigDecimal denominador = new BigDecimal("3600");
	    BigDecimal division = numerador.divide(denominador,16,RoundingMode.CEILING);
	    BigDecimal bhoras= division;
		return bhoras;
	}
	
	
	public double redondeaDosDecimal(BigDecimal valor){
		double nuevoValor=0.00;
		if(valor.doubleValue() > 0.00) {
			valor = valor.setScale(2, RoundingMode.HALF_UP);	
			nuevoValor=valor.doubleValue();
		}

		return nuevoValor;
	}
	
	public int redondeaCeroDecimal(BigDecimal valor){
		int nuevoValor=0;
		valor = valor.setScale(0, RoundingMode.HALF_UP);
		nuevoValor=valor.intValue();
		return nuevoValor;
	}
	public int extraerSegundos(String FormatoHoraMinutoSegundo){
		int i=0;
		i=Integer.parseInt(FormatoHoraMinutoSegundo.substring(6,8));	
		return i;
	}
	
	public int extraerMinutos(String FormatoHoraMinutoSegundo){
		int i=0;
		i=Integer.parseInt(FormatoHoraMinutoSegundo.substring(3,5));	
		return i;
	}
	
	public int extraerHoras(String FormatoHoraMinutoSegundo){
		int i=0;
		i=Integer.parseInt(FormatoHoraMinutoSegundo.substring(0,2));	
		return i;
	}
	
	public String obtenerfechainicioMesAnterior() {
		// Fecha Inicial desglosada:
		Calendar fecha = Calendar.getInstance();
		int anio = fecha.get(Calendar.YEAR);
		int mes = fecha.get(Calendar.MONTH) + 1;
		if(mes==1){
		mes=12;	
		anio=anio-1;
		}else{
		mes=mes-1;	
		}
		String aniostring = String.valueOf(anio);
		String messtring;
		if (mes < 10) {
			messtring = "0" + String.valueOf(mes);
		} else {
			messtring = String.valueOf(mes);
		}

		String diastring = "01";

		String fechaInicio = aniostring + "-" + messtring + "-" + diastring+" "+"00:00:00.0";
		return fechaInicio;
	}
	
	public String obtenerfechainicioactual() {
		// Fecha Inicial desglosada:
		Calendar fecha = Calendar.getInstance();
		int anio = fecha.get(Calendar.YEAR);
		int mes = fecha.get(Calendar.MONTH) + 1;
		String aniostring = String.valueOf(anio);
		String messtring;
		if (mes < 10) {
			messtring = "0" + String.valueOf(mes);
		} else {
			messtring = String.valueOf(mes);
		}

		String diastring = "01";

		String fechaInicio = aniostring + "-" + messtring + "-" + diastring+" "+"00:00:00.0";
		return fechaInicio;
	}

	public String obtenerfechafinactual() {

		// Fecha actual desglosada:
		Calendar fecha = Calendar.getInstance();
		int anio = fecha.get(Calendar.YEAR);
		String aniostring = String.valueOf(anio);
		int mes = fecha.get(Calendar.MONTH) + 1;
		String messtring;
		if (mes < 10) {
			messtring = "0" + String.valueOf(mes);
		} else {
			messtring = String.valueOf(mes);
		}
		int dia = fecha.get(Calendar.DAY_OF_MONTH);
		String diastring;
		if (dia < 10) {
			diastring = "0" + String.valueOf(dia);
		} else {
			diastring = String.valueOf(dia);
		}
		String fechaFinal = aniostring + "-" + messtring + "-" + diastring+" "+"23:59:59.0";;
		return fechaFinal;
	}
	
	
	
	public String extraerMes(String aaaammdd){
		String mes=null;
		mes=String.valueOf(Integer.parseInt(aaaammdd.substring(5, 7)));
		return mes;
	}
	
	public String extraerAnio(String aaaammdd){
		String anio=null;
		anio=String.valueOf(Integer.parseInt(aaaammdd.substring(0, 4)));
		return anio;
	}
	
	public String generarID(String idsla, String mes, String anio){
		String formatoResultadoid=null;
		int numeroidsla=Integer.parseInt(idsla);
		String letraidsla=null;
		int numeromes=Integer.parseInt(mes);
		String formatoidsla=null;
		String formatomes=null;
		
		if(numeromes<10){
			formatomes="0"+numeromes;
		}else{
			formatomes=String.valueOf(numeromes);
		}
		
		if(numeroidsla<10){
			letraidsla="0"+numeroidsla;
		}else{
			letraidsla=String.valueOf(numeroidsla);
		}
		
		if(numeroidsla<=99){
			formatoidsla="00000000"+letraidsla;
		}else if (numeroidsla>99&&numeroidsla<=999){
			formatoidsla="0000000"+letraidsla;
		}else if (numeroidsla>999&&numeroidsla<=9999){
			formatoidsla="000000"+letraidsla;
		}else if (numeroidsla>9999&&numeroidsla<=99999){
			formatoidsla="00000"+letraidsla;
		}else if (numeroidsla>99999&&numeroidsla<=999999){
			formatoidsla="0000"+letraidsla;
		}else if (numeroidsla>999999&&numeroidsla<=9999999){
			formatoidsla="000"+letraidsla;
		}else if (numeroidsla>9999999&&numeroidsla<=99999999){
			formatoidsla="00"+letraidsla;
		}else if (numeroidsla>99999999&&numeroidsla<=999999999){
			formatoidsla="0"+letraidsla;
		}
		
		formatoResultadoid="1-"+formatoidsla+anio+formatomes+"-0";
		
		return formatoResultadoid;
	}
	
	
	
	public long getDiffDates(Date fechaInicio, Date fechaFin, int tipo) {
		/**

		 * Calcula la diferencia entre dos fechas. Devuelve el resultado en dnias, meses o anios segnin sea el valor del parnimetro 'tipo'

		 * @param fechaInicio Fecha inicial

		 * @param fechaFin Fecha final

		 * @param tipo 0=TotalAnios; 1=TotalMeses; 2=TotalDnias; 3=MesesDelAnio; 4=DiasDelMes

		 * @return numero de dnias, meses o anios de diferencia

		 */

		// Fecha inicio

		Calendar calendarInicio = Calendar.getInstance();

		calendarInicio.setTime(fechaInicio);

		int diaInicio = calendarInicio.get(Calendar.DAY_OF_MONTH);

		int mesInicio = calendarInicio.get(Calendar.MONTH) + 1; // 0 Enero, 11 Diciembre

		int anioInicio = calendarInicio.get(Calendar.YEAR);

	 

		// Fecha fin

		Calendar calendarFin = Calendar.getInstance();

		calendarFin.setTime(fechaFin);

		int diaFin = calendarFin.get(Calendar.DAY_OF_MONTH);

		int mesFin = calendarFin.get(Calendar.MONTH) + 1; // 0 Enero, 11 Diciembre

		int anioFin = calendarFin.get(Calendar.YEAR);

	 

		int anios = 0;

		int mesesPorAnio = 0;

		int diasPorMes = 0;

		int diasTipoMes = 0;

	 

		//

		// Calculo de dnias del mes

		//

		if (mesInicio == 2) {

			// Febrero

			if ((anioFin % 4 == 0) && ((anioFin % 100 != 0) || (anioFin % 400 == 0))) {

				// Bisiesto

				diasTipoMes = 29;

			} else {

				// No bisiesto

				diasTipoMes = 28;

			}

		} else if (mesInicio <= 7) {

			// De Enero a Julio los meses pares tienen 30 y los impares 31

			if (mesInicio % 2 == 0) {

				diasTipoMes = 30;

			} else {

				diasTipoMes = 31;

			}

		} else if (mesInicio > 7) {

			// De Julio a Diciembre los meses pares tienen 31 y los impares 30

			if (mesInicio % 2 == 0) {

				diasTipoMes = 31;

			} else {

				diasTipoMes = 30;

			}

		}

	 

	 

		//

		// Calculo de diferencia de anio, mes y dia

		//

		if ((anioInicio > anioFin) || (anioInicio == anioFin && mesInicio > mesFin)

				|| (anioInicio == anioFin && mesInicio == mesFin && diaInicio > diaFin)) {

			// La fecha de inicio es posterior a la fecha fin

			

			return -1;

		} else {

			if (mesInicio <= mesFin) {

				anios = anioFin - anioInicio;

				if (diaInicio <= diaFin) {

					mesesPorAnio = mesFin - mesInicio;

					diasPorMes = diaFin - diaInicio;

				} else {

					if (mesFin == mesInicio) {

						anios = anios - 1;

					}

					mesesPorAnio = (mesFin - mesInicio - 1 + 12) % 12;

					diasPorMes = diasTipoMes - (diaInicio - diaFin);

				}

			} else {

				anios = anioFin - anioInicio - 1;

		

				if (diaInicio > diaFin) {

					mesesPorAnio = mesFin - mesInicio - 1 + 12;

					diasPorMes = diasTipoMes - (diaInicio - diaFin);

				} else {

					mesesPorAnio = mesFin - mesInicio + 12;

					diasPorMes = diaFin - diaInicio;

				}

			}

		}

//		System.out.println("Han transcurrido " + anios + " Anios, " + mesesPorAnio + " Meses y " + diasPorMes + " Dnias.");		

	 

		//

		// Totales

		//

		long returnValue = -1;

	 

		switch (tipo) {

			case 0:

				// Total Anios

				returnValue = anios;

				 System.out.println("Total anios: " + returnValue + " Anios.");

				break;

	 

			case 1:

				// Total Meses

				returnValue = anios * 12 + mesesPorAnio;

				 System.out.println("Total meses: " + returnValue + " Meses.");

				break;

	 

			case 2:

				// Total Dias (se calcula a partir de los milisegundos por dnia)

				long millsecsPerDay = 86400000; // Milisegundos al dnia

				returnValue = (fechaFin.getTime() - fechaInicio.getTime()) / millsecsPerDay;

				 System.out.println("Total dnias: " + returnValue + " Dnias.");

				break;

	 

			case 3:

				// Meses del anio

				returnValue = mesesPorAnio;

				// System.out.println("Meses del anio: " + returnValue);

				break;

	 

			case 4:

				// Dias del mes

				returnValue = diasPorMes;

				// System.out.println("Dias del mes: " + returnValue);

				break;

	 

			default:

				break;

		}

	 

		return returnValue;

	}
	
	public String getHoraActual() {
	    Date ahora = new Date();
	    SimpleDateFormat formateador = new SimpleDateFormat("hh:mm:ss");
	    return formateador.format(ahora);
	}
	
}
