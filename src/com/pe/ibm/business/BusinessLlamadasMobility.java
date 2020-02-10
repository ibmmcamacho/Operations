package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanBusqueda;
import com.pe.ibm.bean.BeanLlamadas;
import com.pe.ibm.dao.DaoLlamadasMobilityImpl;

public class BusinessLlamadasMobility {
	
	
	public List<BeanLlamadas> getllamadasPorOpcion(BeanBusqueda pBean,int opcion, SqlSessionFactory ssf){
		List<BeanLlamadas> lstBean= null;
		List<BeanLlamadas> lstBeanfinal= new ArrayList<BeanLlamadas>();
		SqlSession session = null;
		session = ssf.openSession(true);
		DaoLlamadasMobilityImpl dao = new DaoLlamadasMobilityImpl();
		double tasaAban = 0.0;
		try {
			lstBean = dao.getllamadasPorOpcion(pBean,opcion, session);
		}catch(Exception ex){
			lstBean = null;
		}finally {
			session.close();
		}
		if(lstBean != null) {
			switch(opcion) {
			case 1: //Procesamiento llamadas por hora
				//Primer recorrido agregar resultados de llamadas contestadas
				for(int i = 0; i<lstBean.size(); i++) {
				if(lstBean.get(i).getTipo().equals("LLAM_CONTESTADA")) {
						lstBeanfinal.add(lstBean.get(i));
				}	
				}
				boolean flag1 = false;
				//Segundo recorrido agregar resultados de llamadas no contestadas
				for(int i = 0; i<lstBean.size(); i++) {
					if(lstBean.get(i).getTipo().equals("LLAM_NOCONTESTADA")) {
					flag1 = false;	
						//Buscar si en la lista final existe el periodo evaluado
						for(int j = 0; j<lstBeanfinal.size(); j++) {
							if(lstBean.get(i).getStrhoraDia().equals(lstBeanfinal.get(j).getStrhoraDia())){
								lstBeanfinal.get(j).setLlamadasMayores(lstBean.get(i).getLlamadasMayores());
								lstBeanfinal.get(j).setLlamadasMenores(lstBean.get(i).getLlamadasMenores());
								flag1 = true;
						}	
						}
						if(!flag1) {
							lstBeanfinal.add(lstBean.get(i));	
						}
						
					}	
					
				}
				//CALCULO SLA TASA ABANDONO
				for(int z=0 ; z <lstBeanfinal.size(); z++) {
					
					if(pBean.getIdproyecto() == "11") {//PETROPERU
						if(Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores()) > 0) {
						tasaAban = ((double)(Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores())) / (double) (Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+(Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores())))) * 100.00;
						tasaAban = Math.round(tasaAban*100)/100.00;
						}
						lstBeanfinal.get(z).setTasaAbandono(tasaAban);
					}else {//Otros proyectos
						if(Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores()) > 0) {
						tasaAban = ((double)(Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores())) / (double) (Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores()+lstBeanfinal.get(z).getLlamadasMenores()))) * 100.00;
						tasaAban = Math.round(tasaAban*100)/100.00;
						}
						lstBeanfinal.get(z).setTasaAbandono(tasaAban);
					}
				}
				
				
				
				
				break;
			case 2: //Procesamiento llamadas por semana
				//Primer recorrido agregar resultados de llamadas contestadas
				for(int i = 0; i<lstBean.size(); i++) {
				if(lstBean.get(i).getTipo().equals("LLAM_CONTESTADA")) {
						lstBeanfinal.add(lstBean.get(i));
				}	
				}
				boolean flag2 = false;
				//Segundo recorrido agregar resultados de llamadas no contestadas
				for(int i = 0; i<lstBean.size(); i++) {
					if(lstBean.get(i).getTipo().equals("LLAM_NOCONTESTADA")) {
					flag2 = false;	
						//Buscar si en la lista final existe el periodo evaluado
						for(int j = 0; j<lstBeanfinal.size(); j++) {
							if(lstBean.get(i).getStrnumeroSemana().equals(lstBeanfinal.get(j).getStrnumeroSemana())){
								lstBeanfinal.get(j).setLlamadasMayores(lstBean.get(i).getLlamadasMayores());
								lstBeanfinal.get(j).setLlamadasMenores(lstBean.get(i).getLlamadasMenores());
								
								flag2 = true;
						}	
						}
						if(!flag2) {
							lstBeanfinal.add(lstBean.get(i));	
						}
						
					}	
					
				}
				//CALCULO SLA TASA ABANDONO
				for(int z=0 ; z <lstBeanfinal.size(); z++) {
					
					if(pBean.getIdproyecto() == "11") {//PETROPERU
						if(Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores()) > 0) {
						tasaAban = ((double)(Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores())) / (double) (Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+(Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores())))) * 100.00;
						tasaAban = Math.round(tasaAban*100)/100.00;
						}
						lstBeanfinal.get(z).setTasaAbandono(tasaAban);
					}else {//Otros proyectos
						if(Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores()) > 0) {
						tasaAban = ((double)(Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores())) / (double) (Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores()+lstBeanfinal.get(z).getLlamadasMenores()))) * 100.00;
						tasaAban = Math.round(tasaAban*100)/100.00;
						}
						lstBeanfinal.get(z).setTasaAbandono(tasaAban);
					}
				}
				break;
			case 3: //Procesamiento llamadas por dia de la semana
				//Primer recorrido agregar resultados de llamadas contestadas
				for(int i = 0; i<lstBean.size(); i++) {
				if(lstBean.get(i).getTipo().equals("LLAM_CONTESTADA")) {
						lstBeanfinal.add(lstBean.get(i));
				}	
				}
				boolean flag3 = false;
				//Segundo recorrido agregar resultados de llamadas no contestadas
				for(int i = 0; i<lstBean.size(); i++) {
					if(lstBean.get(i).getTipo().equals("LLAM_NOCONTESTADA")) {
					flag3 = false;	
						//Buscar si en la lista final existe el periodo evaluado
						for(int j = 0; j<lstBeanfinal.size(); j++) {
							if(lstBean.get(i).getNombrediaSemana().equals(lstBeanfinal.get(j).getNombrediaSemana())){
								lstBeanfinal.get(j).setLlamadasMayores(lstBean.get(i).getLlamadasMayores());
								lstBeanfinal.get(j).setLlamadasMenores(lstBean.get(i).getLlamadasMenores());
								flag3 = true;
						}	
						}
						if(!flag3) {
							lstBeanfinal.add(lstBean.get(i));	
						}
						
					}	
					
				}
				//CALCULO SLA TASA ABANDONO
				for(int z=0 ; z <lstBeanfinal.size(); z++) {
					
					if(pBean.getIdproyecto() == "11") {//PETROPERU
						if(Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores()) > 0) {
						tasaAban = ((double)(Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores())) / (double) (Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+(Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores())))) * 100.00;
						tasaAban = Math.round(tasaAban*100)/100.00;
						}
						lstBeanfinal.get(z).setTasaAbandono(tasaAban);
					}else {//Otros proyectos
						if(Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores()) > 0) {
						tasaAban = ((double)(Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores())) / (double) (Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores()+lstBeanfinal.get(z).getLlamadasMenores()))) * 100.00;
						tasaAban = Math.round(tasaAban*100)/100.00;
						}
						lstBeanfinal.get(z).setTasaAbandono(tasaAban);
					}
				}
				break;
			case 4: //Procesamiento llamadas por Dia des Mes
				//Primer recorrido agregar resultados de llamadas contestadas
				for(int i = 0; i<lstBean.size(); i++) {
				if(lstBean.get(i).getTipo().equals("LLAM_CONTESTADA")) {
						lstBeanfinal.add(lstBean.get(i));
				}	
				}
				boolean flag4 = false;
				//Segundo recorrido agregar resultados de llamadas no contestadas
				for(int i = 0; i<lstBean.size(); i++) {
					if(lstBean.get(i).getTipo().equals("LLAM_NOCONTESTADA")) {
					flag4 = false;	
						//Buscar si en la lista final existe el periodo evaluado
						for(int j = 0; j<lstBeanfinal.size(); j++) {
							if(lstBean.get(i).getNumerodiaMes() == lstBeanfinal.get(j).getNumerodiaMes()){
								lstBeanfinal.get(j).setLlamadasMayores(lstBean.get(i).getLlamadasMayores());
								lstBeanfinal.get(j).setLlamadasMenores(lstBean.get(i).getLlamadasMenores());
								flag4 = true;
						}	
						}
						if(!flag4) {
							lstBeanfinal.add(lstBean.get(i));	
						}
						
					}	
					
				}
				//CALCULO SLA TASA ABANDONO
				for(int z=0 ; z <lstBeanfinal.size(); z++) {
					
					if(pBean.getIdproyecto() == "11") {//PETROPERU
						if(Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores()) > 0) {
						tasaAban = ((double)(Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores())) / (double) (Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+(Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores())))) * 100.00;
						tasaAban = Math.round(tasaAban*100)/100.00;
						}
						lstBeanfinal.get(z).setTasaAbandono(tasaAban);
					}else {//Otros proyectos
						if(Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores()) > 0) {
						tasaAban = ((double)(Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores())) / (double) (Integer.parseInt(lstBeanfinal.get(z).getLlamadasContestadas())+Integer.parseInt(lstBeanfinal.get(z).getLlamadasMayores()+lstBeanfinal.get(z).getLlamadasMenores()))) * 100.00;
						tasaAban = Math.round(tasaAban*100)/100.00;
						}
						lstBeanfinal.get(z).setTasaAbandono(tasaAban);
					}
				}
				break;
			}
			
		}
		
		
		
		
		
		return lstBeanfinal;
	}
		
	
