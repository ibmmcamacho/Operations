package com.pe.ibm.business;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.Feriado;
import com.pe.ibm.bean.Horario;
import com.pe.ibm.util.Utilitarios;


public class SLAHorarioService {
	
	public int aplicarHorarios(Calendar fechaInicial, Calendar fechaFinal, String idproyecto, Horario bean, SqlSessionFactory ssf){
		
		int resultado=0;
		resultado= validaDiasHabiles(fechaInicial, fechaFinal, idproyecto, bean,ssf);
		return resultado;
	}
	
	public int aplicarHorarios2(Calendar fechaInicial, Calendar fechaFinal, Horario bean,List<Feriado> listaFeriados){
		
		int resultado=0;
		resultado= validaDiasHabiles2(fechaInicial, fechaFinal, bean,listaFeriados);
		return resultado;
	}
	
	public int validaDiasHabiles2(Calendar fechaInicial, Calendar fechaFinal, Horario bean, List<Feriado> listaFeriados){
		
		int totalSegundosAcumulados=0;
		
		//Obtener dia de la semana de la fecha inicial recibida
		int diasemana= fechaInicial.get(Calendar.DAY_OF_WEEK);
//		System.out.println("diasemana "+diasemana);
			switch(diasemana){
			
			case 1:
				if(bean.isDomingo()){
					totalSegundosAcumulados=extraerHorasValidas2(fechaInicial, fechaFinal, bean.getDomingo_inicio(), bean.getDomingo_fin(),listaFeriados,bean);	
				}else{
					totalSegundosAcumulados=0;	
				}
				break;
			case 2:
				if(bean.isLunes()){
					
					totalSegundosAcumulados=extraerHorasValidas2(fechaInicial, fechaFinal, bean.getLunes_inicio(), bean.getLunes_fin(),listaFeriados,bean);	
				}else{
					totalSegundosAcumulados=0;	
				}
				break;
			case 3:
				if(bean.isMartes()){
					
					totalSegundosAcumulados=extraerHorasValidas2(fechaInicial, fechaFinal, bean.getMartes_inicio(), bean.getMartes_fin(),listaFeriados,bean);	
				}else{
					totalSegundosAcumulados=0;	
				}
				break;
			case 4:
				if(bean.isMiercoles()){
					
					totalSegundosAcumulados=extraerHorasValidas2(fechaInicial, fechaFinal, bean.getMiercoles_inicio(), bean.getMiercoles_fin(),listaFeriados,bean);	
				}else{
					totalSegundosAcumulados=0;	
				}
				break;
			case 5:
				if(bean.isJueves()){
					
					totalSegundosAcumulados=extraerHorasValidas2(fechaInicial, fechaFinal, bean.getJueves_inicio(), bean.getJueves_fin(),listaFeriados,bean);	
				}else{
					totalSegundosAcumulados=0;	
				}
				break;
			case 6:
				if(bean.isViernes()){
					
					totalSegundosAcumulados=extraerHorasValidas2(fechaInicial, fechaFinal, bean.getViernes_inicio(), bean.getViernes_fin(),listaFeriados,bean);	
				}else{
					totalSegundosAcumulados=0;	
				}
				break;
			case 7:
				if(bean.isSabado()){
					
					totalSegundosAcumulados=extraerHorasValidas2(fechaInicial, fechaFinal, bean.getSabado_inicio(), bean.getSabado_fin(),listaFeriados,bean);	
				}else{
					totalSegundosAcumulados=0;	
				}
				break;	
			
//			default:
//				totalSegundosAcumulados=0;
//				break;
			}	
//			System.out.println("totalSegundosAcumulados "+totalSegundosAcumulados);
		return totalSegundosAcumulados;
	}

