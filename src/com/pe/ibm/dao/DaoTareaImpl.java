package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanTarea;
import com.pe.ibm.bean.BeanTareaAsignada;
import com.pe.ibm.bean.BeanTareaBacklog;
import com.pe.ibm.interfac.DaoTarea;

public class DaoTareaImpl implements DaoTarea{

	@Override
	public int insertUdpate(BeanTarea beanTarea, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		int resultado = 0;
		BeanTarea bean = new BeanTarea();
		bean = beanTarea;
			try {
				if(sqlSession!=null){
					sqlSession.selectOne("com.pe.ibm.access.MapperTarea.Insert_Update",bean);
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
	public int insertUdpateGestor(BeanTarea beanTarea, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		int resultado = 0;
		BeanTarea bean = new BeanTarea();
		bean = beanTarea;
			try {
				if(sqlSession!=null){
					sqlSession.selectOne("com.pe.ibm.access.MapperTarea.Insert_Update_Gestor",bean);
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
	public List<BeanTarea> listar(SqlSession sqlSession, BeanTarea objBeanTarea) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unused")
		BeanTarea bean = new BeanTarea();
		List<BeanTarea> lista = new ArrayList<BeanTarea>();
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTarea.listarTareas", objBeanTarea);
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
	public List<BeanTarea> listarGestor(SqlSession sqlSession, BeanTarea objBeanTarea) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unused")
		BeanTarea bean = new BeanTarea();
		List<BeanTarea> lista = new ArrayList<BeanTarea>();
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTarea.listarTareasGestor", objBeanTarea);
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
	public List<BeanTareaAsignada> listarTareasAsignadas(BeanTareaAsignada beanTareaAsignada, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unused")
		BeanTareaAsignada bean = new BeanTareaAsignada();
		List<BeanTareaAsignada> lista = new ArrayList<BeanTareaAsignada>();
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTarea.listarTareaAsignada", beanTareaAsignada);
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
	public List<BeanTareaAsignada> listarTareasGeneradas(BeanTarea objBeanTarea, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unused")
		BeanTareaAsignada bean = new BeanTareaAsignada();
		List<BeanTareaAsignada> lista = new ArrayList<BeanTareaAsignada>();
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTarea.listarTareaGenerada",objBeanTarea);
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
	public int insertUdpateTareaAsignada(BeanTareaAsignada beanTareaAsignada, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		int resultado = 0;
			try {
				if(sqlSession!=null){
					beanTareaAsignada.toString();
					sqlSession.selectOne("com.pe.ibm.access.MapperTarea.Insert_Update_TareaAsignada",beanTareaAsignada);
					resultado =  beanTareaAsignada.getResultado();	
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
	public BeanTareaAsignada buscarTareaAsignada(BeanTareaAsignada beanTareaAsignada, SqlSession sqlSession) {
		// TODO Auto-generated method stub
//		List<BeanTareaAsignada> lista = new ArrayList<BeanTareaAsignada>();
		BeanTareaAsignada bean = new BeanTareaAsignada();
		
		try {
			if(sqlSession!=null){
				System.out.println(sqlSession);
				bean = (BeanTareaAsignada) sqlSession.selectOne("com.pe.ibm.access.MapperTarea.BuscarTareaAsignada",beanTareaAsignada);
			
			}else{
				System.err.println("no hay conexi�n");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
		}
	
//		return lista.get(0); 
		return bean;

	}

	@Override
	public List<BeanTareaBacklog> listarBacklog(SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanTareaBacklog> lista = new ArrayList<BeanTareaBacklog>();
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTarea.listarTareasBacklog");
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


