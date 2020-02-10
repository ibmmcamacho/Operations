package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanRCT;
import com.pe.ibm.bean.BeanSuraTabla;
import com.pe.ibm.interfac.DaoSuraTabla;

public class DaoSuraTablaImpl implements DaoSuraTabla {

	
	@Override
	public List<BeanSuraTabla> listTabla1(BeanSuraTabla bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanSuraTabla> lista = new ArrayList<BeanSuraTabla>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.listarsuratabla1", bean);
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
	public List<BeanSuraTabla> listTabla2(BeanSuraTabla bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanSuraTabla> lista = new ArrayList<BeanSuraTabla>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.listarsuratabla2", bean);
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
	public List<BeanSuraTabla> listTabla3(BeanSuraTabla bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanSuraTabla> lista = new ArrayList<BeanSuraTabla>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.listarsuratabla3", bean);
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
	public List<BeanSuraTabla> listReport(BeanSuraTabla bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanSuraTabla> lista = new ArrayList<BeanSuraTabla>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.listReport", bean);
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