	public int validaDiasHabiles(Calendar fechaInicial, Calendar fechaFinal, String idproyecto,Horario bean, SqlSessionFactory ssf){
		
		int totalSegundosAcumulados=0;
		
		//Obtener dia de la semana de la fecha inicial recibida
		int diasemana= fechaInicial.get(Calendar.DAY_OF_WEEK);

			switch(diasemana){
			
			case 1:
				if(bean.isDomingo()){
					
					totalSegundosAcumulados=extraerHorasValidas(fechaInicial, fechaFinal, bean.getDomingo_inicio(), bean.getDomingo_fin(),idproyecto,ssf);	
				}else{
					totalSegundosAcumulados=0;	
				}
				break;
			case 2:
				if(bean.isLunes()){
					
					totalSegundosAcumulados=extraerHorasValidas(fechaInicial, fechaFinal, bean.getLunes_inicio(), bean.getLunes_fin(),idproyecto,ssf);	
				}else{
					totalSegundosAcumulados=0;	
				}
				break;
			case 3:
				if(bean.isMartes()){
					
					totalSegundosAcumulados=extraerHorasValidas(fechaInicial, fechaFinal, bean.getMartes_inicio(), bean.getMartes_fin(),idproyecto,ssf);	
				}else{
					totalSegundosAcumulados=0;	
				}
				break;
			case 4:
				if(bean.isMiercoles()){
					
					totalSegundosAcumulados=extraerHorasValidas(fechaInicial, fechaFinal, bean.getMiercoles_inicio(), bean.getMiercoles_fin(),idproyecto,ssf);	
				}else{
					totalSegundosAcumulados=0;	
				}
				break;
			case 5:
				if(bean.isJueves()){
					
					totalSegundosAcumulados=extraerHorasValidas(fechaInicial, fechaFinal, bean.getJueves_inicio(), bean.getJueves_fin(),idproyecto,ssf);	
				}else{
					totalSegundosAcumulados=0;	
				}
				break;
			case 6:
				if(bean.isViernes()){
					
					totalSegundosAcumulados=extraerHorasValidas(fechaInicial, fechaFinal, bean.getViernes_inicio(), bean.getViernes_fin(),idproyecto,ssf);	
				}else{
					totalSegundosAcumulados=0;	
				}
				break;
			case 7:
				if(bean.isSabado()){
					
					totalSegundosAcumulados=extraerHorasValidas(fechaInicial, fechaFinal, bean.getSabado_inicio(), bean.getSabado_fin(),idproyecto,ssf);	
				}else{
					totalSegundosAcumulados=0;	
				}
				break;	
			
			default:
				totalSegundosAcumulados=0;
				break;
			}	
		
		return totalSegundosAcumulados;
	}
	
	public boolean validaDiaServicio(Calendar fecha, Horario bean,String idproyecto, SqlSessionFactory ssf){		
		//Obtener dia de la semana de la fecha inicial recibida
		int diasemana= fecha.get(Calendar.DAY_OF_WEEK);
		boolean flag = false;
			switch(diasemana){
			
			case 1:
				if(bean.isDomingo()){
					flag = validaFeriados(fecha, idproyecto,ssf);
				}
				break;
			case 2:
				if(bean.isLunes()){
					flag = validaFeriados(fecha, idproyecto,ssf);
				}
				break;
			case 3:
				if(bean.isMartes()){
					flag = validaFeriados(fecha, idproyecto,ssf);
				}
				break;
			case 4:
				if(bean.isMiercoles()){
					flag = validaFeriados(fecha, idproyecto,ssf);
				}
				break;
			case 5:
				if(bean.isJueves()){
					flag = validaFeriados(fecha, idproyecto,ssf);
				}
				break;
			case 6:
				if(bean.isViernes()){
					flag = validaFeriados(fecha, idproyecto,ssf);
				}
				break;
			case 7:
				if(bean.isSabado()){
					flag = validaFeriados(fecha, idproyecto,ssf);
				}
				break;
			}	
		
		return flag;
	}
	
