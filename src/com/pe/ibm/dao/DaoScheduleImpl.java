package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSchedule;
import com.pe.ibm.interfac.DaoSchedule;

public class DaoScheduleImpl implements DaoSchedule{

	@Override
	public int insertUdpate(BeanSchedule beanSchedule, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		int resultado = 0;
		BeanSchedule bean = new BeanSchedule();
		bean = beanSchedule;
			try {
				if(sqlSession!=null){
				
					sqlSession.selectOne("com.pe.ibm.access.MapperSchedule.Insert_Update",bean);
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
	
	@Override
	public List<BeanSchedule> listar(BeanEmpleado beanEmpleado, SqlSession sqlSession) {
		// TODO Auto-generated method stub

		List<BeanSchedule> lista = new ArrayList<BeanSchedule>();
		
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperSchedule.listar",beanEmpleado);
				}else{
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public List<BeanSchedule> listar_schedules_activos(SqlSession sqlSession) {
		// TODO Auto-generated method stub

		List<BeanSchedule> lista = new ArrayList<BeanSchedule>();
		
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperSchedule.listar_schedules_activos");
				}else{
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public List<BeanSchedule> listar_mis_schedules(BeanSchedule beanSchedule, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		BeanSchedule bean = new BeanSchedule();
		bean = beanSchedule;
		List<BeanSchedule> lista = new ArrayList<BeanSchedule>();
		
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperSchedule.listar_mis_schedules",bean);
				}else{
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}

	@Override
	public String generarSchedule(SqlSession sqlSession, BeanParameters pBeanParameters) {
		String resultGenerarSchedule = "";
		
		BeanSchedule bean = new BeanSchedule();
		List<BeanSchedule> lista = new ArrayList<BeanSchedule>();
		
			try {
				if(sqlSession!=null){
//					sqlSession.selectOne("com.pe.ibm.access.MapperSchedule.generarPeriodoPruebaFecha", pBeanParameters);
					sqlSession.selectOne("com.pe.ibm.access.MapperSchedule.generarSchedule", pBeanParameters);
					
					resultGenerarSchedule =  String.valueOf(pBeanParameters.getiValor1());	
				}else{
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return resultGenerarSchedule;
	}

}
