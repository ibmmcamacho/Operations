package com.pe.ibm.business;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanAuditoria;
import com.pe.ibm.bean.BeanControlErrores;
import com.pe.ibm.dao.DaoAuditoriaImpl;

public class BusinessAuditoria {
	
	public void saveAuditoria(BeanAuditoria pBeanAuditoria, SqlSessionFactory ssf){
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoAuditoriaImpl objDaoAuditoriaImpl = new DaoAuditoriaImpl();
			
			objDaoAuditoriaImpl.saveAuditoria(pBeanAuditoria, session);
		} catch (Exception ex) {
			System.out.println("Layer Business: ==> " + ex.getMessage());
		}finally {
			session.close();
		}
	}
	
	public int saveControlErr(BeanControlErrores pBeanControlErrores, SqlSessionFactory ssf){
		SqlSession session = null;
		int iresult = 0;
		try {
			session = ssf.openSession(true);
			DaoAuditoriaImpl objDaoAuditoriaImpl = new DaoAuditoriaImpl();
			
			iresult = objDaoAuditoriaImpl.saveErr(pBeanControlErrores, session);
		} catch (Exception ex) {
			System.out.println("Layer Business: ==> " + ex.getMessage());
		}finally {
			session.close();
		}
		return iresult;
	}

}
