package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanActividad;
import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.dao.DaoActividadImpl;
import com.pe.ibm.interfac.DaoActividad;

public class BusinessActividad {
	
	public List<BeanActividad> listar(BeanEmpleado beanEmpleado,SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoActividad dao = new DaoActividadImpl();
		List<BeanActividad> lista = new ArrayList<BeanActividad>();
			try {
				lista = dao.listar(beanEmpleado,sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public BeanActividad listarPorID(BeanActividad bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoActividad dao = new DaoActividadImpl();
		BeanActividad beanActividad = new BeanActividad();
			try {
				beanActividad = dao.listarPorID(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return beanActividad;
		
	}
	
	public List<BeanActividad> listarHistorial(BeanActividad bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoActividad dao = new DaoActividadImpl();
		List<BeanActividad> lista = new ArrayList<BeanActividad>();
			try {
				lista = dao.listarHistorial(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public int insertar_actualizar(BeanActividad beanActividad,SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoActividad dao = new DaoActividadImpl();
		int resultado = 0;
			try {
				resultado = dao.insertUdpate(beanActividad, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
				
		return resultado;
		
	}


}
