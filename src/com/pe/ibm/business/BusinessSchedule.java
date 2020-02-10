package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.BeanParam;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanActividad;
import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSchedule;
import com.pe.ibm.dao.DaoActividadImpl;
import com.pe.ibm.dao.DaoScheduleImpl;
import com.pe.ibm.interfac.DaoActividad;
import com.pe.ibm.interfac.DaoSchedule;

public class BusinessSchedule {
	
	public List<BeanSchedule> listar(BeanEmpleado beanEmpleado, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoSchedule dao = new DaoScheduleImpl();
		List<BeanSchedule> lista = new ArrayList<BeanSchedule>();
			try {
				lista = dao.listar(beanEmpleado, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public List<BeanSchedule> listar_schedules_activos(SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoSchedule dao = new DaoScheduleImpl();
		List<BeanSchedule> lista = new ArrayList<BeanSchedule>();
			try {
				lista = dao.listar_schedules_activos(sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public List<BeanSchedule> listar_mis_schedules(BeanSchedule beanSchedule,SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoSchedule dao = new DaoScheduleImpl();
		List<BeanSchedule> lista = new ArrayList<BeanSchedule>();
			try {
				lista = dao.listar_mis_schedules(beanSchedule, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public String generarSchedule(SqlSessionFactory ssf, BeanParameters pBeanParameters){
		SqlSession sqlSession = ssf.openSession();
		
		DaoSchedule dao = new DaoScheduleImpl();
		String strResultado = "";
			try {
				strResultado = dao.generarSchedule(sqlSession, pBeanParameters);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return strResultado;
		
	}
	
	public int insertar_actualizar(BeanSchedule beanSchedule,SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoSchedule dao = new DaoScheduleImpl();
		int resultado = 0;
			try {
				resultado = dao.insertUdpate(beanSchedule, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
				
		return resultado;
		
	}
	
}
