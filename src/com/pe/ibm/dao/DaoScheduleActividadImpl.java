package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BeanScheduleActividad;
import com.pe.ibm.interfac.DaoScheduleActividad;

public class DaoScheduleActividadImpl implements DaoScheduleActividad{

	@Override
	public List<BeanScheduleActividad> listar(BeanScheduleActividad bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanScheduleActividad> lista = new ArrayList<BeanScheduleActividad>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperScheduleActividad.listar", bean);
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
	public int insertUdpate(BeanScheduleActividad beanScheduleActividad, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		int resultado = 0;
		
		BeanScheduleActividad bean = new BeanScheduleActividad();
		bean = beanScheduleActividad;

			try {
				if(sqlSession!=null){
					sqlSession.selectOne("com.pe.ibm.access.MapperScheduleActividad.Insert_Update",bean);
					resultado =  bean.getResultado();	
				}else{
					System.err.println("no hay conexi�n");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}	
		return resultado;
	}

	@Override
	public BeanScheduleActividad buscarScheduleActividad(BeanScheduleActividad bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanScheduleActividad> lista = new ArrayList<BeanScheduleActividad>();
				
		try {
			if(sqlSession!=null){
				
				lista = sqlSession.selectList("com.pe.ibm.access.MapperScheduleActividad.listarScheduleActividad",bean);
			
			}else{
				System.err.println("no hay conexi�n");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
		}
	
		return lista.get(0);

	}
	
	@Override
	public List<BeanScheduleActividad> listarMonitoreoIndia(BeanScheduleActividad bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanScheduleActividad> lista = new ArrayList<BeanScheduleActividad>();
				
		try {
			if(sqlSession!=null){
				
				lista = sqlSession.selectList("com.pe.ibm.access.MapperScheduleActividad.listarMonitoreoIndia",bean);
			
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
		}
	
		return lista;

	}

}