	public boolean validaDiaServicioDiaHabil(Calendar fecha, Horario bean,String idproyecto, SqlSessionFactory ssf){		
		//Obtener dia de la semana de la fecha inicial recibida
		int diasemana= fecha.get(Calendar.DAY_OF_WEEK);
		boolean flag = false;
			switch(diasemana){
			
			case 1:
				flag = false;
				break;
			case 2:
				if(bean.isLunes()){
					flag = validaFeriados(fecha, idproyecto,ssf);
				}
				break;
			case 3:
				if(bean.isMartes()){
					flag = validaFeriados(fecha, idproyecto,ssf);
				}
				break;
			case 4:
				if(bean.isMiercoles()){
					flag = validaFeriados(fecha, idproyecto,ssf);
				}
				break;
			case 5:
				if(bean.isJueves()){
					flag = validaFeriados(fecha, idproyecto,ssf);
				}
				break;
			case 6:
				if(bean.isViernes()){
					flag = validaFeriados(fecha, idproyecto,ssf);
				}
				break;
			case 7:
				flag = false;
				break;
			}	
		
		return flag;
	}
	
	public boolean validaHoraServicio(Calendar fecha, Horario bean,String idproyecto){		
		//Obtener dia de la semana de la fecha inicial recibida
		int diasemana= fecha.get(Calendar.DAY_OF_WEEK);
		Utilitarios util=new Utilitarios();
		boolean flag = false;
			switch(diasemana){
			
			case 1:
				if(bean.isDomingo()){
					//Valida si esta dentro del horario 
					int totalSegundosHorario = util.convierteAformatoSS(new SimpleDateFormat("HH:mm:ss").format(new Date(bean.getDomingo_fin().getTime())));
					int totalSegundosFechaCreacion = (fecha.get(Calendar.HOUR_OF_DAY)*3600) +  (fecha.get(Calendar.MINUTE)*60) +  (fecha.get(Calendar.SECOND));
					if(totalSegundosFechaCreacion <= totalSegundosHorario) {
						flag = true;	
					}
				}
				break;
			case 2:
				if(bean.isLunes()){
					//Valida si esta dentro del horario 
					int totalSegundosHorario = util.convierteAformatoSS(new SimpleDateFormat("HH:mm:ss").format(new Date(bean.getLunes_fin().getTime())));
					int totalSegundosFechaCreacion = (fecha.get(Calendar.HOUR_OF_DAY)*3600) +  (fecha.get(Calendar.MINUTE)*60) +  (fecha.get(Calendar.SECOND));
					if(totalSegundosFechaCreacion <= totalSegundosHorario) {
						flag = true;	
					}
				}
				break;
			case 3:
				if(bean.isMartes()){
					//Valida si esta dentro del horario 
					int totalSegundosHorario = util.convierteAformatoSS(new SimpleDateFormat("HH:mm:ss").format(new Date(bean.getMartes_fin().getTime())));
					int totalSegundosFechaCreacion = (fecha.get(Calendar.HOUR_OF_DAY)*3600) +  (fecha.get(Calendar.MINUTE)*60) +  (fecha.get(Calendar.SECOND));
					if(totalSegundosFechaCreacion <= totalSegundosHorario) {
						flag = true;	
					}
				}
				break;
			case 4:
				if(bean.isMiercoles()){
					//Valida si esta dentro del horario 
					int totalSegundosHorario = util.convierteAformatoSS(new SimpleDateFormat("HH:mm:ss").format(new Date(bean.getMiercoles_fin().getTime())));
					int totalSegundosFechaCreacion = (fecha.get(Calendar.HOUR_OF_DAY)*3600) +  (fecha.get(Calendar.MINUTE)*60) +  (fecha.get(Calendar.SECOND));
					if(totalSegundosFechaCreacion <= totalSegundosHorario) {
						flag = true;	
					}
				}
				break;
			case 5:
				if(bean.isJueves()){
					//Valida si esta dentro del horario 
					int totalSegundosHorario = util.convierteAformatoSS(new SimpleDateFormat("HH:mm:ss").format(new Date(bean.getJueves_fin().getTime())));
					int totalSegundosFechaCreacion = (fecha.get(Calendar.HOUR_OF_DAY)*3600) +  (fecha.get(Calendar.MINUTE)*60) +  (fecha.get(Calendar.SECOND));
					if(totalSegundosFechaCreacion <= totalSegundosHorario) {
						flag = true;	
					}
				}
				break;
			case 6:
				if(bean.isViernes()){
					//Valida si esta dentro del horario 
					int totalSegundosHorario = util.convierteAformatoSS(new SimpleDateFormat("HH:mm:ss").format(new Date(bean.getViernes_fin().getTime())));
					int totalSegundosFechaCreacion = (fecha.get(Calendar.HOUR_OF_DAY)*3600) +  (fecha.get(Calendar.MINUTE)*60) +  (fecha.get(Calendar.SECOND));
					if(totalSegundosFechaCreacion <= totalSegundosHorario) {
						flag = true;	
					}
				}
				break;
			case 7:
				if(bean.isSabado()){
					//Valida si esta dentro del horario 
					int totalSegundosHorario = util.convierteAformatoSS(new SimpleDateFormat("HH:mm:ss").format(new Date(bean.getSabado_fin().getTime())));
					int totalSegundosFechaCreacion = (fecha.get(Calendar.HOUR_OF_DAY)*3600) +  (fecha.get(Calendar.MINUTE)*60) +  (fecha.get(Calendar.SECOND));
					if(totalSegundosFechaCreacion <= totalSegundosHorario) {
						flag = true;	
					}
				}
				break;
			}	
		
		return flag;
	}
	
