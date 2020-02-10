package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanTurno;
import com.pe.ibm.bean.BeanUnidadesLogicas;
import com.pe.ibm.dao.DaoTurnoImpl;
import com.pe.ibm.dao.DaoUnidadesLogicasImpl;
import com.pe.ibm.interfac.DaoTurno;
import com.pe.ibm.interfac.DaoUnidadesLogicas;

public class BusinessUnidadesLogicas {
	
	public List<BeanUnidadesLogicas> listar(BeanUnidadesLogicas bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUnidadesLogicas dao = new DaoUnidadesLogicasImpl();
		List<BeanUnidadesLogicas> lista = new ArrayList<BeanUnidadesLogicas>();
			try {
				lista = dao.listar(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public List<BeanUnidadesLogicas> listarcomboresource(BeanUnidadesLogicas bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUnidadesLogicas dao = new DaoUnidadesLogicasImpl();
		List<BeanUnidadesLogicas> lista = new ArrayList<BeanUnidadesLogicas>();
			try {
				lista = dao.listarcomboresource(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public int insertar_actualizar(BeanUnidadesLogicas bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUnidadesLogicas dao = new DaoUnidadesLogicasImpl();
		int resultado = 0;
			try {
				resultado = dao.insertUdpate(bean, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
				
		return resultado;
		
	}
}
