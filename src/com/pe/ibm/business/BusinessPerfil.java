package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanPerfil;
import com.pe.ibm.dao.DaoPerfilImpl;
import com.pe.ibm.interfac.DaoPerfil;

public class BusinessPerfil {

	public List<BeanPerfil> listPerfil(BeanPerfil pBeanPerfil, SqlSessionFactory ssf) {
		List<BeanPerfil> lstBeanPerfil = null;
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPerfil objDaoPerfilImpl = new DaoPerfilImpl();
			lstBeanPerfil = objDaoPerfilImpl.listPerfil(pBeanPerfil,session);
		} catch (Exception ex) {
			lstBeanPerfil = null;
		}finally {
				session.close();
		}
		return lstBeanPerfil;
	}
	
	
	
	public List<BeanPerfil> listPerfilDet(BeanPerfil pBeanPerfil, SqlSessionFactory ssf) {
		List<BeanPerfil> lstBeanPerfil = null;
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPerfil objDaoPerfilImpl = new DaoPerfilImpl();
			lstBeanPerfil = objDaoPerfilImpl.listPerfilDet(pBeanPerfil,session);
		} catch (Exception ex) {
			lstBeanPerfil = null;
		}finally {
				session.close();
		}
		return lstBeanPerfil;
	}
	
	

	public int savePerfil(BeanPerfil pBeanPerfil, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPerfil objDaoPerfilImpl = new DaoPerfilImpl();
			icount = objDaoPerfilImpl.savePerfil(pBeanPerfil,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}

	public int updatePerfil(BeanPerfil pBeanPerfil, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPerfil objDaoPerfilImpl = new DaoPerfilImpl();
			icount = objDaoPerfilImpl.updatePerfil(pBeanPerfil,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}

	public int deletePerfil(BeanPerfil pBeanPerfil, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPerfil objDaoPerfilImpl = new DaoPerfilImpl();
			icount = objDaoPerfilImpl.deletePerfil(pBeanPerfil,session);
		} catch (Exception ex) {
			icount = 0;
			System.out.println(ex.getCause().getMessage());
		}finally {
				session.close();
		}
		return icount;
	}

}