	public boolean validaFeriados(Calendar fechaInicial,String idproyecto, SqlSessionFactory ssf){

		boolean flag=false;
		
		
		//Obtener dia, mes y aoo de la fecha a evaluar
		int dia= fechaInicial.get(Calendar.YEAR);
		int mes= fechaInicial.get(Calendar.MONTH)+1;
		int anio= fechaInicial.get(Calendar.DATE);
		
		String text = dia+"-"+mes+"-"+anio+" 00:00:00.0";
		Timestamp ts = Timestamp.valueOf(text);
		
		//Consultar si la fecha recibida es feriado
		FeriadoService feriado= new FeriadoService();
		boolean fechaRecibidaEsFeriado= feriado.validaFeriado(ts,ssf);

		//Consultar BD si sla aplica en feriados
		
		boolean slaAdmiteFeriados= false;
		HorarioService bean=new HorarioService();
		slaAdmiteFeriados= bean.consultarHorario(idproyecto,ssf).isFeriado();

		
		if(fechaRecibidaEsFeriado){
			if(slaAdmiteFeriados){
				//aplica formula
				flag=true;
			}else{
				flag=false;
			}
		}else{
			//aplica formula
			flag=true;
		}
		
		return flag;
		
	}
	
	public boolean validaFeriados2(Calendar fechaInicial, List<Feriado> listaFeriados, Horario beanHorario){

		boolean flag=false;
		
		
		//Obtener dia, mes y aoo de la fecha a evaluar
		int dia= fechaInicial.get(Calendar.YEAR);
		int mes= fechaInicial.get(Calendar.MONTH)+1;
		int anio= fechaInicial.get(Calendar.DATE);
		
		String text = dia+"-"+mes+"-"+anio+" 00:00:00.0";
		Timestamp ts = Timestamp.valueOf(text);
		
		//Consultar si la fecha recibida es feriado
		boolean fechaRecibidaEsFeriado= false;
		
		for(int i= 0; i< listaFeriados.size(); i++) {
			if(new SimpleDateFormat("yyyy-MM-dd").format(new Date(listaFeriados.get(i).getFecha().getTime())) == new SimpleDateFormat("yyyy-MM-dd").format(new Date(fechaInicial.getTimeInMillis()))) {
				fechaRecibidaEsFeriado = true;	
			}
		}

		//Consultar BD si sla aplica en feriados
		
		boolean slaAdmiteFeriados= false;
		slaAdmiteFeriados= beanHorario.isFeriado();

		
		if(fechaRecibidaEsFeriado){
			if(slaAdmiteFeriados){
				//aplica formula
				flag=true;
			}else{
				flag=false;
			}
		}else{
			//aplica formula
			flag=true;
		}
		
		return flag;
		
	}
	
public int extraerHorasValidas2(Calendar fechaInicial, Calendar fechaFinal, Timestamp BDhorarioInicio, Timestamp BDhorarioFin,List<Feriado> listaFeriados, Horario beanHorario){
		
		
		// Variables auxiliares para almacenamiento y asignacion de fechas validas
		int totalSegundosAcumulados=0;
		int auxInicialTotalSegundos=0;
		int auxFinTotalSegundos=0;
		
		boolean flag = validaFeriados2(fechaInicial, listaFeriados, beanHorario);
		if(flag){

				// Obtener horas, minutos, segundos y segundos acumulados de la fecha inicial recibida
				int inicialhora= fechaInicial.get(Calendar.HOUR_OF_DAY);
				int inicialminutos= fechaInicial.get(Calendar.MINUTE);
				int inicialsegundos= fechaInicial.get(Calendar.SECOND);
				int inicialtotalsegundos = (inicialhora*3600)+(inicialminutos*60)+inicialsegundos;
				// Obtener horas, minutos, segundos y segundos acumulados  de la fecha final recibida
				int finhora= fechaFinal.get(Calendar.HOUR_OF_DAY);
				int finminutos= fechaFinal.get(Calendar.MINUTE);
				int finsegundos= fechaFinal.get(Calendar.SECOND);
				int fintotalsegundos= (finhora*3600)+(finminutos*60)+finsegundos;
				
				
				//Captura el horario de inicio del proyecto por SLA para el dia que se esta evaluando
				Calendar fechaInicialBD = new GregorianCalendar(Locale.US);
				fechaInicialBD.setTimeInMillis(BDhorarioInicio.getTime());
				
				int inicialhoraBD= fechaInicialBD.get(Calendar.HOUR_OF_DAY);
				int inicialminutosBD= fechaInicialBD.get(Calendar.MINUTE);
				int inicialsegundosBD= fechaInicialBD.get(Calendar.SECOND);
				int inicialtotalsegundosBD= (inicialhoraBD*3600)+(inicialminutosBD*60)+inicialsegundosBD;
				
				//Captura el horario de cierre del proyecto por SLA para el dia que se esta evaluando
				Calendar fechaFinBD = new GregorianCalendar(Locale.US);
				fechaFinBD.setTimeInMillis(BDhorarioFin.getTime());
				
				int finhoraBD= fechaFinBD.get(Calendar.HOUR_OF_DAY);
				int finminutosBD= fechaFinBD.get(Calendar.MINUTE);
				int finsegundosBD= fechaFinBD.get(Calendar.SECOND);
				int fintotalsegundosBD= (finhoraBD*3600)+(finminutosBD*60)+finsegundosBD;

				/*Valida si la hora de inicio es mayor o menor que el horario de sla
				obtiene hora del sla en formato segundo y lo compara con la hora de inicio recibida en formato segundos
				si la hora de sla es mayor que la hora recibida, la hora inicial es la hora del sla
				si la hora de sla es menor que la hora recibida, la hora inicial es la hora recibida*/
				
				if((inicialtotalsegundos<inicialtotalsegundosBD && fintotalsegundos<inicialtotalsegundosBD)||
				    (inicialtotalsegundos>fintotalsegundosBD && fintotalsegundos>fintotalsegundosBD))
				{
					auxInicialTotalSegundos=0; auxFinTotalSegundos=0;
				}else{
				
				if(inicialtotalsegundosBD>=inicialtotalsegundos){
					auxInicialTotalSegundos=inicialtotalsegundosBD;
				}else{
					auxInicialTotalSegundos=inicialtotalsegundos;
				}
				if(fintotalsegundosBD<=fintotalsegundos){
					auxFinTotalSegundos=fintotalsegundosBD;
				}else{
					auxFinTotalSegundos=fintotalsegundos;
				}
				}

				totalSegundosAcumulados= auxFinTotalSegundos - auxInicialTotalSegundos;
		}else{
			totalSegundosAcumulados=0;
		}
		return totalSegundosAcumulados;		
	}
	
