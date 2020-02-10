package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanReporteDispatch;
import com.pe.ibm.dao.DaoReporteDispatchImpl;
import com.pe.ibm.interfac.DaoReporteDispatch;

public class BusinessReporteDispatch {

	public List<BeanReporteDispatch> listReporteDispatch(BeanReporteDispatch pBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteDispatch(pBeanReporteDispatch, session);
		} catch (Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
				session.close();
		}
		return lstBeanReporteDispatch;
	}
	
	public List<BeanReporteDispatch> listReporteCriteria(BeanReporteDispatch pBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteCriteria(pBeanReporteDispatch, session);
		} catch (Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
				session.close();
		}
		return lstBeanReporteDispatch;
	}
	
	public List<BeanReporteDispatch> list(BeanReporteDispatch pBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.list(pBeanReporteDispatch, session);
		} catch (Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
				session.close();
		}
		return lstBeanReporteDispatch;
	}
	
	public List<BeanReporteDispatch> listTeam(BeanReporteDispatch pBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listTeam(pBeanReporteDispatch, session);
		} catch (Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
				session.close();
		}
		return lstBeanReporteDispatch;
	}

	public List<BeanReporteDispatch> listCliente(BeanReporteDispatch pBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listCliente(pBeanReporteDispatch, session);
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}
		return lstBeanReporteDispatch;
	}
	
	
	public List<BeanReporteDispatch> listReporteDispatchEspecialista_1(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteDispatchEspecialista_1(objBeanReporteDispatch, session);		
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}		
		return lstBeanReporteDispatch;
	}

	
	public List<BeanReporteDispatch> listReporteDispatchEspecialista_2(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteDispatchEspecialista_2(objBeanReporteDispatch, session);
 		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}
		return lstBeanReporteDispatch;
	}

	
	public List<BeanReporteDispatch> listReporteDispatchHorarioOficina(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteDispatchHorarioOficina(objBeanReporteDispatch, session);
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}
		return lstBeanReporteDispatch;
	}

	public List<BeanReporteDispatch> listReporteDispatchSquad(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteDispatchSquad(objBeanReporteDispatch, session);
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}
		return lstBeanReporteDispatch;
	}

	public List<BeanReporteDispatch> listComboTorre(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listComboTorre(objBeanReporteDispatch, session);
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}
		return lstBeanReporteDispatch;
	}

	public List<BeanReporteDispatch> listReporteDispatchHorarioOficina_barras(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteDispatchHorarioOficina_barras(objBeanReporteDispatch, session);
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}
		return lstBeanReporteDispatch;
	}

	
	public List<BeanReporteDispatch> listReporteDispatchSquad_barras(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteDispatchSquad_barras(objBeanReporteDispatch, session);
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}
		return lstBeanReporteDispatch;
	}
	
	
	public List<BeanReporteDispatch> listReporteDispatchEspecialista_2_barras(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteDispatchEspecialista_2_barras(objBeanReporteDispatch, session);
 		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}
		return lstBeanReporteDispatch;
	}

	public List<BeanReporteDispatch> listReporteDispatchEspecialista_1_barras(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteDispatchEspecialista_1_barras(objBeanReporteDispatch, session);
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}
		return lstBeanReporteDispatch;
	}

	public List<BeanReporteDispatch> listReporteDispatchResolucionSemanal(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteDispatchResolucionSemanal(objBeanReporteDispatch, session);
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}
		return lstBeanReporteDispatch;
	}

	public List<BeanReporteDispatch> listReporteDispatchMensualSquad(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteDispatchMensualSquad(objBeanReporteDispatch, session);
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}

		return lstBeanReporteDispatch;
	}

	public List<BeanReporteDispatch> listReporteDispatchMensualHoras(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteDispatchMensualHoras(objBeanReporteDispatch, session);
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}
		return lstBeanReporteDispatch;
	}
	
	public List<BeanReporteDispatch> listReporteMesActual(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteMesActual(objBeanReporteDispatch, session);		
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}		
		return lstBeanReporteDispatch;
	}
	
	public List<BeanReporteDispatch> listReporteMesActualHorario(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteMesActualHorario(objBeanReporteDispatch, session);		
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}		
		return lstBeanReporteDispatch;
	}
	
	public List<BeanReporteDispatch> listReporteEspecialistaClase(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteEspecialistaClase(objBeanReporteDispatch, session);		
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}		
		return lstBeanReporteDispatch;
	}
	
	public List<BeanReporteDispatch> listReporteEspecialistaHorario(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listReporteEspecialistaHorario(objBeanReporteDispatch, session);		
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}		
		return lstBeanReporteDispatch;
	}
	
	public List<BeanReporteDispatch> listTendenciaResolucion(BeanReporteDispatch objBeanReporteDispatch, SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listTendenciaResolucion(objBeanReporteDispatch, session);		
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}		
		return lstBeanReporteDispatch;
	}
	
	public List<BeanReporteDispatch> listGrupoResolutor(SqlSessionFactory ssf) {
		List<BeanReporteDispatch> lstBeanReporteDispatch = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteDispatch objDaoReporteDispatchImpl = new DaoReporteDispatchImpl();
			lstBeanReporteDispatch = objDaoReporteDispatchImpl.listGrupoResolutor(session);		
		}catch(Exception ex) {
			lstBeanReporteDispatch = null;
		}finally {
			session.close();
		}		
		return lstBeanReporteDispatch;
	}
}
