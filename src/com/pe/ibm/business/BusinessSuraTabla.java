package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import com.pe.ibm.bean.BeanSuraTabla;
import com.pe.ibm.dao.DaoSuraTablaImpl;
import com.pe.ibm.interfac.DaoSuraTabla;

public class BusinessSuraTabla {

	
	public List<BeanSuraTabla> listTabla1(BeanSuraTabla bean, SqlSessionFactory ssf){		
		SqlSession sqlSession = ssf.openSession();			
		DaoSuraTabla dao = new DaoSuraTablaImpl();
		List<BeanSuraTabla> lista = new ArrayList<BeanSuraTabla>();
			try {
				lista = dao.listTabla1(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	
	public List<BeanSuraTabla> listTabla2(BeanSuraTabla bean, SqlSessionFactory ssf){		
		SqlSession sqlSession = ssf.openSession();			
		DaoSuraTabla dao = new DaoSuraTablaImpl();
		List<BeanSuraTabla> lista = new ArrayList<BeanSuraTabla>();
			try {
				lista = dao.listTabla2(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public List<BeanSuraTabla> listTabla3(BeanSuraTabla bean, SqlSessionFactory ssf){		
		SqlSession sqlSession = ssf.openSession();			
		DaoSuraTabla dao = new DaoSuraTablaImpl();
		List<BeanSuraTabla> lista = new ArrayList<BeanSuraTabla>();
			try {
				lista = dao.listTabla3(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	
	
	public List<BeanSuraTabla> listReport(BeanSuraTabla bean, SqlSessionFactory ssf){		
		SqlSession sqlSession = ssf.openSession();			
		DaoSuraTabla dao = new DaoSuraTablaImpl();
		List<BeanSuraTabla> lista = new ArrayList<BeanSuraTabla>();
			try {
				lista = dao.listReport(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	
	
	


	
}


