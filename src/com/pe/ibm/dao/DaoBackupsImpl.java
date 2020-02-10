package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanBackups;
import com.pe.ibm.interfac.DaoBackups;

public class DaoBackupsImpl implements DaoBackups{


	
	@Override
	public List<BeanBackups> listar(BeanBackups bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanBackups> lista = new ArrayList<BeanBackups>();
		
			try {
				if(sqlSession!=null){				
					lista = sqlSession.selectList("com.pe.ibm.access.MapperBackups.listarbackups", bean );
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
	public List<BeanBackups> listarcomboresource(BeanBackups bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanBackups> lista = new ArrayList<BeanBackups>();
		
			try {
				if(sqlSession!=null){				
					lista = sqlSession.selectList("com.pe.ibm.access.MapperBackups.listarcomboresource", bean );
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
	public int insertUdpate(BeanBackups bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		int resultado = 0;
		BeanBackups bean2 = new BeanBackups();
		bean2 = bean;
			try {
				if(sqlSession!=null){
					sqlSession.selectOne("com.pe.ibm.access.MapperBackups.Insert_Update",bean2);
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
