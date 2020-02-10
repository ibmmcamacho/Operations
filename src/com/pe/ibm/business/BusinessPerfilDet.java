package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanPerfil;
import com.pe.ibm.bean.BeanPerfilDet;
import com.pe.ibm.bean.BeanReporteDispatch;
import com.pe.ibm.dao.DaoPerfilImpl;
import com.pe.ibm.dao.DaoReporteDispatchImpl;
import com.pe.ibm.dao.DaoOptionsImpl;
import com.pe.ibm.dao.DaoPerfilDetImpl;
import com.pe.ibm.interfac.DaoOptions;
import com.pe.ibm.interfac.DaoPerfil;
import com.pe.ibm.interfac.DaoPerfilDet;
import com.pe.ibm.interfac.DaoReporteDispatch;

public class BusinessPerfilDet {
	
	public List<BeanPerfilDet> listPerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSessionFactory ssf) {
		List<BeanPerfilDet> lstBeanPerfilDet = null;
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			DaoPerfilDet objDaoPerfilDetImpl = new DaoPerfilDetImpl();
			lstBeanPerfilDet = objDaoPerfilDetImpl.listPerfilDet(pBeanPerfilDet, session);
		} catch (Exception ex) {
			lstBeanPerfilDet = null;
		}finally {
				session.close();
		}
		return lstBeanPerfilDet;
	}
	
	
	public List<BeanPerfilDet> listCboPerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSessionFactory ssf) {
		List<BeanPerfilDet> lstBeanPerfilDet = null;
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPerfilDet objDaoPerfilDetImpl = new DaoPerfilDetImpl();
			lstBeanPerfilDet = objDaoPerfilDetImpl.listCboPerfilDet(pBeanPerfilDet,session);
		} catch (Exception ex) {
			lstBeanPerfilDet = null;
		}finally {
				session.close();
		}
		return lstBeanPerfilDet;
	}
	
	
	public int savePerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPerfilDet objDaoPerfilDetImpl = new DaoPerfilDetImpl();
			icount = objDaoPerfilDetImpl.savePerfilDet(pBeanPerfilDet,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}

	public int updatePerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPerfilDet objDaoPerfilDetImpl = new DaoPerfilDetImpl();
			icount = objDaoPerfilDetImpl.updatePerfilDet(pBeanPerfilDet,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}

	public int deletePerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPerfilDet objDaoPerfilDetImpl = new DaoPerfilDetImpl();
			icount = objDaoPerfilDetImpl.deletePerfilDet(pBeanPerfilDet,session);
		} catch (Exception ex) {
			icount = 0;
			System.out.println(ex.getCause().getMessage());
		}finally {
				session.close();
		}
		return icount;
	}
	
	
	
}
