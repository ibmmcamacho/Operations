package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanBackups;
import com.pe.ibm.dao.DaoBackupsImpl;
import com.pe.ibm.interfac.DaoBackups;

public class BusinessBackups {
	
	public List<BeanBackups> listar(BeanBackups bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoBackups dao = new DaoBackupsImpl();
		List<BeanBackups> lista = new ArrayList<BeanBackups>();
			try {
				lista = dao.listar(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public List<BeanBackups> listarcomboresource(BeanBackups bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoBackups dao = new DaoBackupsImpl();
		List<BeanBackups> lista = new ArrayList<BeanBackups>();
			try {
				lista = dao.listarcomboresource(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public int insertar_actualizar(BeanBackups bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoBackups dao = new DaoBackupsImpl();
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
