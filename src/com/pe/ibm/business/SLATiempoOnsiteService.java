package com.pe.ibm.business;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanDashboard;
import com.pe.ibm.bean.BeanTicketStatus;
import com.pe.ibm.bean.Feriado;
import com.pe.ibm.bean.Horario;
import com.pe.ibm.bean.SLATiempoOnsiteResultado;
import com.pe.ibm.dao.EstadoTicketDAO;
import com.pe.ibm.dao.EstadoTicketDAOImpl;
import com.pe.ibm.dao.HorarioDAO;
import com.pe.ibm.dao.HorarioDAOImpl;
import com.pe.ibm.util.Utilitarios;

public class SLATiempoOnsiteService {
	
	
	Calendar dtFIniRango = new GregorianCalendar(Locale.US);
	Calendar dtFFinRango = new GregorianCalendar(Locale.US);
	Calendar dtFIniRangoTemporal = new GregorianCalendar(Locale.US);
	Calendar dtFFinRangoTemporal = new GregorianCalendar(Locale.US);
	SLATiempoOnsiteResultado beanTiempoOnsiteResultado= new SLATiempoOnsiteResultado();
	
    
	
	public double contabilizarTiempoEfectivoBacklogTiempoRespuesta(String cTicketId, String idproyecto, SqlSessionFactory ssf){

		Utilitarios util=new Utilitarios();
		SLAHorarioService slahoras=new SLAHorarioService(); 
		EstadoTicketDAO dao=new EstadoTicketDAOImpl();
		double dHorasAtencion=0;
		Timestamp dtFIni=null;
		Timestamp dtFFin=null;
		SqlSession session = null;
		try{
			session = ssf.openSession(true);
			dtFIni= dao.consultaFechaInicioTiempoRptaBacklog(cTicketId,session).getChangedate();
			Date date = new Date();
			date.setTime(dtFIni.getTime());
			
			try {
				dtFFin = dao.consultaFechaFinTiempoRpta(cTicketId,session).getChangedate();
			}catch(Exception e) {
			}
			
			if(dtFFin == null) {
				dtFFin = new Timestamp(System.currentTimeMillis());	
			}
			
			
			date.setTime(dtFFin.getTime());
				HorarioDAO daohorario=new HorarioDAOImpl();
				Horario beanhorario=new Horario();
				beanhorario = daohorario.consultarHorario(idproyecto,session);
				List<BeanTicketStatus> lista= new ArrayList<BeanTicketStatus>();
				lista=dao.consultaEstadosTicket(cTicketId, dtFIni.toString(), dtFFin.toString(),session);
//				System.out.println("cTicketId: "+cTicketId);
//				System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dtFIni) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dtFFin));
				
		if(!lista.isEmpty())	{
		// Recorrido de cada estado del ticket
		if(dtFIni.getTime() != dtFFin.getTime()) {	
		// Recorrido de cada estado del ticket
		if(lista.size() > 1) {
			for(int i=0; i<lista.size();i++){

				// Asignacion de fechas de inicio y fin para cada estado
				if(i>0){
					
					if(lista.get(i-1).getEstado().startsWith("SLA"))
						//No se contabiliza	
						{dHorasAtencion += 0;
						}else{
						dtFIniRango.setTimeInMillis(lista.get(i-1).getChangedate().getTime());
						dtFFinRango.setTimeInMillis(lista.get(i).getChangedate().getTime());

						// Calculo de cantidad de dias dentro del estado
						Date FIni= dtFIniRango.getTime();
						Date FFin= dtFFinRango.getTime();
						int dias= (int)util.getDiffDates(FIni, FFin, 4);
						
//						System.out.println("dias: "+dias);
				//si es 0 dias dentro del estado, es decir el tiempo de respuesta es dentro del mismo dia
				if(dias==0){
					dHorasAtencion += slahoras.aplicarHorarios(dtFIniRango, dtFFinRango, idproyecto,beanhorario,ssf);
				}
				else if(dias==1){ // Si es 1 dia, se respondio al dia siguiente
					for(int j=0; j<dias+1; j++){
						// Almacenamiento de tiempo de la fecha inicial 
						if(j==0){
							Calendar auxInicio=dtFIniRango;
							Calendar auxFin= new GregorianCalendar(Locale.US);
							auxFin.set(Calendar.YEAR,auxInicio.get(Calendar.YEAR));
							auxFin.set(Calendar.MONTH,auxInicio.get(Calendar.MONTH));
							auxFin.set(Calendar.DAY_OF_MONTH,auxInicio.get(Calendar.DAY_OF_MONTH));
							auxFin.set(Calendar.HOUR_OF_DAY, 23);
							auxFin.set(Calendar.MINUTE, 59);
							auxFin.set(Calendar.SECOND, 59);
							auxFin.set(Calendar.MILLISECOND, 999);
							dHorasAtencion += slahoras.aplicarHorarios(auxInicio, auxFin, idproyecto,beanhorario,ssf);		
						}
						// Almacenamiento de tiempo de la fecha final
						if(j==1){
							Calendar auxFin=dtFFinRango;
							Calendar auxInicio= new GregorianCalendar(Locale.US);
							auxInicio.set(Calendar.YEAR,auxFin.get(Calendar.YEAR));
							auxInicio.set(Calendar.MONTH,auxFin.get(Calendar.MONTH));
							auxInicio.set(Calendar.DAY_OF_MONTH,auxFin.get(Calendar.DAY_OF_MONTH));
							auxInicio.set(Calendar.HOUR_OF_DAY, 0);
							auxInicio.set(Calendar.MINUTE, 0);
							auxInicio.set(Calendar.SECOND, 0);
							
							dHorasAtencion += slahoras.aplicarHorarios(auxInicio, auxFin, idproyecto,beanhorario,ssf);
							
						}
					}//fin del for	
				}
				else if(dias>1){
				//si son varios dias (mayor a 1) dentro del estado
				for(int j=0; j<dias+1; j++){
					//Primer dia
					if(j==0){
						Calendar auxInicio= dtFIniRango;
						Calendar auxFin= new GregorianCalendar(Locale.US);
						auxFin.set(Calendar.YEAR,auxInicio.get(Calendar.YEAR));
						auxFin.set(Calendar.MONTH,auxInicio.get(Calendar.MONTH));
						auxFin.set(Calendar.DAY_OF_MONTH,auxInicio.get(Calendar.DAY_OF_MONTH));
						auxFin.set(Calendar.HOUR_OF_DAY, 23);
						auxFin.set(Calendar.MINUTE, 59);
						auxFin.set(Calendar.SECOND, 59);
						auxFin.set(Calendar.MILLISECOND, 999);
						dHorasAtencion += slahoras.aplicarHorarios(auxInicio, auxFin, idproyecto,beanhorario,ssf);
					}
					//dias intermedios
					if(j>0&&j<dias){
						Calendar aux=dtFIniRango;
									
						Calendar auxInicio= new GregorianCalendar(Locale.US);
						auxInicio.set(Calendar.YEAR,aux.get(Calendar.YEAR));
						auxInicio.set(Calendar.MONTH,aux.get(Calendar.MONTH));
						auxInicio.set(Calendar.DAY_OF_MONTH,aux.get(Calendar.DAY_OF_MONTH)+j);
						auxInicio.set(Calendar.HOUR_OF_DAY, 0);
						auxInicio.set(Calendar.MINUTE, 0);
						auxInicio.set(Calendar.SECOND, 0);
						auxInicio.set(Calendar.MILLISECOND, 0);
						
						Calendar auxFin= new GregorianCalendar(Locale.US);
						auxFin.set(Calendar.YEAR,aux.get(Calendar.YEAR));
						auxFin.set(Calendar.MONTH,aux.get(Calendar.MONTH));
						auxFin.set(Calendar.DAY_OF_MONTH,aux.get(Calendar.DAY_OF_MONTH)+j);
						auxFin.set(Calendar.HOUR_OF_DAY, 23);
						auxFin.set(Calendar.MINUTE, 59);
						auxFin.set(Calendar.SECOND, 59);
						auxFin.set(Calendar.MILLISECOND, 999);
						
						dHorasAtencion += slahoras.aplicarHorarios(auxInicio, auxFin, idproyecto,beanhorario,ssf);
					}
//					//Ultimo dia
					if(j==dias){
						Calendar auxFin=dtFFinRango;
						Calendar auxInicio= new GregorianCalendar(Locale.US);
						auxInicio.set(Calendar.YEAR,auxFin.get(Calendar.YEAR));
						auxInicio.set(Calendar.MONTH,auxFin.get(Calendar.MONTH));
						auxInicio.set(Calendar.DAY_OF_MONTH,auxFin.get(Calendar.DAY_OF_MONTH));
						auxInicio.set(Calendar.HOUR_OF_DAY, 0);
						auxInicio.set(Calendar.MINUTE, 0);
						auxInicio.set(Calendar.SECOND, 0);
						auxInicio.set(Calendar.MILLISECOND, 0);
						dHorasAtencion += slahoras.aplicarHorarios(auxInicio, auxFin, idproyecto,beanhorario,ssf);
					}
					
				}//fin del for
				}//fin del else
			}// fin del else SLA
				}//fin del if(i>0)
			}// fin del for	
		}else {
	
				if(lista.get(0).getEstado().startsWith("SLA"))
					//No se contabiliza	
					{dHorasAtencion += 0;
					}else{
					dtFIniRango.setTimeInMillis(lista.get(0).getChangedate().getTime());

					// Calculo de cantidad de dias dentro del estado
					Date FIni= dtFIniRango.getTime();
					Date FFin= dtFFinRango.getTime();
					int dias= (int)util.getDiffDates(FIni, FFin, 4);
					
//					System.out.println("dias: "+dias);
			//si es 0 dias dentro del estado, es decir el tiempo de respuesta es dentro del mismo dia
			if(dias==0){
				dHorasAtencion += slahoras.aplicarHorarios(dtFIniRango, dtFFinRango, idproyecto,beanhorario,ssf);
			}
			else if(dias==1){ // Si es 1 dia, se respondio al dia siguiente
				for(int j=0; j<dias+1; j++){
					// Almacenamiento de tiempo de la fecha inicial 
					if(j==0){
						Calendar auxInicio=dtFIniRango;
						Calendar auxFin= new GregorianCalendar(Locale.US);
						auxFin.set(Calendar.YEAR,auxInicio.get(Calendar.YEAR));
						auxFin.set(Calendar.MONTH,auxInicio.get(Calendar.MONTH));
						auxFin.set(Calendar.DAY_OF_MONTH,auxInicio.get(Calendar.DAY_OF_MONTH));
						auxFin.set(Calendar.HOUR_OF_DAY, 23);
						auxFin.set(Calendar.MINUTE, 59);
						auxFin.set(Calendar.SECOND, 59);
						auxFin.set(Calendar.MILLISECOND, 999);
						dHorasAtencion += slahoras.aplicarHorarios(auxInicio, auxFin, idproyecto,beanhorario,ssf);		
					}
					// Almacenamiento de tiempo de la fecha final
					if(j==1){
						Calendar auxFin=dtFFinRango;
						Calendar auxInicio= new GregorianCalendar(Locale.US);
						auxInicio.set(Calendar.YEAR,auxFin.get(Calendar.YEAR));
						auxInicio.set(Calendar.MONTH,auxFin.get(Calendar.MONTH));
						auxInicio.set(Calendar.DAY_OF_MONTH,auxFin.get(Calendar.DAY_OF_MONTH));
						auxInicio.set(Calendar.HOUR_OF_DAY, 0);
						auxInicio.set(Calendar.MINUTE, 0);
						auxInicio.set(Calendar.SECOND, 0);
						
						dHorasAtencion += slahoras.aplicarHorarios(auxInicio, auxFin, idproyecto,beanhorario,ssf);
						
					}
				}//fin del for	
			}
			else if(dias>1){
			//si son varios dias (mayor a 1) dentro del estado
			for(int j=0; j<dias+1; j++){
				//Primer dia
				if(j==0){
					Calendar auxInicio= dtFIniRango;
					Calendar auxFin= new GregorianCalendar(Locale.US);
					auxFin.set(Calendar.YEAR,auxInicio.get(Calendar.YEAR));
					auxFin.set(Calendar.MONTH,auxInicio.get(Calendar.MONTH));
					auxFin.set(Calendar.DAY_OF_MONTH,auxInicio.get(Calendar.DAY_OF_MONTH));
					auxFin.set(Calendar.HOUR_OF_DAY, 23);
					auxFin.set(Calendar.MINUTE, 59);
					auxFin.set(Calendar.SECOND, 59);
					auxFin.set(Calendar.MILLISECOND, 999);
					dHorasAtencion += slahoras.aplicarHorarios(auxInicio, auxFin, idproyecto,beanhorario,ssf);
				}
				//dias intermedios
				if(j>0&&j<dias){
					Calendar aux=dtFIniRango;
								
					Calendar auxInicio= new GregorianCalendar(Locale.US);
					auxInicio.set(Calendar.YEAR,aux.get(Calendar.YEAR));
					auxInicio.set(Calendar.MONTH,aux.get(Calendar.MONTH));
					auxInicio.set(Calendar.DAY_OF_MONTH,aux.get(Calendar.DAY_OF_MONTH)+j);
					auxInicio.set(Calendar.HOUR_OF_DAY, 0);
					auxInicio.set(Calendar.MINUTE, 0);
					auxInicio.set(Calendar.SECOND, 0);
					auxInicio.set(Calendar.MILLISECOND, 0);
					
					Calendar auxFin= new GregorianCalendar(Locale.US);
					auxFin.set(Calendar.YEAR,aux.get(Calendar.YEAR));
					auxFin.set(Calendar.MONTH,aux.get(Calendar.MONTH));
					auxFin.set(Calendar.DAY_OF_MONTH,aux.get(Calendar.DAY_OF_MONTH)+j);
					auxFin.set(Calendar.HOUR_OF_DAY, 23);
					auxFin.set(Calendar.MINUTE, 59);
					auxFin.set(Calendar.SECOND, 59);
					auxFin.set(Calendar.MILLISECOND, 999);
					
					dHorasAtencion += slahoras.aplicarHorarios(auxInicio, auxFin, idproyecto,beanhorario,ssf);
				}
//				//Ultimo dia
				if(j==dias){
					Calendar auxFin=dtFFinRango;
					Calendar auxInicio= new GregorianCalendar(Locale.US);
					auxInicio.set(Calendar.YEAR,auxFin.get(Calendar.YEAR));
					auxInicio.set(Calendar.MONTH,auxFin.get(Calendar.MONTH));
					auxInicio.set(Calendar.DAY_OF_MONTH,auxFin.get(Calendar.DAY_OF_MONTH));
					auxInicio.set(Calendar.HOUR_OF_DAY, 0);
					auxInicio.set(Calendar.MINUTE, 0);
					auxInicio.set(Calendar.SECOND, 0);
					auxInicio.set(Calendar.MILLISECOND, 0);
					dHorasAtencion += slahoras.aplicarHorarios(auxInicio, auxFin, idproyecto,beanhorario,ssf);
				}
				
			}//fin del for
			}//fin del else
		}// fin del else SLA	
			
		}
		
		}else { //Son fechas iguales
			 dHorasAtencion = 60.0;
		 }
		}//fin del if si la lista no es null
		
		}catch(Exception e){
		dHorasAtencion = -10.0;
		
		}//
			double horasAtencion = 0.0;
			if(dHorasAtencion > 0.0 && dHorasAtencion < 5.0) {
				dHorasAtencion = 5.0;
			}
			horasAtencion = util.convierteDeSegundosAHoras(String.valueOf(dHorasAtencion)).doubleValue();
			return horasAtencion;
	}
	
	
	public BeanDashboard backlogContabilizarTiempoRespuesta(List<BeanTicketStatus> lista, Horario beanhorario, String strOwnerGroup, List<Feriado> listaFeriados){
		String estadoCalculoTRespuesta = "";
		BeanDashboard beanResult = new BeanDashboard();
		Utilitarios util=new Utilitarios();
		SLAHorarioService slahoras=new SLAHorarioService(); 
		EstadoTicketDAO dao=new EstadoTicketDAOImpl();
		double dHorasAtencion=0;
		Timestamp dtFIni=null;
		Timestamp dtFFin=null;
		Date date = new Date();
		try{
//			session = ssf.openSession(true);
			//Identificar fecha de Inicio: Min fecha en el que el ticket estuvo en estado QUEUED y en grupo I-DCS
			
			
			for (int i=0; i<lista.size(); i++) {
				System.out.println("estado inicial: "+ lista.get(i).toString() +" indice "+i);
			}
			boolean flagInicio = false,flagFin = false ; 
			int indiceInicial = -1, indiceFinal = -1;
			for(int i=0; i<lista.size(); i++) {
				if(!flagInicio) {
				if(lista.get(i).getEstado().equals("QUEUED") && lista.get(i).getOwnergroup().startsWith("I-DCS-PE") && flagInicio == false) {
					indiceInicial = i;	flagInicio = true;
				}
				}
			}
//			System.out.println("indiceInicial "+ indiceInicial + " flagInicio "+ flagInicio);
			
			if(indiceInicial > -1) {
				//Eliminar los indices sobrantes
				if(indiceInicial > 0) {
					for(int i = indiceInicial -1 ; i >= 0; i--) {
						lista.remove(i)	;
					}
				}
				dtFIni= lista.get(0).getChangedate();
			}
			
			for (int i=0; i<lista.size(); i++) {
//				System.out.println("Nueva lista Iniciall: "+ lista.get(i).toString() +" indice "+i);
			}
			
			//Identificar fecha de Fin: Min fecha en el que el ticket estuvo en estado INPROG y en grupo I-DCS
			for(int i=0; i<lista.size(); i++) {
//				System.out.println("Evalua lista Final: "+ lista.get(i).toString() +" indice "+i);
				if(!flagFin) {
				if(lista.get(i).getEstado().equals("INPROG") && lista.get(i).getOwnergroup().startsWith("I-DCS-PE") && flagFin == false) {
					indiceFinal = i;	flagFin = true;
//					System.out.println("Evalua lista Final ENTRO indice "+i);
				}
				}
			}
			
//			System.out.println("indicefinal "+ indiceFinal + " flagFin "+ flagInicio);
			
			if(indiceFinal > -1) {
				dtFFin = lista.get(indiceFinal).getChangedate();
				if(lista.size()-1 > indiceFinal) {
					//Eliminar los indices sobrantes
					for(int i = lista.size()-1 ; i > indiceFinal; i--) {
						lista.remove(i)	;
					}	
				}else {
					dtFFin = lista.get(indiceFinal).getChangedate();	
				}
				estadoCalculoTRespuesta = "FINALIZADO";	
			}else {
				dtFFin = new Timestamp(System.currentTimeMillis());	
				BeanTicketStatus beanTemp = new BeanTicketStatus();
				beanTemp.setTicketid(lista.get(lista.size()-1).getTicketid());
				beanTemp.setClase(lista.get(lista.size()-1).getClase());
				beanTemp.setEstado("INPROGTEMP");
				beanTemp.setOwnergroup(lista.get(lista.size()-1).getOwnergroup());
				beanTemp.setChangedate(dtFFin);
				lista.add(beanTemp);
				estadoCalculoTRespuesta = "EN PROGRESO";	
			}
			
	
			System.out.println("cTicketId: "+lista.get(0).getTicketid());
			for (BeanTicketStatus bean : lista) {
//				System.out.println("Nuevos estados finales: "+ bean.toString());
			}
			System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dtFIni) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dtFFin));
				
		if(!lista.isEmpty() && flagInicio == true)	{
		// Recorrido de cada estado del ticket
		if(dtFIni.getTime() != dtFFin.getTime()) {	
		// Recorrido de cada estado del ticket
		if(lista.size() > 1) {
			for(int i=0; i<lista.size();i++){

				// Asignacion de fechas de inicio y fin para cada estado
				if(i>0){
					
					if(lista.get(i-1).getEstado().startsWith("SLA"))
						//No se contabiliza	
						{dHorasAtencion += 0;
						}else{
						dtFIniRango.setTimeInMillis(lista.get(i-1).getChangedate().getTime());
						dtFFinRango.setTimeInMillis(lista.get(i).getChangedate().getTime());
						
						// Calculo de cantidad de dias dentro del estado
						Date FIni= dtFIniRango.getTime();
						Date FFin= dtFFinRango.getTime();
						int dias= (int)util.getDiffDates(FIni, FFin, 4);
						
//						System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dtFIniRango.getTime()) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dtFFinRango.getTime()));
//						System.out.println("dias: "+dias);
				//si es 0 dias dentro del estado, es decir el tiempo de respuesta es dentro del mismo dia
				if(dias==0){
					dHorasAtencion += slahoras.aplicarHorarios2(dtFIniRango, dtFFinRango, beanhorario,listaFeriados);
//					System.out.println("dHorasAtencion: "+dHorasAtencion);
				}
				else if(dias==1){ // Si es 1 dia, se respondio al dia siguiente
					for(int j=0; j<dias+1; j++){
						// Almacenamiento de tiempo de la fecha inicial 
						if(j==0){
							Calendar auxInicio=dtFIniRango;
							Calendar auxFin= new GregorianCalendar(Locale.US);
							auxFin.set(Calendar.YEAR,auxInicio.get(Calendar.YEAR));
							auxFin.set(Calendar.MONTH,auxInicio.get(Calendar.MONTH));
							auxFin.set(Calendar.DAY_OF_MONTH,auxInicio.get(Calendar.DAY_OF_MONTH));
							auxFin.set(Calendar.HOUR_OF_DAY, 23);
							auxFin.set(Calendar.MINUTE, 59);
							auxFin.set(Calendar.SECOND, 59);
							auxFin.set(Calendar.MILLISECOND, 999);
							dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);	
						}
						// Almacenamiento de tiempo de la fecha final
						if(j==1){
							Calendar auxFin=dtFFinRango;
							Calendar auxInicio= new GregorianCalendar(Locale.US);
							auxInicio.set(Calendar.YEAR,auxFin.get(Calendar.YEAR));
							auxInicio.set(Calendar.MONTH,auxFin.get(Calendar.MONTH));
							auxInicio.set(Calendar.DAY_OF_MONTH,auxFin.get(Calendar.DAY_OF_MONTH));
							auxInicio.set(Calendar.HOUR_OF_DAY, 0);
							auxInicio.set(Calendar.MINUTE, 0);
							auxInicio.set(Calendar.SECOND, 0);
							
							dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
							
						}
					}//fin del for	
				}
				else if(dias>1){
				//si son varios dias (mayor a 1) dentro del estado
				for(int j=0; j<dias+1; j++){
					//Primer dia
					if(j==0){
						Calendar auxInicio= dtFIniRango;
						Calendar auxFin= new GregorianCalendar(Locale.US);
						auxFin.set(Calendar.YEAR,auxInicio.get(Calendar.YEAR));
						auxFin.set(Calendar.MONTH,auxInicio.get(Calendar.MONTH));
						auxFin.set(Calendar.DAY_OF_MONTH,auxInicio.get(Calendar.DAY_OF_MONTH));
						auxFin.set(Calendar.HOUR_OF_DAY, 23);
						auxFin.set(Calendar.MINUTE, 59);
						auxFin.set(Calendar.SECOND, 59);
						auxFin.set(Calendar.MILLISECOND, 999);
						dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
					}
					//dias intermedios
					if(j>0&&j<dias){
						Calendar aux=dtFIniRango;
									
						Calendar auxInicio= new GregorianCalendar(Locale.US);
						auxInicio.set(Calendar.YEAR,aux.get(Calendar.YEAR));
						auxInicio.set(Calendar.MONTH,aux.get(Calendar.MONTH));
						auxInicio.set(Calendar.DAY_OF_MONTH,aux.get(Calendar.DAY_OF_MONTH)+j);
						auxInicio.set(Calendar.HOUR_OF_DAY, 0);
						auxInicio.set(Calendar.MINUTE, 0);
						auxInicio.set(Calendar.SECOND, 0);
						auxInicio.set(Calendar.MILLISECOND, 0);
						
						Calendar auxFin= new GregorianCalendar(Locale.US);
						auxFin.set(Calendar.YEAR,aux.get(Calendar.YEAR));
						auxFin.set(Calendar.MONTH,aux.get(Calendar.MONTH));
						auxFin.set(Calendar.DAY_OF_MONTH,aux.get(Calendar.DAY_OF_MONTH)+j);
						auxFin.set(Calendar.HOUR_OF_DAY, 23);
						auxFin.set(Calendar.MINUTE, 59);
						auxFin.set(Calendar.SECOND, 59);
						auxFin.set(Calendar.MILLISECOND, 999);
						
						dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
					}
//					//Ultimo dia
					if(j==dias){
						Calendar auxFin=dtFFinRango;
						Calendar auxInicio= new GregorianCalendar(Locale.US);
						auxInicio.set(Calendar.YEAR,auxFin.get(Calendar.YEAR));
						auxInicio.set(Calendar.MONTH,auxFin.get(Calendar.MONTH));
						auxInicio.set(Calendar.DAY_OF_MONTH,auxFin.get(Calendar.DAY_OF_MONTH));
						auxInicio.set(Calendar.HOUR_OF_DAY, 0);
						auxInicio.set(Calendar.MINUTE, 0);
						auxInicio.set(Calendar.SECOND, 0);
						auxInicio.set(Calendar.MILLISECOND, 0);
						dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
					}
					
				}//fin del for
				}//fin del else
			  }// fin del else SLAHOLD
		     }//fin del if(i>0)
			}// fin del for	
		}else {
	
				if(lista.get(0).getEstado().startsWith("SLA"))
					//No se contabiliza	
					{dHorasAtencion += 0;
					}else{
					dtFIniRango.setTimeInMillis(lista.get(0).getChangedate().getTime());

					// Calculo de cantidad de dias dentro del estado
					Date FIni= dtFIniRango.getTime();
					Date FFin= dtFFinRango.getTime();
					int dias= (int)util.getDiffDates(FIni, FFin, 4);
					
//					System.out.println("dias: "+dias);
			//si es 0 dias dentro del estado, es decir el tiempo de respuesta es dentro del mismo dia
			if(dias==0){
				dHorasAtencion += slahoras.aplicarHorarios2(dtFIniRango, dtFFinRango, beanhorario,listaFeriados);
			}
			else if(dias==1){ // Si es 1 dia, se respondio al dia siguiente
				for(int j=0; j<dias+1; j++){
					// Almacenamiento de tiempo de la fecha inicial 
					if(j==0){
						Calendar auxInicio=dtFIniRango;
						Calendar auxFin= new GregorianCalendar(Locale.US);
						auxFin.set(Calendar.YEAR,auxInicio.get(Calendar.YEAR));
						auxFin.set(Calendar.MONTH,auxInicio.get(Calendar.MONTH));
						auxFin.set(Calendar.DAY_OF_MONTH,auxInicio.get(Calendar.DAY_OF_MONTH));
						auxFin.set(Calendar.HOUR_OF_DAY, 23);
						auxFin.set(Calendar.MINUTE, 59);
						auxFin.set(Calendar.SECOND, 59);
						auxFin.set(Calendar.MILLISECOND, 999);
						dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
//						System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxInicio.getTime()) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxFin.getTime()));
//						
//						System.out.println("dHorasAtencion j==0: "+dHorasAtencion);
					}
					// Almacenamiento de tiempo de la fecha final
					if(j==1){
						Calendar auxFin=dtFFinRango;
						Calendar auxInicio= new GregorianCalendar(Locale.US);
						auxInicio.set(Calendar.YEAR,auxFin.get(Calendar.YEAR));
						auxInicio.set(Calendar.MONTH,auxFin.get(Calendar.MONTH));
						auxInicio.set(Calendar.DAY_OF_MONTH,auxFin.get(Calendar.DAY_OF_MONTH));
						auxInicio.set(Calendar.HOUR_OF_DAY, 0);
						auxInicio.set(Calendar.MINUTE, 0);
						auxInicio.set(Calendar.SECOND, 0);
						
						dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
						
//						System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxInicio.getTime()) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxFin.getTime()));
//						
//						System.out.println("dHorasAtencion j==1 : "+dHorasAtencion);
					}
				}//fin del for	
			}
			else if(dias>1){
			//si son varios dias (mayor a 1) dentro del estado
			for(int j=0; j<dias+1; j++){
				//Primer dia
				if(j==0){
					Calendar auxInicio= dtFIniRango;
					Calendar auxFin= new GregorianCalendar(Locale.US);
					auxFin.set(Calendar.YEAR,auxInicio.get(Calendar.YEAR));
					auxFin.set(Calendar.MONTH,auxInicio.get(Calendar.MONTH));
					auxFin.set(Calendar.DAY_OF_MONTH,auxInicio.get(Calendar.DAY_OF_MONTH));
					auxFin.set(Calendar.HOUR_OF_DAY, 23);
					auxFin.set(Calendar.MINUTE, 59);
					auxFin.set(Calendar.SECOND, 59);
					auxFin.set(Calendar.MILLISECOND, 999);
					dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
					
//					System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxInicio.getTime()) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxFin.getTime()));
//					
//					System.out.println("dHorasAtencion j==0 : "+dHorasAtencion);
				}
				//dias intermedios
				if(j>0&&j<dias){
					Calendar aux=dtFIniRango;
								
					Calendar auxInicio= new GregorianCalendar(Locale.US);
					auxInicio.set(Calendar.YEAR,aux.get(Calendar.YEAR));
					auxInicio.set(Calendar.MONTH,aux.get(Calendar.MONTH));
					auxInicio.set(Calendar.DAY_OF_MONTH,aux.get(Calendar.DAY_OF_MONTH)+j);
					auxInicio.set(Calendar.HOUR_OF_DAY, 0);
					auxInicio.set(Calendar.MINUTE, 0);
					auxInicio.set(Calendar.SECOND, 0);
					auxInicio.set(Calendar.MILLISECOND, 0);
					
					Calendar auxFin= new GregorianCalendar(Locale.US);
					auxFin.set(Calendar.YEAR,aux.get(Calendar.YEAR));
					auxFin.set(Calendar.MONTH,aux.get(Calendar.MONTH));
					auxFin.set(Calendar.DAY_OF_MONTH,aux.get(Calendar.DAY_OF_MONTH)+j);
					auxFin.set(Calendar.HOUR_OF_DAY, 23);
					auxFin.set(Calendar.MINUTE, 59);
					auxFin.set(Calendar.SECOND, 59);
					auxFin.set(Calendar.MILLISECOND, 999);
					
					dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
					
//					System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxInicio.getTime()) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxFin.getTime()));
//					
//					System.out.println("dHorasAtencion j>0&&j<dias : "+dHorasAtencion);
				}
//				//Ultimo dia
				if(j==dias){
					Calendar auxFin=dtFFinRango;
					Calendar auxInicio= new GregorianCalendar(Locale.US);
					auxInicio.set(Calendar.YEAR,auxFin.get(Calendar.YEAR));
					auxInicio.set(Calendar.MONTH,auxFin.get(Calendar.MONTH));
					auxInicio.set(Calendar.DAY_OF_MONTH,auxFin.get(Calendar.DAY_OF_MONTH));
					auxInicio.set(Calendar.HOUR_OF_DAY, 0);
					auxInicio.set(Calendar.MINUTE, 0);
					auxInicio.set(Calendar.SECOND, 0);
					auxInicio.set(Calendar.MILLISECOND, 0);
					dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
					
//					System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxInicio.getTime()) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxFin.getTime()));
//					
//					System.out.println("dHorasAtencion j==dias : "+dHorasAtencion);
				}
				
			}//fin del for
			}//fin del else
		}// fin del else SLA	
			
		}
		
		}else { //Son fechas iguales
//			System.out.println("Son fechas iguales dHorasAtencion: "+dHorasAtencion);
			 dHorasAtencion = 60.0;
		 }
		}//fin del if si la lista no es null
		else {
			dHorasAtencion = -10.0;
			estadoCalculoTRespuesta = "NO APLICA";	
		}
		}catch(Exception e){
		dHorasAtencion = -10.0;
		estadoCalculoTRespuesta = "NO APLICA";
		}finally {
			double horasAtencion = 0.0;
			if(dHorasAtencion > 0.0 && dHorasAtencion < 5.0) {
				dHorasAtencion = 5.0;
			}
			horasAtencion = util.convierteDeSegundosAHoras(String.valueOf(dHorasAtencion)).doubleValue();
			
			
			beanResult.setValor(horasAtencion);
			beanResult.setEstado(estadoCalculoTRespuesta);}
			return beanResult;
	}
	
	public BeanDashboard backlogContabilizarTiempoSolucion(List<BeanTicketStatus> lista, Horario beanhorario, String strOwnerGroup, List<Feriado> listaFeriados){
		BeanDashboard beanResult = new BeanDashboard();
		String estadoCalculoTSolucion = "";
		Utilitarios util=new Utilitarios();
		SLAHorarioService slahoras=new SLAHorarioService(); 
		EstadoTicketDAO dao=new EstadoTicketDAOImpl();
		double dHorasAtencion=0;
		Timestamp dtFIni=null;
		Timestamp dtFFin=null;
		SqlSession session = null;
		Date date = new Date();
		try{
//			session = ssf.openSession(true);
			//Identificar fecha de Inicio: Min fecha en el que el ticket estuvo en estado QUEUED y en grupo I-DCS
	
			
			for (int i=0; i<lista.size(); i++) {
//				System.out.println("estado inicial: "+ lista.get(i).toString() +" indice "+i);
			}
			boolean flagInicio = false,flagFin = false ; 
			int indiceInicial = -1, indiceFinal = -1;
			for(int i=0; i<lista.size(); i++) {
				if(!flagInicio) {
				if(lista.get(i).getEstado().equals("INPROG") && lista.get(i).getOwnergroup().startsWith("I-DCS-PE") && flagInicio == false) {
					indiceInicial = i;	flagInicio = true;
				}
				}
			}
//			System.out.println("indiceInicial "+ indiceInicial + " flagInicio "+ flagInicio);
			
			if(indiceInicial > -1) {
				//Eliminar los indices sobrantes
				if(indiceInicial > 0) {
					for(int i = indiceInicial -1 ; i >= 0; i--) {
						lista.remove(i)	;
					}
				}
				dtFIni= lista.get(0).getChangedate();
			}
			
			for (int i=0; i<lista.size(); i++) {
//				System.out.println("Nueva lista Iniciall: "+ lista.get(i).toString() +" indice "+i);
			}
			
			//Identificar fecha de Fin: Min fecha en el que el ticket estuvo en estado INPROG y en grupo I-DCS
			for(int i=0; i<lista.size(); i++) {
//				System.out.println("Evalua lista Final: "+ lista.get(i).toString() +" indice "+i);
				if(!flagFin) {
				if(lista.get(i).getEstado().equals("RESOLVED") && lista.get(i).getOwnergroup().startsWith("I-DCS-PE") && flagFin == false) {
					indiceFinal = i;	flagFin = true;
//					System.out.println("Evalua lista Final ENTRO indice "+i);
				}
				}
			}
			
//			System.out.println("indicefinal "+ indiceFinal + " flagFin "+ flagInicio);
			
			if(indiceFinal > -1) {
				dtFFin = lista.get(indiceFinal).getChangedate();
				if(lista.size()-1 > indiceFinal) {
					//Eliminar los indices sobrantes
					for(int i = lista.size()-1 ; i > indiceFinal; i--) {
						lista.remove(i)	;
					}	
				}else {
					dtFFin = lista.get(indiceFinal).getChangedate();	
				}
				estadoCalculoTSolucion = "FINALIZADO";	
			}else {
				dtFFin = new Timestamp(System.currentTimeMillis());	
				BeanTicketStatus beanTemp = new BeanTicketStatus();
				beanTemp.setTicketid(lista.get(lista.size()-1).getTicketid());
				beanTemp.setClase(lista.get(lista.size()-1).getClase());
				beanTemp.setEstado("RESOLVEDTEMP");
				beanTemp.setOwnergroup(lista.get(lista.size()-1).getOwnergroup());
				beanTemp.setChangedate(dtFFin);
				lista.add(beanTemp);
				estadoCalculoTSolucion = "EN PROGRESO";	
			}
			
	
			System.out.println("cTicketId: "+lista.get(0).getTicketid());
			for (BeanTicketStatus bean : lista) {
//				System.out.println("Nuevos estados finales: "+ bean.toString());
			}
			System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dtFIni) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dtFFin));
				
		if(!lista.isEmpty() && flagInicio == true)	{
		// Recorrido de cada estado del ticket
		if(dtFIni.getTime() != dtFFin.getTime()) {	
		// Recorrido de cada estado del ticket
		if(lista.size() > 1) {
			for(int i=0; i<lista.size();i++){

				// Asignacion de fechas de inicio y fin para cada estado
				if(i>0){
					
					if(lista.get(i-1).getEstado().startsWith("SLA"))
						//No se contabiliza	
						{dHorasAtencion += 0;
						}else{
						dtFIniRango.setTimeInMillis(lista.get(i-1).getChangedate().getTime());
						dtFFinRango.setTimeInMillis(lista.get(i).getChangedate().getTime());
						
						// Calculo de cantidad de dias dentro del estado
						Date FIni= dtFIniRango.getTime();
						Date FFin= dtFFinRango.getTime();
						int dias= (int)util.getDiffDates(FIni, FFin, 4);
						
//						System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dtFIniRango.getTime()) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dtFFinRango.getTime()));
//						System.out.println("dias: "+dias);
				//si es 0 dias dentro del estado, es decir el tiempo de respuesta es dentro del mismo dia
				if(dias==0){
					dHorasAtencion += slahoras.aplicarHorarios2(dtFIniRango, dtFFinRango, beanhorario,listaFeriados);
//					System.out.println("dHorasAtencion: "+dHorasAtencion);
				}
				else if(dias==1){ // Si es 1 dia, se respondio al dia siguiente
					for(int j=0; j<dias+1; j++){
						// Almacenamiento de tiempo de la fecha inicial 
						if(j==0){
							Calendar auxInicio=dtFIniRango;
							Calendar auxFin= new GregorianCalendar(Locale.US);
							auxFin.set(Calendar.YEAR,auxInicio.get(Calendar.YEAR));
							auxFin.set(Calendar.MONTH,auxInicio.get(Calendar.MONTH));
							auxFin.set(Calendar.DAY_OF_MONTH,auxInicio.get(Calendar.DAY_OF_MONTH));
							auxFin.set(Calendar.HOUR_OF_DAY, 23);
							auxFin.set(Calendar.MINUTE, 59);
							auxFin.set(Calendar.SECOND, 59);
							auxFin.set(Calendar.MILLISECOND, 999);
							dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);	
						}
						// Almacenamiento de tiempo de la fecha final
						if(j==1){
							Calendar auxFin=dtFFinRango;
							Calendar auxInicio= new GregorianCalendar(Locale.US);
							auxInicio.set(Calendar.YEAR,auxFin.get(Calendar.YEAR));
							auxInicio.set(Calendar.MONTH,auxFin.get(Calendar.MONTH));
							auxInicio.set(Calendar.DAY_OF_MONTH,auxFin.get(Calendar.DAY_OF_MONTH));
							auxInicio.set(Calendar.HOUR_OF_DAY, 0);
							auxInicio.set(Calendar.MINUTE, 0);
							auxInicio.set(Calendar.SECOND, 0);
							
							dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
							
						}
					}//fin del for	
				}
				else if(dias>1){
				//si son varios dias (mayor a 1) dentro del estado
				for(int j=0; j<dias+1; j++){
					//Primer dia
					if(j==0){
						Calendar auxInicio= dtFIniRango;
						Calendar auxFin= new GregorianCalendar(Locale.US);
						auxFin.set(Calendar.YEAR,auxInicio.get(Calendar.YEAR));
						auxFin.set(Calendar.MONTH,auxInicio.get(Calendar.MONTH));
						auxFin.set(Calendar.DAY_OF_MONTH,auxInicio.get(Calendar.DAY_OF_MONTH));
						auxFin.set(Calendar.HOUR_OF_DAY, 23);
						auxFin.set(Calendar.MINUTE, 59);
						auxFin.set(Calendar.SECOND, 59);
						auxFin.set(Calendar.MILLISECOND, 999);
						dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
					}
					//dias intermedios
					if(j>0&&j<dias){
						Calendar aux=dtFIniRango;
									
						Calendar auxInicio= new GregorianCalendar(Locale.US);
						auxInicio.set(Calendar.YEAR,aux.get(Calendar.YEAR));
						auxInicio.set(Calendar.MONTH,aux.get(Calendar.MONTH));
						auxInicio.set(Calendar.DAY_OF_MONTH,aux.get(Calendar.DAY_OF_MONTH)+j);
						auxInicio.set(Calendar.HOUR_OF_DAY, 0);
						auxInicio.set(Calendar.MINUTE, 0);
						auxInicio.set(Calendar.SECOND, 0);
						auxInicio.set(Calendar.MILLISECOND, 0);
						
						Calendar auxFin= new GregorianCalendar(Locale.US);
						auxFin.set(Calendar.YEAR,aux.get(Calendar.YEAR));
						auxFin.set(Calendar.MONTH,aux.get(Calendar.MONTH));
						auxFin.set(Calendar.DAY_OF_MONTH,aux.get(Calendar.DAY_OF_MONTH)+j);
						auxFin.set(Calendar.HOUR_OF_DAY, 23);
						auxFin.set(Calendar.MINUTE, 59);
						auxFin.set(Calendar.SECOND, 59);
						auxFin.set(Calendar.MILLISECOND, 999);
						
						dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
					}
//					//Ultimo dia
					if(j==dias){
						Calendar auxFin=dtFFinRango;
						Calendar auxInicio= new GregorianCalendar(Locale.US);
						auxInicio.set(Calendar.YEAR,auxFin.get(Calendar.YEAR));
						auxInicio.set(Calendar.MONTH,auxFin.get(Calendar.MONTH));
						auxInicio.set(Calendar.DAY_OF_MONTH,auxFin.get(Calendar.DAY_OF_MONTH));
						auxInicio.set(Calendar.HOUR_OF_DAY, 0);
						auxInicio.set(Calendar.MINUTE, 0);
						auxInicio.set(Calendar.SECOND, 0);
						auxInicio.set(Calendar.MILLISECOND, 0);
						dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
					}
					
				}//fin del for
				}//fin del else
			  }// fin del else SLAHOLD
		     }//fin del if(i>0)
			}// fin del for	
		}else {
	
				if(lista.get(0).getEstado().startsWith("SLA"))
					//No se contabiliza	
					{dHorasAtencion += 0;
					}else{
					dtFIniRango.setTimeInMillis(lista.get(0).getChangedate().getTime());

					// Calculo de cantidad de dias dentro del estado
					Date FIni= dtFIniRango.getTime();
					Date FFin= dtFFinRango.getTime();
					int dias= (int)util.getDiffDates(FIni, FFin, 4);
					
//					System.out.println("dias: "+dias);
			//si es 0 dias dentro del estado, es decir el tiempo de respuesta es dentro del mismo dia
			if(dias==0){
				dHorasAtencion += slahoras.aplicarHorarios2(dtFIniRango, dtFFinRango, beanhorario,listaFeriados);
			}
			else if(dias==1){ // Si es 1 dia, se respondio al dia siguiente
				for(int j=0; j<dias+1; j++){
					// Almacenamiento de tiempo de la fecha inicial 
					if(j==0){
						Calendar auxInicio=dtFIniRango;
						Calendar auxFin= new GregorianCalendar(Locale.US);
						auxFin.set(Calendar.YEAR,auxInicio.get(Calendar.YEAR));
						auxFin.set(Calendar.MONTH,auxInicio.get(Calendar.MONTH));
						auxFin.set(Calendar.DAY_OF_MONTH,auxInicio.get(Calendar.DAY_OF_MONTH));
						auxFin.set(Calendar.HOUR_OF_DAY, 23);
						auxFin.set(Calendar.MINUTE, 59);
						auxFin.set(Calendar.SECOND, 59);
						auxFin.set(Calendar.MILLISECOND, 999);
						dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
//						System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxInicio.getTime()) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxFin.getTime()));
//						
//						System.out.println("dHorasAtencion j==0: "+dHorasAtencion);
					}
					// Almacenamiento de tiempo de la fecha final
					if(j==1){
						Calendar auxFin=dtFFinRango;
						Calendar auxInicio= new GregorianCalendar(Locale.US);
						auxInicio.set(Calendar.YEAR,auxFin.get(Calendar.YEAR));
						auxInicio.set(Calendar.MONTH,auxFin.get(Calendar.MONTH));
						auxInicio.set(Calendar.DAY_OF_MONTH,auxFin.get(Calendar.DAY_OF_MONTH));
						auxInicio.set(Calendar.HOUR_OF_DAY, 0);
						auxInicio.set(Calendar.MINUTE, 0);
						auxInicio.set(Calendar.SECOND, 0);
						
						dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
						
//						System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxInicio.getTime()) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxFin.getTime()));
//						
//						System.out.println("dHorasAtencion j==1 : "+dHorasAtencion);
					}
				}//fin del for	
			}
			else if(dias>1){
			//si son varios dias (mayor a 1) dentro del estado
			for(int j=0; j<dias+1; j++){
				//Primer dia
				if(j==0){
					Calendar auxInicio= dtFIniRango;
					Calendar auxFin= new GregorianCalendar(Locale.US);
					auxFin.set(Calendar.YEAR,auxInicio.get(Calendar.YEAR));
					auxFin.set(Calendar.MONTH,auxInicio.get(Calendar.MONTH));
					auxFin.set(Calendar.DAY_OF_MONTH,auxInicio.get(Calendar.DAY_OF_MONTH));
					auxFin.set(Calendar.HOUR_OF_DAY, 23);
					auxFin.set(Calendar.MINUTE, 59);
					auxFin.set(Calendar.SECOND, 59);
					auxFin.set(Calendar.MILLISECOND, 999);
					dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
					
//					System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxInicio.getTime()) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxFin.getTime()));
//					
//					System.out.println("dHorasAtencion j==0 : "+dHorasAtencion);
				}
				//dias intermedios
				if(j>0&&j<dias){
					Calendar aux=dtFIniRango;
								
					Calendar auxInicio= new GregorianCalendar(Locale.US);
					auxInicio.set(Calendar.YEAR,aux.get(Calendar.YEAR));
					auxInicio.set(Calendar.MONTH,aux.get(Calendar.MONTH));
					auxInicio.set(Calendar.DAY_OF_MONTH,aux.get(Calendar.DAY_OF_MONTH)+j);
					auxInicio.set(Calendar.HOUR_OF_DAY, 0);
					auxInicio.set(Calendar.MINUTE, 0);
					auxInicio.set(Calendar.SECOND, 0);
					auxInicio.set(Calendar.MILLISECOND, 0);
					
					Calendar auxFin= new GregorianCalendar(Locale.US);
					auxFin.set(Calendar.YEAR,aux.get(Calendar.YEAR));
					auxFin.set(Calendar.MONTH,aux.get(Calendar.MONTH));
					auxFin.set(Calendar.DAY_OF_MONTH,aux.get(Calendar.DAY_OF_MONTH)+j);
					auxFin.set(Calendar.HOUR_OF_DAY, 23);
					auxFin.set(Calendar.MINUTE, 59);
					auxFin.set(Calendar.SECOND, 59);
					auxFin.set(Calendar.MILLISECOND, 999);
					
					dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
					
//					System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxInicio.getTime()) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxFin.getTime()));
//					
//					System.out.println("dHorasAtencion j>0&&j<dias : "+dHorasAtencion);
				}
//				//Ultimo dia
				if(j==dias){
					Calendar auxFin=dtFFinRango;
					Calendar auxInicio= new GregorianCalendar(Locale.US);
					auxInicio.set(Calendar.YEAR,auxFin.get(Calendar.YEAR));
					auxInicio.set(Calendar.MONTH,auxFin.get(Calendar.MONTH));
					auxInicio.set(Calendar.DAY_OF_MONTH,auxFin.get(Calendar.DAY_OF_MONTH));
					auxInicio.set(Calendar.HOUR_OF_DAY, 0);
					auxInicio.set(Calendar.MINUTE, 0);
					auxInicio.set(Calendar.SECOND, 0);
					auxInicio.set(Calendar.MILLISECOND, 0);
					dHorasAtencion += slahoras.aplicarHorarios2(auxInicio, auxFin, beanhorario,listaFeriados);
					
//					System.out.println("Inicio: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxInicio.getTime()) +" - Fin: "+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(auxFin.getTime()));
//					
//					System.out.println("dHorasAtencion j==dias : "+dHorasAtencion);
				}
				
			}//fin del for
			}//fin del else
		}// fin del else SLA	
			
		}
		
		}else { //Son fechas iguales
//			System.out.println("Son fechas iguales dHorasAtencion: "+dHorasAtencion);
			 dHorasAtencion = 60.0;
		 }
		}//fin del if si la lista no es null
		else {
			dHorasAtencion = -10.0;
			estadoCalculoTSolucion = "NO APLICA";	
		}
		}catch(Exception e){
		dHorasAtencion = -10.0;
		estadoCalculoTSolucion = "NO APLICA";
		}finally {
			double horasAtencion = 0.0;
			if(dHorasAtencion > 0.0 && dHorasAtencion < 5.0) {
				dHorasAtencion = 5.0;
			}
			horasAtencion = util.convierteDeSegundosAHoras(String.valueOf(dHorasAtencion)).doubleValue();
			
			beanResult.setValor(horasAtencion);
			beanResult.setEstado(estadoCalculoTSolucion);}
	        
//			System.out.println("beanResult "+beanResult.toString());
			return beanResult;
	}
	

}
