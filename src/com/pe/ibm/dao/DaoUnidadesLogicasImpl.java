package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanTurno;
import com.pe.ibm.bean.BeanUnidadesLogicas;
import com.pe.ibm.interfac.DaoUnidadesLogicas;

public class DaoUnidadesLogicasImpl implements DaoUnidadesLogicas{


	
	@Override
	public List<BeanUnidadesLogicas> listar(BeanUnidadesLogicas bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanUnidadesLogicas> lista = new ArrayList<BeanUnidadesLogicas>();
		
			try {
				if(sqlSession!=null){				
					lista = sqlSession.selectList("com.pe.ibm.access.MapperUnidadesLogicas.listarunidadeslogicas", bean );
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
	public List<BeanUnidadesLogicas> listarcomboresource(BeanUnidadesLogicas bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanUnidadesLogicas> lista = new ArrayList<BeanUnidadesLogicas>();
		
			try {
				if(sqlSession!=null){				
					lista = sqlSession.selectList("com.pe.ibm.access.MapperUnidadesLogicas.listarcomboresource", bean );
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
	public int insertUdpate(BeanUnidadesLogicas bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		int resultado = 0;
		BeanUnidadesLogicas bean2 = new BeanUnidadesLogicas();
		bean2 = bean;
			try {
				if(sqlSession!=null){
					sqlSession.selectOne("com.pe.ibm.access.MapperUnidadesLogicas.Insert_Update",bean2);
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

}
