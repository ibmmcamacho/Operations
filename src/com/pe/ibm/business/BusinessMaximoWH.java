package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.dao.DaoMaximoWHImpl;
import com.pe.ibm.interfac.DaoMaximoWH;

public class BusinessMaximoWH {

	public List<BeanMaximo> getPaises(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getPaises(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getClientes(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getClientes(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getMensual(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getMensual(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getDiario(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getDiario(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getEstados(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getEstados(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getTendenciaActual(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getTendenciaActual(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public List<BeanMaximo> getTicketsPaises(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getTicketsPaises(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getTicketsClientes(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getTicketsClientes(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getTicketsMensual(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getTicketsMensual(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getTicketsDiario(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getTicketsDiario(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getTicketsEstados(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getTicketsEstados(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getTicketsTendenciaActual(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getTicketsTendenciaActual(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public List<BeanMaximo> getTICKET_INCSRS(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getTICKET_INCSRS(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getTICKET_INCSRS_BACKLOG(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getTICKET_INCSRS_BACKLOG(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getTICKET_PRO(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getTICKET_PRO(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getTICKET_PRO_BACKLOG(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getTICKET_PRO_BACKLOG(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getTICKET_WORKORDER_CAN(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getTICKET_WORKORDER_CAN(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getWORKORDER_CHAWORACT(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getWORKORDER_CHAWORACT(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getWORKORDER_CHAWORACT_BACKLOG(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getWORKORDER_CHAWORACT_BACKLOG(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getBacklogGSP(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getBacklogGSP(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};
	
	public List<BeanMaximo> getCiscoMesa(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanMaximo> lstBeanMaximoWH = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoMaximoWH objMaximoWHImpl = new DaoMaximoWHImpl();
			lstBeanMaximoWH = objMaximoWHImpl.getCiscoMesa(pBeanParameters,session);
		}catch(Exception ex){
			lstBeanMaximoWH = null;
		}finally {
				session.close();
		}
		return lstBeanMaximoWH;
	};

}
