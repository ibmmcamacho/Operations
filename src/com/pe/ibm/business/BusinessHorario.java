package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanHorario;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.dao.DaoHorarioImpl;
import com.pe.ibm.interfac.DaoHorario;

public class BusinessHorario {
	
	public List<BeanHorario> listHorario(BeanHorario pBeanHorario, SqlSessionFactory ssf) {
		List<BeanHorario> lstBeanHorario = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoHorario objDaoHorarioImpl = new DaoHorarioImpl();
			lstBeanHorario = objDaoHorarioImpl.listHorario(pBeanHorario, session);
		} catch (Exception ex) {
			lstBeanHorario = null;
		}finally {
				session.close();
		}
		return lstBeanHorario;
	}

	public int saveHorario(BeanHorario pBeanHorario, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoHorario objDaoHorarioImpl = new DaoHorarioImpl();
			icount = objDaoHorarioImpl.saveHorario(pBeanHorario, session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}

	public int updateHorario(BeanHorario pBeanHorario, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoHorario objDaoHorarioImpl = new DaoHorarioImpl();
			icount = objDaoHorarioImpl.updateHorario(pBeanHorario, session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}

	public int deleteHorario(BeanHorario pBeanHorario, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoHorario objDaoHorarioImpl = new DaoHorarioImpl();
			icount = objDaoHorarioImpl.deleteHorario(pBeanHorario, session);
		} catch (Exception ex) {
			icount = 0;
			System.out.println(ex.getCause().getMessage());
		}finally {
				session.close();
		}
		return icount;
	}
	
	public BeanParameters getValidateHorario(BeanParameters pBeanParameters, SqlSessionFactory ssf) {
		BeanParameters objBeanParameters = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoHorario objDaoHorarioImpl = new DaoHorarioImpl();
			objBeanParameters = objDaoHorarioImpl.getValidateHorario(pBeanParameters, session);
		} catch (Exception ex) {
			objBeanParameters = null;
		}finally {
				session.close();
		}
		
		return objBeanParameters;
	}
	
	
	public List<BeanParameters> listHorarioAsignacion(BeanParameters pBeanParameters, SqlSessionFactory ssf) {
		List<BeanParameters> lstBeanParameters = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoHorario objDaoHorarioImpl = new DaoHorarioImpl();
			lstBeanParameters = objDaoHorarioImpl.listHorarioAsignacion(pBeanParameters, session);
		} catch (Exception ex) {
			lstBeanParameters = null;
		}finally {
				session.close();
		}
		
		return lstBeanParameters;
	}

	public int saveHorario(BeanParameters pBeanParameters, SqlSessionFactory ssf) {

		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoHorario objDaoHorarioImpl = new DaoHorarioImpl();
			icount = objDaoHorarioImpl.saveHorarioAsignacion(pBeanParameters, session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}

		return icount;
	}

	public int updateHorario(BeanParameters pBeanParameters, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoHorario objDaoHorarioImpl = new DaoHorarioImpl();
			icount = objDaoHorarioImpl.updateHorarioAsignacion(pBeanParameters, session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}

		return icount;
	}

	public int deleteHorario(BeanParameters pBeanParameters, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoHorario objDaoHorarioImpl = new DaoHorarioImpl();
			icount = objDaoHorarioImpl.deleteHorarioAsignacion(pBeanParameters, session);
		} catch (Exception ex) {
			icount = 0;
			System.out.println(ex.getCause().getMessage());
		}finally {
				session.close();
		}
		return icount;
	}

}
