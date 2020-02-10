package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanBusqueda;
import com.pe.ibm.bean.BeanConsumoBackup;
import com.pe.ibm.bean.BeanConsumoDisco;
import com.pe.ibm.bean.BeanConsumoSistema;
import com.pe.ibm.bean.BeanTurno;
import com.pe.ibm.interfac.DaoConsumos;

public class DaoConsumosImple implements DaoConsumos {

	@Override
	public List<BeanConsumoDisco> listConsumosDisco(SqlSession session, BeanBusqueda beanBusqueda) {
		List<BeanConsumoDisco> lstBeanConsumoDisco = null;
		try{
			if(beanBusqueda == null) {
				lstBeanConsumoDisco = session.selectList("consumos.getConsumosDisco");	
			}else {
				lstBeanConsumoDisco = session.selectList("consumos.getHistoricoConsumosDisco", beanBusqueda);
			}
					
			}
			catch(Exception ex){
				lstBeanConsumoDisco = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanConsumoDisco;
	}

	@Override
	public List<BeanConsumoBackup> listConsumosBackup(SqlSession session, BeanBusqueda beanBusqueda) {
		List<BeanConsumoBackup> lstBeanConsumoBackup = null;
		try{
			if(beanBusqueda == null) {
				lstBeanConsumoBackup = session.selectList("consumos.getConsumosBackup");
			}else {
				lstBeanConsumoBackup = session.selectList("consumos.getHistorialConsumosBackup", beanBusqueda);
			}
					
			}
			catch(Exception ex){
				lstBeanConsumoBackup = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanConsumoBackup;
	}

	@Override
	public List<BeanConsumoSistema> listConsumosSistema(SqlSession session, BeanBusqueda beanBusqueda) {
		List<BeanConsumoSistema> lstBeanConsumoSistema = null;
		try{
			if(beanBusqueda == null) {
				lstBeanConsumoSistema = session.selectList("consumos.getConsumosSistema");
			}else {
				lstBeanConsumoSistema = session.selectList("consumos.getHistorialConsumosSistema", beanBusqueda);
			}
					
			}
			catch(Exception ex){
				lstBeanConsumoSistema = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanConsumoSistema;
	}

	@Override
	public int insertUdpateConsumoBackup(BeanConsumoBackup beanBackup, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		int resultado = 0;
		BeanConsumoBackup bean = new BeanConsumoBackup();
		bean = beanBackup;
			try {
				if(sqlSession!=null){
					sqlSession.selectOne("consumos.insertUpdateBackup",bean);
					resultado =  bean.getResultado();	
				}else{
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}	
		return resultado;
	}

}
