package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanBlackout;


public interface DaoBlackout {

	public List<BeanBlackout> listar(BeanBlackout bean, SqlSession sqlSession);
}
