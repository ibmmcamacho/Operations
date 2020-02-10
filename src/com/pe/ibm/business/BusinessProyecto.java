package com.pe.ibm.business;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.dao.DaoProyecto;
import com.pe.ibm.dao.DaoProyectoImpl;
import com.pe.ibm.bean.BeanProyecto;

public class BusinessProyecto {
	
	public List<BeanProyecto> listProyectos(String strUsuario, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		List<BeanProyecto> listProyectos= new ArrayList<BeanProyecto>();
		DaoProyecto dproyecto=new DaoProyectoImpl();
		
		try {
			
			listProyectos = dproyecto.obtenerProyectos(strUsuario, sqlSession);
		} catch (Exception ex) {
			listProyectos = null;
		}finally {
			sqlSession.close();
		}
		
		return listProyectos;
	}
	
	public List<BeanProyecto> listProyectosTodos(SqlSessionFactory ssf){
		SqlSession sqlSession = null;
		List<BeanProyecto> listProyectos= new ArrayList<BeanProyecto>();
		DaoProyecto dproyecto=new DaoProyectoImpl();
		
		try {
			sqlSession = ssf.openSession(true);
			listProyectos = dproyecto.obtenerProyectosTodos(sqlSession);
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return listProyectos;
	}
	
	
	public int  ActualizarEstadoProyecto(BeanProyecto bean, SqlSessionFactory ssf) {
		SqlSession sqlSession = ssf.openSession();
		int resultado = 0;
		DaoProyecto dproyecto=new DaoProyectoImpl();
		try {
			resultado = dproyecto.actualizarEstadoProyecto(bean, sqlSession);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultado;
	}
	
	
	
}
