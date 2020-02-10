package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanPerfil;

public interface DaoPerfil {
	
	public List<BeanPerfil> listPerfil(BeanPerfil pBeanPerfil, SqlSession session);	
	public List<BeanPerfil> listPerfilDet(BeanPerfil pBeanPerfil, SqlSession session);	
	public int savePerfil(BeanPerfil pBeanPerfil, SqlSession session);
	public int updatePerfil(BeanPerfil pBeanPerfil, SqlSession session);
	public int deletePerfil(BeanPerfil pBeanPerfil, SqlSession session);

}
