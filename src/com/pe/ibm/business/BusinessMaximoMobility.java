package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanBusqueda;
import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanMaximoWorkOrder;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanReporteLlamadas;
import com.pe.ibm.bean.BeanSlaMDA;
import com.pe.ibm.bean.BeanTicketSRINC;
import com.pe.ibm.bean.WorkOrder;
import com.pe.ibm.dao.DaoMaximoMobilityImpl;

public class BusinessMaximoMobility {
	
	public List<BeanMaximo> getTiempoSolucion(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.getTiempoSolucion(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}
	
	
	public List<BeanMaximo> getTicketsResueltos(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.getTicketsResueltos(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}
	
	public List<BeanMaximo> getTicketsResueltosFechas(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.getTicketsResueltosFechas(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}
	
	public List<BeanMaximo> getTicketsResueltosEstados(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.getTicketsResueltosEstados(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}
	
	public List<BeanMaximo> getUsuariosTop(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.getUsuariosTop(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}
	
	
	public List<BeanMaximo> getBackLog(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.getBackLog(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}
	
	
	public List<BeanMaximo> getMaximoTicketBackLog(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.getMaximoTicketBackLog(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}
	
	public List<BeanMaximo> getMaximoTicketsResueltos(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.getMaximoTicketsResueltos(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}

	
	public List<BeanMaximo> getTableBackLog(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.getTableBackLog(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}
	
	
	public List<BeanMaximo> getSedes(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.getSedes(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}
	
	public List<BeanMaximo> getClientMobility(BeanParameters objBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.getClientMobility(objBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}
	
	public List<BeanMaximo> getTableBackLogWO(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.getTableBackLogWO(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}
	
	public List<BeanMaximoWorkOrder> getMaximoTicketBackLogWO(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximoWorkOrder> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.getMaximoTicketBackLogWO(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}
	
	public List<BeanMaximoWorkOrder> getMaximoTicketBackLogWOTareas(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximoWorkOrder> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.getMaximoTicketBackLogWOTareas(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}
	
	public List<WorkOrder> getMaximoTicketWorkOrder(int opcionMapper,BeanBusqueda bean, SqlSessionFactory ssf){
		List<WorkOrder> lstBeanMaximoMobility = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objMaximoMobilityImpl = new DaoMaximoMobilityImpl();
			lstBeanMaximoMobility = objMaximoMobilityImpl.obtenerListaWorkOrder(opcionMapper, bean, session);
		}catch(Exception ex){
			lstBeanMaximoMobility = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoMobility;
	}
	
	public List<BeanSlaMDA> getSlaMDADiario(BeanSlaMDA pBeanSla, SqlSessionFactory ssf){
		List<BeanSlaMDA> lstBeanSla = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
			lstBeanSla = objSlaImpl.getSlaDiario(pBeanSla, session);
		}catch(Exception ex){
			lstBeanSla = null;
		}finally {
			session.close();
		}
		return lstBeanSla;
	}
	
	public BeanSlaMDA getSlaMDAMensual(BeanSlaMDA pBeanSla, SqlSessionFactory ssf){
		BeanSlaMDA beanSla = new BeanSlaMDA();
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
			beanSla = objSlaImpl.getSlaMensual(pBeanSla, session);
		}catch(Exception ex){
			beanSla = null;
		}finally {
			session.close();
		}
		return beanSla;
	}
	
	public List<BeanReporteLlamadas> getReporteLlamadasContestadas(BeanReporteLlamadas objBean, SqlSessionFactory ssf){
		List<BeanReporteLlamadas> listLlamadas= null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
			listLlamadas = objSlaImpl.getReporteLlamadasContestadas(objBean, session);
		}catch(Exception ex){
			listLlamadas = null;
		}finally {
			session.close();
		}
		return listLlamadas;
	}
	
	public List<BeanReporteLlamadas> getReporteLlamadasNoContestadas(BeanReporteLlamadas objBean, SqlSessionFactory ssf){
		List<BeanReporteLlamadas> listLlamadas= null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
			listLlamadas = objSlaImpl.getReporteLlamadasNoContestadas(objBean, session);
		}catch(Exception ex){
			listLlamadas = null;
		}finally {
			session.close();
		}
		return listLlamadas;
	}
	
	public int updateCorreo(BeanSlaMDA pBeanSla, SqlSessionFactory ssf){
		int resultado = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
			resultado = objSlaImpl.updateCorreos(pBeanSla, session);
		}catch(Exception ex){
			resultado = 0;
		}finally {
			session.close();
		}
		return resultado;
	}
	
	public List<BeanTicketSRINC> getTicketSRINC(BeanTicketSRINC objBean, SqlSessionFactory ssf){
		List<BeanTicketSRINC> listTickets= null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
			listTickets = objSlaImpl.getTicketSRINC(objBean, session);
		}catch(Exception ex){
			listTickets = null;
		}finally {
			session.close();
		}
		return listTickets;
	}
	
	public List<BeanSlaMDA> getTasaResolucionDiario(BeanSlaMDA pBeanSla, SqlSessionFactory ssf){
		List<BeanSlaMDA> lstBeanSla = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
			lstBeanSla = objSlaImpl.getTasaResolucionDiario(pBeanSla, session);
		}catch(Exception ex){
			lstBeanSla = null;
		}finally {
			session.close();
		}
		return lstBeanSla;
	}
	
	public BeanSlaMDA getTasaResolucionMensual(BeanSlaMDA pBeanSla, SqlSessionFactory ssf){
		BeanSlaMDA beanSla = new BeanSlaMDA();
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoMobilityImpl objSlaImpl = new DaoMaximoMobilityImpl();
			beanSla = objSlaImpl.getTasaResolucionMensual(pBeanSla, session);
		}catch(Exception ex){
			beanSla = null;
		}finally {
			session.close();
		}
		return beanSla;
	}
}
