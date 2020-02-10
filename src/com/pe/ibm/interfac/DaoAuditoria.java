package com.pe.ibm.interfac;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanAuditoria;
import com.pe.ibm.bean.BeanControlErrores;

public interface DaoAuditoria {
	
	public void saveAuditoria(BeanAuditoria pBeanAuditoria, SqlSession session);
	public int saveErr(BeanControlErrores pBeanControlErrores, SqlSession session);

}
