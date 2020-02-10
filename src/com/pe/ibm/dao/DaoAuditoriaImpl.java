package com.pe.ibm.dao;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanAuditoria;
import com.pe.ibm.bean.BeanControlErrores;
import com.pe.ibm.interfac.DaoAuditoria;

public class DaoAuditoriaImpl implements DaoAuditoria{

	@Override
	public void saveAuditoria(BeanAuditoria pBeanAuditoria, SqlSession session) {
		try{
			session.insert("auditoria.saveAuditoria", pBeanAuditoria);					
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}

	@Override
	public int saveErr(BeanControlErrores pBeanControlErrores, SqlSession session) {
		int iresult = 0;
		try{
			iresult = session.insert("auditoria.saveErr", pBeanControlErrores);					
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return iresult;
	}

}
