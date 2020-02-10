package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanSchedule;
import com.pe.ibm.bean.BeanScheduleActividad;
import com.pe.ibm.dao.DaoScheduleActividadImpl;
import com.pe.ibm.dao.DaoScheduleImpl;
import com.pe.ibm.interfac.DaoSchedule;
import com.pe.ibm.interfac.DaoScheduleActividad;

public class BusinessScheduleActividad {
	
	public List<BeanScheduleActividad> listar(BeanScheduleActividad bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoScheduleActividad dao = new DaoScheduleActividadImpl();
		List<BeanScheduleActividad> lista = new ArrayList<BeanScheduleActividad>();
			try {
				lista = dao.listar(bean, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public int insertar_actualizar(BeanScheduleActividad beanScheduleActividad,SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoScheduleActividad dao = new DaoScheduleActividadImpl();
		int resultado = 0;
			try {
				resultado = dao.insertUdpate(beanScheduleActividad, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
				
		return resultado;
		
	}
	
	public BeanScheduleActividad buscarScheduleActividad(BeanScheduleActividad bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoScheduleActividad dao = new DaoScheduleActividadImpl();
		BeanScheduleActividad lista = new BeanScheduleActividad();
			try {
				lista = dao.buscarScheduleActividad(bean, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public List<BeanScheduleActividad> listarMonitoreoIndia(BeanScheduleActividad bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoScheduleActividad dao = new DaoScheduleActividadImpl();
		List<BeanScheduleActividad> lista = new ArrayList<BeanScheduleActividad>();
			try {
				lista = dao.listarMonitoreoIndia(bean, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}

}
