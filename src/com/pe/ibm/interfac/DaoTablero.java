package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanTablero;

public interface DaoTablero {
	
	public List<BeanTablero> cboSquad(BeanTablero bean, SqlSession sqlSession);
	public List<BeanTablero> cboTribu(BeanTablero bean, SqlSession sqlSession);
	
	public List<BeanTablero> cboTeam(BeanTablero bean, SqlSession sqlSession);
	public List<BeanTablero> cboGroupOwner(BeanTablero bean, SqlSession sqlSession);
	public List<BeanTablero> cboOwner(BeanTablero bean, SqlSession sqlSession);
	public List<BeanTablero> cboClassTicket(BeanTablero bean, SqlSession sqlSession);
	public List<BeanTablero> cboSelectStatus(BeanTablero bean, SqlSession sqlSession);
	
	public List<BeanTablero> listReportT3(BeanTablero bean, SqlSession sqlSession);
	public List<BeanTablero> listReportT2(BeanTablero bean, SqlSession sqlSession);
	public List<BeanTablero> listReportT1(BeanTablero bean, SqlSession sqlSession);
	
	
	

}
