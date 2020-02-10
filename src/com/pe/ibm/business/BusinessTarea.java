package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanTarea;
import com.pe.ibm.bean.BeanTareaAsignada;
import com.pe.ibm.bean.BeanTareaBacklog;
import com.pe.ibm.dao.DaoTareaImpl;
import com.pe.ibm.interfac.DaoTarea;


public class BusinessTarea {
	
	public List<BeanTarea> listar(SqlSessionFactory ssf, BeanTarea objBeanTarea){

		SqlSession sqlSession = ssf.openSession();
		
		DaoTarea dao = new DaoTareaImpl();
		List<BeanTarea> lista = new ArrayList<BeanTarea>();
			try {
				lista = dao.listar(sqlSession, objBeanTarea);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public List<BeanTarea> listarGestor(SqlSessionFactory ssf, BeanTarea objBeanTarea){

		SqlSession sqlSession = ssf.openSession();
		
		DaoTarea dao = new DaoTareaImpl();
		List<BeanTarea> lista = new ArrayList<BeanTarea>();
			try {
				lista = dao.listarGestor(sqlSession, objBeanTarea);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public List<BeanTareaAsignada> listarTareasAsignadas(BeanTareaAsignada beanTareaAsignada, SqlSessionFactory ssf){

		SqlSession sqlSession = ssf.openSession();
		
		DaoTarea dao = new DaoTareaImpl();
		List<BeanTareaAsignada> lista = new ArrayList<BeanTareaAsignada>();
			try {
				lista = dao.listarTareasAsignadas(beanTareaAsignada, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public List<BeanTareaAsignada> listarTareasGeneradas(BeanTarea objBenaTarea, SqlSessionFactory ssf){

		SqlSession sqlSession = ssf.openSession();
		
		DaoTarea dao = new DaoTareaImpl();
		List<BeanTareaAsignada> lista = new ArrayList<BeanTareaAsignada>();
			try {
				lista = dao.listarTareasGeneradas(objBenaTarea, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public int insertar_actualizar(BeanTarea beanTarea, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoTarea dao = new DaoTareaImpl();
		int resultado = 0;
			try {
				resultado = dao.insertUdpate(beanTarea, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
				
		return resultado;
	}
	
	public int insertar_actualizar_gestor(BeanTarea beanTarea, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoTarea dao = new DaoTareaImpl();
		int resultado = 0;
			try {
				resultado = dao.insertUdpateGestor(beanTarea, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
				
		return resultado;
	}
	
	
	public int insertar_actualizar_TareaAsignada(BeanTareaAsignada beanTareaAsignada, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoTarea dao = new DaoTareaImpl();
		int resultado = 0;
			try {
				resultado = dao.insertUdpateTareaAsignada(beanTareaAsignada, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
				
		return resultado;
		
	}
	
	public BeanTareaAsignada buscarTareaAsignada(BeanTareaAsignada bean, SqlSessionFactory ssf){
		BeanTareaAsignada objBeanTareaAsignada = new BeanTareaAsignada();
		SqlSession sqlSession = ssf.openSession();
		
		DaoTarea dao = new DaoTareaImpl();
			try {
				objBeanTareaAsignada = dao.buscarTareaAsignada(bean, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
				objBeanTareaAsignada = null;
			}finally{
				sqlSession.close();
			}
		
		return objBeanTareaAsignada;
		
	}
	
	public List<BeanTareaBacklog> listarTareasBacklog(SqlSessionFactory ssf){

		SqlSession sqlSession = ssf.openSession();
		
		DaoTarea dao = new DaoTareaImpl();
		List<BeanTareaBacklog> lista = new ArrayList<BeanTareaBacklog>();
			try {
				lista = dao.listarBacklog(sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}


}
