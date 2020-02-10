package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.dao.DaoDistribucionTickets;
import com.pe.ibm.dao.DaoDistribucionTicketsImpl;
import com.pe.ibm.bean.BeanDistribucionTickets;



public class BusinessDistribucionTickets {
	

	public BeanDistribucionTickets obtenerDistribucionTickets (String pIdproyecto,String pMes, String pAnio, SqlSessionFactory ssf)
	{
		SqlSession session = null;
		BeanDistribucionTickets beanTickets=new BeanDistribucionTickets();
		DaoDistribucionTickets daoTickets=new DaoDistribucionTicketsImpl();
		
		try {
			session = ssf.openSession(true);
			beanTickets = daoTickets.obtenerPorProyecto(pIdproyecto, pMes, pAnio, session);
		} catch (Exception ex) {
			beanTickets=new BeanDistribucionTickets();
		}finally {
				session.close();
		}
		
		return beanTickets;
	}
	
	public List<BeanDistribucionTickets> obtenerDistribucionTicketsHistorico (String pCliente,String pFechaInicio, String pFechaFin, SqlSessionFactory ssf)
	{
		SqlSession session = null;
		List<BeanDistribucionTickets> ListaTickets= new ArrayList<BeanDistribucionTickets>();
		DaoDistribucionTickets daoTickets=new DaoDistribucionTicketsImpl();
		
		try {
			session = ssf.openSession(true);
			ListaTickets = daoTickets.obtenerHistoricoPorProyecto(pCliente, pFechaInicio, pFechaFin, session);
		} catch (Exception ex) {
			ListaTickets=new ArrayList<BeanDistribucionTickets>();
		}finally {
				session.close();
		}
		
		return ListaTickets;
	}
	
	public List<BeanDistribucionTickets> getLineaBaseSDDHistorico(String pidProyecto, String pFechaInicio,  SqlSessionFactory ssf)
	{
		SqlSession session = null;
		List<BeanDistribucionTickets> ListaTickets= new ArrayList<BeanDistribucionTickets>();
		DaoDistribucionTickets daoTickets=new DaoDistribucionTicketsImpl();
		
		try {
			session = ssf.openSession(true);
			ListaTickets = daoTickets.getLineaBaseSDDHistorico(pidProyecto, pFechaInicio, session);
		} catch (Exception ex) {
			ListaTickets=new ArrayList<BeanDistribucionTickets>();
		}finally {
				session.close();
		}
		
		return ListaTickets;
	}

}
