package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanTurno;


public interface DaoTurno {
	
	public int insertUdpate(BeanTurno beanTurno, SqlSession sqlSession);
	
	public List<BeanTurno> listar(SqlSession sqlSession);
	public List<BeanTurno> listarTurnos(BeanTurno bean, SqlSession sqlSession);
	public int saveTurno(BeanTurno bean, SqlSession sqlSession);
	public int updateTurno(BeanTurno bean, SqlSession sqlSession);
	public int updateTurnoEstado(BeanTurno bean, SqlSession sqlSession);

}
