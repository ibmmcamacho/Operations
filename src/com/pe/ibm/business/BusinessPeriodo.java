package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanPeriodo;
import com.pe.ibm.bean.BeanPeriodoDet;
import com.pe.ibm.dao.DaoPeriodoImpl;
import com.pe.ibm.dao.DaoPersonalImpl;
import com.pe.ibm.interfac.DaoPeriodo;
import com.pe.ibm.interfac.DaoPersonal;

public class BusinessPeriodo {
	

	public List<BeanPeriodo> listar(SqlSessionFactory ssf){

		SqlSession sqlSession = ssf.openSession();
		
		DaoPeriodo dao = new DaoPeriodoImpl();
		List<BeanPeriodo> lista = new ArrayList<BeanPeriodo>();
			try {
				lista = dao.listar(sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	
	public List<BeanPeriodo> listReportePeriodo(BeanPeriodo objBeanPeriodo, SqlSessionFactory ssf) {
		List<BeanPeriodo> lstBeanReportePeriodo = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoPeriodo objDaoPeriodoImpl = new DaoPeriodoImpl();
			lstBeanReportePeriodo = objDaoPeriodoImpl.listReportePeriodo(objBeanPeriodo, session);
		}catch(Exception ex) {
			lstBeanReportePeriodo = null;
		}finally {
			session.close();
		}
		return lstBeanReportePeriodo;
	}
	
	
	public int mGuardar(BeanPeriodo objPeriodo, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPeriodo objDaoPeriodoImpl = new DaoPeriodoImpl();
			icount = objDaoPeriodoImpl.mGuardar(objPeriodo, session);
		}catch(Exception ex) {
			icount = 0;
		}finally {
			session.close();
		}
		return icount;
	}

	public int mGuardar_Det(BeanPeriodoDet objPeriodoDet, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount_Det = 0;
		try {
			session = ssf.openSession(true);
			DaoPeriodo objDaoPeriodoImpl = new DaoPeriodoImpl();
			icount_Det = objDaoPeriodoImpl.mGuardar_Det(objPeriodoDet, session);
		}catch(Exception ex) {
			icount_Det = 0;
		}finally {
			session.close();
		}
		return icount_Det;
	}
	
	public int mUpdate_Det(BeanPeriodoDet objPeriodoDet, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount_Det = 0;
		try {
			session = ssf.openSession(true);
			DaoPeriodo objDaoPeriodoImpl = new DaoPeriodoImpl();
			icount_Det = objDaoPeriodoImpl.mUpdate_Det(objPeriodoDet, session);
		}catch(Exception ex) {
			icount_Det = 0;
		}finally {
			session.close();
		}
		return icount_Det;
	}


	public int deletePeriodo(BeanPeriodo objPeriodo, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPeriodo objDaoPeriodolImpl = new DaoPeriodoImpl();
			icount = objDaoPeriodolImpl.deletePeriodo(objPeriodo,session);
		} catch (Exception ex) {
			icount = 0;
			System.out.println(ex.getCause().getMessage());
		}finally {
				session.close();
		}
		return icount;
	}


	public List<BeanPeriodoDet> mBuscarDatos_PeriodoDet(BeanPeriodoDet objBeanPeriodoDet, SqlSessionFactory ssf) {
		List<BeanPeriodoDet> mBuscarDatos_PeriodoDet = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoPeriodo objDaoPeriodoImpl = new DaoPeriodoImpl();
			mBuscarDatos_PeriodoDet = objDaoPeriodoImpl.mBuscarDatos_PeriodoDet(objBeanPeriodoDet, session);
		}catch(Exception ex) {
			mBuscarDatos_PeriodoDet = null;
		}finally {
			session.close();
		}
		return mBuscarDatos_PeriodoDet;
	}
	
	
	public int mActualizar(BeanPeriodo objPeriodo, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPeriodo objDaoPeriodoImpl = new DaoPeriodoImpl();
			icount = objDaoPeriodoImpl.mActualizar(objPeriodo, session);
		}catch(Exception ex) {
			icount = 0;
		}finally {
			session.close();
		}
		return icount;
	}


	public int mEliminarDet(BeanPeriodoDet objPeriodoDet, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPeriodo objDaoPeriodoDetImpl = new DaoPeriodoImpl();
			icount = objDaoPeriodoDetImpl.mEliminar(objPeriodoDet, session);
		}catch(Exception ex) {
			icount = 0;
		}finally {
			session.close();
		}
		return icount;
	}

	
	

}
