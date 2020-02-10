package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanUsuario;

public interface DaoUsuario {

	public List<BeanUsuario> listar(SqlSession sqlSession);
	
	
	
}
