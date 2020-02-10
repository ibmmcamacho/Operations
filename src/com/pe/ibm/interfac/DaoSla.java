package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanSla;


public interface DaoSla {

	public List<BeanSla> listar(BeanSla bean, SqlSession sqlSession);
	
}