//	public List<BeanMaximo> getTiempoSolucion(BeanParameters pBeanParameters, SqlSessionFactory ssf){
//		List<BeanMaximo> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.getTiempoSolucion(pBeanParameters,session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//	
//	
//	public List<BeanMaximo> getTicketsResueltos(BeanParameters pBeanParameters, SqlSessionFactory ssf){
//		List<BeanMaximo> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.getTicketsResueltos(pBeanParameters,session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//	
//	public List<BeanMaximo> getTicketsResueltosFechas(BeanParameters pBeanParameters, SqlSessionFactory ssf){
//		List<BeanMaximo> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.getTicketsResueltosFechas(pBeanParameters,session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//	
//	public List<BeanMaximo> getTicketsResueltosEstados(BeanParameters pBeanParameters, SqlSessionFactory ssf){
//		List<BeanMaximo> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.getTicketsResueltosEstados(pBeanParameters,session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//	
//	public List<BeanMaximo> getUsuariosTop(BeanParameters pBeanParameters, SqlSessionFactory ssf){
//		List<BeanMaximo> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.getUsuariosTop(pBeanParameters,session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//	
//	
//	public List<BeanMaximo> getBackLog(BeanParameters pBeanParameters, SqlSessionFactory ssf){
//		List<BeanMaximo> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.getBackLog(pBeanParameters,session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//	
//	
//	public List<BeanMaximo> getMaximoTicketBackLog(BeanParameters pBeanParameters, SqlSessionFactory ssf){
//		List<BeanMaximo> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.getMaximoTicketBackLog(pBeanParameters,session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//	
//	public List<BeanMaximo> getMaximoTicketsResueltos(BeanParameters pBeanParameters, SqlSessionFactory ssf){
//		List<BeanMaximo> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.getMaximoTicketsResueltos(pBeanParameters,session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//
//	
//	public List<BeanMaximo> getTableBackLog(BeanParameters pBeanParameters, SqlSessionFactory ssf){
//		List<BeanMaximo> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.getTableBackLog(pBeanParameters,session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//	
//	
//	public List<BeanMaximo> getSedes(BeanParameters pBeanParameters, SqlSessionFactory ssf){
//		List<BeanMaximo> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.getSedes(pBeanParameters,session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//	
//	public List<BeanMaximo> getClientMobility(BeanParameters objBeanParameters, SqlSessionFactory ssf){
//		List<BeanMaximo> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.getClientMobility(objBeanParameters,session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//	
//	public List<BeanMaximo> getTableBackLogWO(BeanParameters pBeanParameters, SqlSessionFactory ssf){
//		List<BeanMaximo> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.getTableBackLogWO(pBeanParameters,session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//	
//	public List<BeanMaximoWorkOrder> getMaximoTicketBackLogWO(BeanParameters pBeanParameters, SqlSessionFactory ssf){
//		List<BeanMaximoWorkOrder> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.getMaximoTicketBackLogWO(pBeanParameters,session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//	
//	public List<BeanMaximoWorkOrder> getMaximoTicketBackLogWOTareas(BeanParameters pBeanParameters, SqlSessionFactory ssf){
//		List<BeanMaximoWorkOrder> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.getMaximoTicketBackLogWOTareas(pBeanParameters,session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//	
//	public List<WorkOrder> getMaximoTicketWorkOrder(int opcionMapper,BeanBusqueda bean, SqlSessionFactory ssf){
//		List<WorkOrder> lstBeanMaximoMobility = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
//			lstBeanMaximoMobility = objMaximoMobilityImpl.obtenerListaWorkOrder(opcionMapper, bean, session);
//		}catch(Exception ex){
//			lstBeanMaximoMobility = null;
//		}finally {
//				session.close();
//		}
//		return lstBeanMaximoMobility;
//	}
//	
//	public List<BeanSlaMDA> getSlaMDADiario(BeanSlaMDA pBeanSla, SqlSessionFactory ssf){
//		List<BeanSlaMDA> lstBeanSla = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
//			lstBeanSla = objSlaImpl.getSlaDiario(pBeanSla, session);
//		}catch(Exception ex){
//			lstBeanSla = null;
//		}finally {
//			session.close();
//		}
//		return lstBeanSla;
//	}
//	
//	public BeanSlaMDA getSlaMDAMensual(BeanSlaMDA pBeanSla, SqlSessionFactory ssf){
//		BeanSlaMDA beanSla = new BeanSlaMDA();
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
//			beanSla = objSlaImpl.getSlaMensual(pBeanSla, session);
//		}catch(Exception ex){
//			beanSla = null;
//		}finally {
//			session.close();
//		}
//		return beanSla;
//	}
//	
//	public List<BeanReporteLlamadas> getReporteLlamadasContestadas(BeanReporteLlamadas objBean, SqlSessionFactory ssf){
//		List<BeanReporteLlamadas> listLlamadas= null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
//			listLlamadas = objSlaImpl.getReporteLlamadasContestadas(objBean, session);
//		}catch(Exception ex){
//			listLlamadas = null;
//		}finally {
//			session.close();
//		}
//		return listLlamadas;
//	}
//	
//	public List<BeanReporteLlamadas> getReporteLlamadasNoContestadas(BeanReporteLlamadas objBean, SqlSessionFactory ssf){
//		List<BeanReporteLlamadas> listLlamadas= null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
//			listLlamadas = objSlaImpl.getReporteLlamadasNoContestadas(objBean, session);
//		}catch(Exception ex){
//			listLlamadas = null;
//		}finally {
//			session.close();
//		}
//		return listLlamadas;
//	}
//	
//	public int updateCorreo(BeanSlaMDA pBeanSla, SqlSessionFactory ssf){
//		int resultado = 0;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
//			resultado = objSlaImpl.updateCorreos(pBeanSla, session);
//		}catch(Exception ex){
//			resultado = 0;
//		}finally {
//			session.close();
//		}
//		return resultado;
//	}
//	
//	public List<BeanTicketSRINC> getTicketSRINC(BeanTicketSRINC objBean, SqlSessionFactory ssf){
//		List<BeanTicketSRINC> listTickets= null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
//			listTickets = objSlaImpl.getTicketSRINC(objBean, session);
//		}catch(Exception ex){
//			listTickets = null;
//		}finally {
//			session.close();
//		}
//		return listTickets;
//	}
//	
//	public List<BeanSlaMDA> getTasaResolucionDiario(BeanSlaMDA pBeanSla, SqlSessionFactory ssf){
//		List<BeanSlaMDA> lstBeanSla = null;
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
//			lstBeanSla = objSlaImpl.getTasaResolucionDiario(pBeanSla, session);
//		}catch(Exception ex){
//			lstBeanSla = null;
//		}finally {
//			session.close();
//		}
//		return lstBeanSla;
//	}
//	
//	public BeanSlaMDA getTasaResolucionMensual(BeanSlaMDA pBeanSla, SqlSessionFactory ssf){
//		BeanSlaMDA beanSla = new BeanSlaMDA();
//		SqlSession session = null;
//		try {
//			session = ssf.openSession(true);
//			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
//			beanSla = objSlaImpl.getTasaResolucionMensual(pBeanSla, session);
//		}catch(Exception ex){
//			beanSla = null;
//		}finally {
//			session.close();
//		}
//		return beanSla;
//	}
}
