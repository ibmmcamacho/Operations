package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanPerfil;
import com.pe.ibm.bean.BeanPerfilDet;
import com.pe.ibm.bean.BeanReporteDispatch;

public interface DaoPerfilDet {

	public List<BeanPerfilDet> listPerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSession session);	
	public List<BeanPerfilDet> listCboPerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSession session);
	public int savePerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSession session);
	public int updatePerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSession session);
	public int deletePerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSession session);
	
}
