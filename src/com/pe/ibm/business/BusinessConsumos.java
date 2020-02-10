package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanBusqueda;
import com.pe.ibm.bean.BeanConsumoBackup;
import com.pe.ibm.bean.BeanConsumoDisco;
import com.pe.ibm.bean.BeanConsumoSistema;
import com.pe.ibm.bean.BeanTarea;
import com.pe.ibm.dao.DaoConsumosImple;
import com.pe.ibm.dao.DaoTareaImpl;
import com.pe.ibm.interfac.DaoConsumos;
import com.pe.ibm.interfac.DaoTarea;

public class BusinessConsumos {
	
	public List<BeanConsumoDisco> listConsumosDisco(SqlSessionFactory ssf, BeanBusqueda beanBusqueda) {
		List<BeanConsumoDisco> lstBeanConsumoDisco = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoConsumos objDaoConsumosDiscoImple = new DaoConsumosImple();
			lstBeanConsumoDisco = objDaoConsumosDiscoImple.listConsumosDisco(session, beanBusqueda);
		} catch (Exception ex) {
			lstBeanConsumoDisco = null;
		}finally {
				session.close();
		}
		return lstBeanConsumoDisco;
	}
	
	
	public List<BeanConsumoBackup> listConsumosBackup(SqlSessionFactory ssf, BeanBusqueda beanBusqueda) {
		List<BeanConsumoBackup> lstBeanConsumoBackup = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoConsumos objDaoConsumosBackupImple = new DaoConsumosImple();
			lstBeanConsumoBackup = objDaoConsumosBackupImple.listConsumosBackup(session, beanBusqueda);
		} catch (Exception ex) {
			lstBeanConsumoBackup = null;
		}finally {
				session.close();
		}
		return lstBeanConsumoBackup;
	}
	
	public int insertarActualizarBackup(BeanConsumoBackup beanBackup, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		int resultado = 0;
		DaoConsumos dao = new DaoConsumosImple();
			try {
				resultado = dao.insertUdpateConsumoBackup(beanBackup, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
				
		return resultado;
		
	}
	
	public List<BeanConsumoSistema> listConsumosSistema(SqlSessionFactory ssf, BeanBusqueda beanBusqueda) {
		List<BeanConsumoSistema> lstBeanConsumoSistema = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoConsumos objDaoConsumosSistemaImple = new DaoConsumosImple();
			lstBeanConsumoSistema = objDaoConsumosSistemaImple.listConsumosSistema(session, beanBusqueda);
		} catch (Exception ex) {
			lstBeanConsumoSistema = null;
		}finally {
				session.close();
		}
		return lstBeanConsumoSistema;
	}

	
}
