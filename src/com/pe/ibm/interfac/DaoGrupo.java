package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanGrupo;

public interface DaoGrupo {
	
	public List<BeanGrupo> listGrupo(BeanGrupo pBeanGrupo, SqlSession session);
	
}