	public int extraerHorasValidas(Calendar fechaInicial, Calendar fechaFinal, Timestamp BDhorarioInicio, Timestamp BDhorarioFin, String idproyecto, SqlSessionFactory ssf){
		
		
		// Variables auxiliares para almacenamiento y asignacion de fechas validas
		int totalSegundosAcumulados=0;
		int auxInicialTotalSegundos=0;
		int auxFinTotalSegundos=0;
					
		boolean flag = validaFeriados(fechaInicial,idproyecto,ssf );
		if(flag){

				// Obtener horas, minutos, segundos y segundos acumulados de la fecha inicial recibida
				int inicialhora= fechaInicial.get(Calendar.HOUR_OF_DAY);
				int inicialminutos= fechaInicial.get(Calendar.MINUTE);
				int inicialsegundos= fechaInicial.get(Calendar.SECOND);
				int inicialtotalsegundos = (inicialhora*3600)+(inicialminutos*60)+inicialsegundos;
				// Obtener horas, minutos, segundos y segundos acumulados  de la fecha final recibida
				int finhora= fechaFinal.get(Calendar.HOUR_OF_DAY);
				int finminutos= fechaFinal.get(Calendar.MINUTE);
				int finsegundos= fechaFinal.get(Calendar.SECOND);
				int fintotalsegundos= (finhora*3600)+(finminutos*60)+finsegundos;
				
				
				//Captura el horario de inicio del proyecto por SLA para el dia que se esta evaluando
				Calendar fechaInicialBD = new GregorianCalendar(Locale.US);
				fechaInicialBD.setTimeInMillis(BDhorarioInicio.getTime());
				
				int inicialhoraBD= fechaInicialBD.get(Calendar.HOUR_OF_DAY);
				int inicialminutosBD= fechaInicialBD.get(Calendar.MINUTE);
				int inicialsegundosBD= fechaInicialBD.get(Calendar.SECOND);
				int inicialtotalsegundosBD= (inicialhoraBD*3600)+(inicialminutosBD*60)+inicialsegundosBD;
				
				//Captura el horario de cierre del proyecto por SLA para el dia que se esta evaluando
				Calendar fechaFinBD = new GregorianCalendar(Locale.US);
				fechaFinBD.setTimeInMillis(BDhorarioFin.getTime());
				
				int finhoraBD= fechaFinBD.get(Calendar.HOUR_OF_DAY);
				int finminutosBD= fechaFinBD.get(Calendar.MINUTE);
				int finsegundosBD= fechaFinBD.get(Calendar.SECOND);
				int fintotalsegundosBD= (finhoraBD*3600)+(finminutosBD*60)+finsegundosBD;

				/*Valida si la hora de inicio es mayor o menor que el horario de sla
				obtiene hora del sla en formato segundo y lo compara con la hora de inicio recibida en formato segundos
				si la hora de sla es mayor que la hora recibida, la hora inicial es la hora del sla
				si la hora de sla es menor que la hora recibida, la hora inicial es la hora recibida*/
				
				if((inicialtotalsegundos<inicialtotalsegundosBD && fintotalsegundos<inicialtotalsegundosBD)||
				    (inicialtotalsegundos>fintotalsegundosBD && fintotalsegundos>fintotalsegundosBD))
				{
					auxInicialTotalSegundos=0; auxFinTotalSegundos=0;
				}else{
				
				if(inicialtotalsegundosBD>=inicialtotalsegundos){
					auxInicialTotalSegundos=inicialtotalsegundosBD;
				}else{
					auxInicialTotalSegundos=inicialtotalsegundos;
				}
				if(fintotalsegundosBD<=fintotalsegundos){
					auxFinTotalSegundos=fintotalsegundosBD;
				}else{
					auxFinTotalSegundos=fintotalsegundos;
				}
				}

				totalSegundosAcumulados= auxFinTotalSegundos - auxInicialTotalSegundos;
		}else{
			totalSegundosAcumulados=0;
		}
		return totalSegundosAcumulados;		
	}

}
