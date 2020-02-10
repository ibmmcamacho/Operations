package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanBusqueda;
import com.pe.ibm.bean.BeanConsumoBackup;
import com.pe.ibm.bean.BeanConsumoDisco;
import com.pe.ibm.bean.BeanConsumoSistema;
import com.pe.ibm.bean.BeanTareaAsignada;

public interface DaoConsumos {

	public List<BeanConsumoDisco> listConsumosDisco(SqlSession session, BeanBusqueda beanBusqueda);
	
	public List<BeanConsumoBackup> listConsumosBackup(SqlSession session, BeanBusqueda beanBusqueda);
	public int insertUdpateConsumoBackup(BeanConsumoBackup beanBackup, SqlSession sqlSession);
	
	public List<BeanConsumoSistema> listConsumosSistema(SqlSession session, BeanBusqueda beanBusqueda);
	
	
}
