package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanUsuario;
import com.pe.ibm.dao.DaoUsuarioImpl;
import com.pe.ibm.interfac.DaoUsuario;

public class BusinessUsuario {
	
	public List<BeanUsuario> listar(SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUsuario dao = new DaoUsuarioImpl();
		List<BeanUsuario> lista = new ArrayList<BeanUsuario>();
			try {
				lista = dao.listar(sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	

}
